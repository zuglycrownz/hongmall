package com.docmall.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.docmall.domain.MemberVO;
import com.docmall.dto.EmailDTO;
import com.docmall.service.EmailService;
import com.docmall.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/email/*")
public class EmailController {

	private final EmailService emailService;
	
	@GetMapping("/authcode")
	public ResponseEntity<String> authSend(EmailDTO dto,HttpSession session) {
		
		log.info("전자우편정보 :" + dto);
		
		 ResponseEntity<String> entity = null;
		 
		 String authCode = "";
		 for(int i=0; i<6; i++) {
			 authCode += String.valueOf((int)(Math.random() * 10)); 
		 }
		 log.info("인증코드 :" + authCode);
		 
		 session.setAttribute("authCode",authCode);
		 
		 try {
			emailService.sendMail(dto, authCode);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		 return entity;
	}
	
	@GetMapping("/confirmAuthcode")
	public ResponseEntity<String> confirmAuthcode(String authcode, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		log.info(authcode);
//		String sAuthcode = "";
		if(session.getAttribute("authCode")!=null) {
		if(authcode.equals(session.getAttribute("authCode"))) {
			
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
			
		}else {
			entity = new ResponseEntity<String>("fail",HttpStatus.OK);
			
		}
		}else {
			entity = new ResponseEntity<String>("request",HttpStatus.OK);
		}
		
		
		return entity;
	}
	
	

	
}
