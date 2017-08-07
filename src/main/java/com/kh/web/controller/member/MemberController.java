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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.web.model.member.dto.MemberVO;
import com.kh.web.service.member.MemberService;


@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/member/*") // 모든맵핑은 /member/를 상속
public class MemberController {
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Inject
	MemberService memberService;
	
	// 01. 로그인 화면 
	@RequestMapping("login.do")
	public String login(){
		return "member/login";	// views/member/login.jsp로 포워드
	}
	
	// 1. 사용자가 계정을 생성한다.
	// 2. 사용자의 비밀번호는 해싱되어 데이터베이스에 저장된다. 원본 패스워드는 하드 디스크 어디에도 기록되지 않는다.
	// 3. 사용자가 로그인을 시도 할 때 사용자가 입력한 패스워드의 해시값이 데이터베이스에 저장된 값과 동일 한지 비교 한다.
	// 4. 만약 해시값이 동일하면, 사용자는 로그인에 성공하고 아니면 잘못된 값을 입력했다고 알려준다.
	// 5. 로그인을 계속 시도 하는경우 3~4번 과정을 반복한다.
	
	// 02. 로그인 처리
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session){
		boolean result = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();

		if (result == true) { // 로그인 성공
			// main.jsp로 이동
			mav.setViewName("home");
			mav.addObject("msg", "success");
		} else {	// 로그인 실패
			// login.jsp로 이동
			mav.setViewName("member/login");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	// 03. 로그아웃 처리
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session){
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
    // 04 회원 목록
    // url pattern mapping
    @RequestMapping("memberList.do")
    public String memberList(Model model){
    // controller => service => dao 요청
        List<MemberVO> list = memberService.memberList();
        model.addAttribute("list", list);
        return "member/memberList";
    }
	
    
    // 05_01 회원 등록 페이지로 이동
    @RequestMapping("memberWrite.do")
    public String memberWrite(){
        
        return "member/memberWrite";
    }
    
    // 05_02 회원 등록 처리 후 ==> 회원목록으로 리다이렉트
    // @ModelAttribute에 폼에서 입력한 데이터가 저장된다.
    @RequestMapping("memberInsert.do")
    // * 폼에서 입력한 데이터를 받아오는 법 3가지 
    //public String memberInsert(HttpServlet request){
    //public String memberInsert(String userId, String userPw, String userName, String userEmail){
    public String memberInsert(@ModelAttribute MemberVO vo){
        // 테이블에 레코드 입력
    	String encryptPassword = passwordEncoder.encode(vo.getUserPw());
    	logger.info(encryptPassword);
    	vo.setUserPw(encryptPassword);
   	
        memberService.insertMember(vo);
        // * (/)의 유무에 차이
        // /member/list.do : 루트 디렉토리를 기준
        // member/list.do : 현재 디렉토리를 기준
        // member_list.jsp로 리다이렉트
        return "redirect:/member/memberList.do";
    }
    
    // 06 회원 상세정보 조회
    @RequestMapping("memberView.do")
    public String memberView(String userId, Model model){
        // 회원 정보를 model에 저장
        model.addAttribute("dto", memberService.viewMember2(userId));
        //System.out.println("클릭한 아이디 확인 : "+userId);
        logger.info("클릭한 아이디 : "+userId);
        // member_view.jsp로 포워드
        return "member/memberView";
    }
    
    // 08. 회원 정보 수정 처리
    @RequestMapping("memberUpdate.do")
    public String memberUpdate(@ModelAttribute MemberVO vo, Model model){
		// 비밀번호 체크
		boolean result = memberService.checkPw(vo.getUserId(), vo.getUserPw());
		if (result) { // 비밀번호가 일치하면 수정 처리후, 전체 회원 목록으로 리다이렉트
			memberService.updateMember(vo);
			return "redirect:/member/memberList.do";
		} else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
			// 가입일자, 수정일자 저장 -> 원래 페이지로 돌아갈 때 기존 정보를 띄우기 위해서...
			MemberVO vo2 = memberService.viewMember2(vo.getUserId());
			vo.setUserRegdate(vo2.getUserRegdate());
			vo.setUserUpdatedate(vo2.getUserUpdatedate());
			model.addAttribute("dto", vo);
			model.addAttribute("message", "비밀번호 불일치");
			return "member/memberView";
		}
	}
    
    // 09. 회원정보 삭제 처리
    // @RequestMapping : url mapping
    // @RequestParam : get or post방식으로 전달된 변수값
    @RequestMapping("memberDelete.do")
    public String memberDelete(@RequestParam String userId, @RequestParam String userPw, Model model){
        // 비밀번호 체크
        boolean result = memberService.checkPw(userId, userPw);
        if(result){ // 비밀번호가 맞다면 삭제 처리후, 전체 회원 목록으로 리다이렉트
            memberService.deleteMember(userId);
            return "redirect:/member/memberList.do";
        } else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력, viwe.jsp로 포워드
            model.addAttribute("message", "비밀번호 불일치");
            model.addAttribute("dto", memberService.viewMember2(userId));
            return "member/memberView";
        }
    }
    
    
}




















