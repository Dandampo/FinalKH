package com.kh.web.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.web.model.member.dto.MemberVo_Test_JG;
import com.kh.web.service.member.MemberService2;


@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/member/*") // 모든맵핑은 /member/를 상속
public class MypageController {
private static final Logger logger = LoggerFactory.getLogger(MemberController2.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Inject
	MemberService2 memberService2;
	

	 // 04. mypage(지울거에요 테스트좀 할게여)
	 	@RequestMapping("mypageMain.do")
	 	public String mypageMain(){
	 		return "member/mypage_main";	// views/member/mypageMain.jsp로 포워드
	 	}
	 	
	 	@RequestMapping("mypageJourney.do")
	 	public String mypageJourney(){
	 		return "member/mypage_journey";	// views/member/mypageJourney.jsp로 포워드
	 	}
	 	@RequestMapping("mypageUpdatemember.do")
	 	public String mypageUpdatemember(){
	 		return "member/mypage_updatemember";	// views/member/mypageUpdatemember.jsp로 포워드
	 	}
	    
	

}
