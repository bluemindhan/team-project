package com.oracle.choongangGroup.changhun.address;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class AddRestController {

	private final AddressService addressService;
	private final AddressRepository ar;
	
	@RequestMapping("phoneLikeSave")
	public String phoneLikeSave(HttpSession session,
								@RequestParam(value = "userid") String userid) {
		String msg = null;
		
		log.info("userid 값은? -> {}",userid);
		
		String Myuserid = "18301001"; 
//		(String)session.getAttribute("userid"); 
		
		try {
			addressService.phoneLikeSave(userid,Myuserid);			
		} catch (Exception e) {
			msg = "이미 등록된 주소록입니다!";
		}
		return msg;
	}
	
	@RequestMapping("phoneLikeDelete")
	public String phoneLikeDelete(@RequestParam(value = "myUserid") String myuserid,
								  @RequestParam(value = "userid") String userid) {
		addressService.phoneLikeDelete(myuserid,userid);
	return null;
	}
}
