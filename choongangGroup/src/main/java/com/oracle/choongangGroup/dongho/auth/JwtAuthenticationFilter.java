	package com.oracle.choongangGroup.dongho.auth;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.GenericFilterBean;

import io.jsonwebtoken.Claims;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
@Slf4j
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends GenericFilterBean {

    private final JwtTokenProvider jwtTokenProvider;
    private final SecurityService securityService;
    private final HttpServletResponse httpResponse;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
    	log.info("====JwtAuthenticationFilter Start====");
        // Request Header cookie 에서 JWT 토큰 추출
        String accessToken = resolveAccessToken((HttpServletRequest) request);
        String refreshToken = resolveRefreshToken((HttpServletRequest) request);
        
        // 토큰 검사 및 결과값 저장
        try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
        boolean validateAccessToken = jwtTokenProvider.validateToken(accessToken);
        log.info("AccessToken 유효성 검사 결과 : {}", validateAccessToken);
        boolean validateRefreshToken = jwtTokenProvider.validateToken(refreshToken);
        log.info("RefreshToken 유효성 검사 결과 : {}", validateRefreshToken);
        // 토큰 상태에 따라 로직 수행
        // validateToken 으로 토큰 유효성 검사
        if (accessToken != null && validateAccessToken) {
        	log.info("===JwtAuthenticationFilter validateToken1 start===");
            // 토큰이 유효할 경우 토큰에서 Authentication 객체를 가지고 와서 SecurityContext 에 저장
            Authentication authentication = jwtTokenProvider.getAuthentication(accessToken);
            log.info("JwtAuthenticationFilter jwtTokenProvider.getAuthentication : {}", authentication.getName());
            SecurityContextHolder.getContext().setAuthentication(authentication);

            // AT 유효기간 지나고 RT가 null이 아니면 RT 검증후 AT,RT 재발급
        } else if (accessToken != null && !validateAccessToken && refreshToken != null) {
        	log.info("===JwtAuthenticationFilter validateToken2 start===");
        	log.info("====accessToken 만료, refreshToken 유효성 검사 시작====");
        	// AT로부터 memberId 받기
        	Claims claims = jwtTokenProvider.parseClaims(accessToken);
        	String userid = claims.getSubject();
        	log.info("JwtAuthenticationFilter validateToken2 userid : {}", userid);
        	// AT로부터 authentication 객체 받기
        	Authentication authentication = jwtTokenProvider.getAuthentication(accessToken);
        	log.info("JwtAuthenticationFilter validateToken2 getAuthentication Done");
        	// RT db에 있는 RT 와 일치하는지 검사
        	boolean equalRefreshToken = jwtTokenProvider.existsRefreshToken(refreshToken , userid);
        	log.info("JwtAuthenticationFilter validateToken2 RefreshToken DB값 일치 : {}", equalRefreshToken);
        	
        	// RT가 만료되지 않고 DB RT 와 일치하는 경우
        	if (validateRefreshToken && equalRefreshToken) {
        		log.info("===validateRefreshToken && equalRefreshToken start===");
        		log.info("===AccessToken 만료, RefreshToken 유효하므로 토큰 재발급===");
        		// 새 AT, RT 생성
				TokenInfo newTokenInfo = jwtTokenProvider.generateToken(authentication);
				String newAT = URLEncoder.encode(newTokenInfo.getAccessToken(), "utf-8");
		        String newRT = URLEncoder.encode(newTokenInfo.getRefreshToken(), "utf-8");
		        // AT로부터 authentication 객체 받기
		        Authentication newAuthentication = jwtTokenProvider.getAuthentication(newAT);
		        // 새로운 토큰에서 Authentication 객체를 가지고 와서 SecurityContext 에 저장
		        SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		        // 새 RT DB에 저장
		        securityService.saveRefreshToken(newRT, userid);
		        
		        // 쿠키에 새로운 AT , RT 저장
		        Cookie cookieAT = new Cookie("AccessToken","Bearer" + newAT);
		        Cookie cookieRT = new Cookie("RefreshToken", "Bearer" + newRT);
		        //cookie.setMaxAge(7 * 24 * 60 * 60); // 유효시간을 정하지 않으면 session cookie (휘발성. 브라우저종료시 삭제)
		        cookieAT.setPath("/");
		        // httpOnly true -> javascript에 의한 토큰탈취 XSS공격 방지 (Cross Site Scripting)
		        // http통신에서만 사용되게 하므로 클라이언트단 javascript(document.cookie)로 cookie정보 확인 불가
		        cookieAT.setHttpOnly(true);
		        cookieRT.setPath("/");
		        cookieRT.setHttpOnly(true);
		        httpResponse.addCookie(cookieAT);
		        httpResponse.addCookie(cookieRT);
		        log.info("");
			} else if(!validateAccessToken && !validateRefreshToken) {
				log.info("======AccessToken ,refreshToken 만료! 로그인 페이지로 이동======");
			}
        }
        chain.doFilter(request, response);
    }

    // Request Header (cookie) 에서 access토큰 정보 추출
    private String resolveAccessToken(HttpServletRequest request) {
        Cookie[] list = request.getCookies();
        String bearerToken = "";
        if (list != null) {
        	for (Cookie cookie : list) {
    			if (cookie != null && cookie.getName().equals("AccessToken")) {
    				bearerToken = cookie.getValue();
    				if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer")) {
    					// 쿠키 value에서 bearer 부분 제외한 token만 추출
    		            return bearerToken.substring(6);
    		        }
    			}
    		}
		}
		return null;
    }
    // Request Header (cookie) 에서 refresh토큰 정보 추출
    private String resolveRefreshToken(HttpServletRequest request) {
    	Cookie[] list = request.getCookies();
    	String bearerToken = "";
    	if (list != null) {
    		for (Cookie cookie : list) {
    			if (cookie != null && cookie.getName().equals("RefreshToken")) {
    				bearerToken = cookie.getValue();
    				if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer")) {
    					// 쿠키 value에서 bearer 부분 제외한 token만 추출
    					return bearerToken.substring(6);
    				}
    			}
    		}
    	}
    	return null;
    }
}
