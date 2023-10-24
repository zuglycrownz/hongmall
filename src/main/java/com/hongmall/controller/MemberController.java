package com.hongmall.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hongmall.service.serviceimpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@RequiredArgsConstructor
@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {
	
private final serviceimpl serviceimpl;

@GetMapping("/join")
public void join() {
	
	log.info("called.... join");
}

@GetMapping("/idCheck")
public ResponseEntity<String> idcheck(String mbsp_id) {
	
	log.info("아이디 :" + mbsp_id);
	
	ResponseEntity<String> entity = null;
	
	return entity;
}


}
