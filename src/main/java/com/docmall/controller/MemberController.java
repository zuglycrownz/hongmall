package com.docmall.controller;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.DateOnlyTypeHandler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.docmall.domain.MemberVO;
import com.docmall.dto.LoginDTO;
import com.docmall.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {

	// https://dev-coco.tistory.com/70
	
	private final MemberService memberService;
	private final PasswordEncoder passwordencoder;
	
	
	
	@GetMapping("/join")
	public void join() {
		
		log.info("called... join");
	}
	//다른데가면 String, 안돌아오면 Void
	@PostMapping("/join")
	public String join(MemberVO vo){
		
		log.info("회원정보 :" + vo);
		
		vo.setMbsp_password(passwordencoder.encode(vo.getMbsp_password()));
		log.info("회원정보 - 비밀번호 :" + vo.getMbsp_password());
		
		memberService.join(vo);
		return "redirect:/member/login";
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("login call...");
	}
	
	@PostMapping("/login")
	public String login(LoginDTO dto, HttpSession session,RedirectAttributes rttr) {
		
		log.info("로그인데이터 : " +dto);
		
		MemberVO db_vo = memberService.login(dto.getMbsp_id());
		
		String url = "";
		String msg = "";
		
		if(db_vo != null) {
			//vo = db데이터 dto = 사용자입력데이터
			if(passwordencoder.matches(dto.getMbsp_password(),db_vo.getMbsp_password())) {
				session.setAttribute("loginStatus",db_vo);
				url ="/";
			}else {
				url ="/member/login";
				msg = "비밀번호가 일치하지 않습니다";
				rttr.addFlashAttribute("msg",msg);
			}
		}else {
			url ="/member/login";
			msg = "아이디가 일치하지 않습니다";
			rttr.addFlashAttribute("msg",msg);
		}
		return "redirect:" + url;
	}
	
	@GetMapping("/logout") 
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
	//비동기방식. ajax문법으로 호출
	
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String mbsp_id) {
		
		log.info("아이디: " + mbsp_id);
		
		ResponseEntity<String> entity = null;
		
		
		String idUse = "";
		
		if(memberService.idCheck(mbsp_id) !=null ) {
			idUse = "no";
		}
		else {
			idUse = "yes";
		}
		
		entity = new ResponseEntity<String>(idUse, HttpStatus.OK);
				
		//서비스 메서드 호출구문작업.
		
		return entity;
	}
	
}
