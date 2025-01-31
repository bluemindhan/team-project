package com.oracle.choongangGroup.changhun.attManagement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.choongangGroup.changhun.JPA.Dept;
import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.MemberMapping;
import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.address.MemberRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AttManagementController {
	
	private final AttManagementRepository repository;
	private final AttManagementService attManagementService;
	private final MemberRepository memRepository;
	
	@RequestMapping(value = "/attForm")
	public String attMyForm(Model model,
							HttpServletRequest http,
							@RequestParam(required = false, defaultValue = "0", value="page")int page) throws ParseException {
		
		System.out.println("page --> " + page);
		HttpSession session = http.getSession();
//		String userid = (String) session.getAttribute("userid");
		String userid = "18301001";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date now = new Date();
		String nowDate = sdf.format(now);
		
		//일주일 근무시간
		Map<String, String> weekWorkMap = attManagementService.sumWeekWorking(userid);
		
		//한달 근무시간
		Map<String, String> monthTotal = attManagementService.monthTotal(userid); 
		
		
		
		//내 근태내역 리스트
		Page<Work> workList = repository.findPageByMember_UseridAndWorkDateContaining(userid,nowDate,PageRequest.of(page, 5, Sort.by(Sort.Direction.ASC,"workDate")));
		
		//연차 갯수 표시
		long vacation = attManagementService.vacation(userid);
		
		model.addAttribute("attList",workList.getContent());
		model.addAttribute("weekSum",weekWorkMap.get("weekTotal"));
		model.addAttribute("weekOver",weekWorkMap.get("weekOver"));
		model.addAttribute("vacation",vacation);
		model.addAttribute("monthOver",monthTotal.get("monthOver"));
		model.addAttribute("monthTotalTime",monthTotal.get("monthTotalTime"));
		model.addAttribute("lastMonthTotal",monthTotal.get("lastMonthTotal"));
		model.addAttribute("lastMonthOver",monthTotal.get("lastMonthOver"));
		
		return "manager/attManagementForm";
	}
	
	@RequestMapping(value = "attDeptMemberForm")
	public String attAllMemberForm(Model model,
								@RequestParam(value = "deptno",defaultValue = "102") int deptno
								) throws ParseException {
		
		String userid = "18301001";
		// 현재 날짜에 대한 리스트 출력
		List<Work> attMemberList = attManagementService.attAllList(deptno);
		// 주말을 제외한 날짜 출력
		List<String> monthList = attManagementService.monthList();
		// 현재 로그인 사용자에 대한 리스트 출력
		List<String> memberList = attManagementService.memberFormList(deptno);
		
		// 현재 달 구하기
		String today = attManagementService.today();
		String Month = today.substring(0,7);
		
		model.addAttribute("Month" , Month);
		model.addAttribute("monthList" , monthList);
		model.addAttribute("attList" , attMemberList);
		model.addAttribute("memberList" , memberList);
		return "manager/attDeptMemberForm";
	}
	
	@RequestMapping(value = "attMonthChange")
	public String attMonthChange(Model model,
			@RequestParam(value = "deptno",defaultValue = "102") int deptno,
			@RequestParam(value = "month") String month) throws ParseException {
		String userid = "1";
		// 현재 날짜에 대한 리스트 출력
		List<Work> attMemberList = attManagementService.attToMonthAllList(deptno,month);
		// 주말을 제외한 날짜 출력
		List<String> monthList = attManagementService.monthChangeList(month);
		
		List<String> memberList = attManagementService.memberList(deptno,month);
		
		model.addAttribute("Month" , month);
		model.addAttribute("monthList" , monthList);
		model.addAttribute("attList" , attMemberList);
		model.addAttribute("memberList" , memberList);
		return "manager/attDeptMemberForm";
	}
	
	@RequestMapping(value = "attAllMemberForm")
	public String attAllMemberForm(Model model) {
		
		List<String> deptlist = attManagementService.findBydeptList();
		List<Member> members = memRepository.findAllByOrderByDept_deptnoAsc();
		
		model.addAttribute("deptlist", deptlist );
		model.addAttribute("members", members );
		
		return "manager/attAllMember";
	}
	
	 
	
}
