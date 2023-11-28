package com.docmall.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.docmall.domain.MemberVO;
import com.docmall.domain.PageDTO;
import com.docmall.domain.ReviewVO;
import com.docmall.dto.Criteria;
import com.docmall.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequiredArgsConstructor
@Log4j
@RequestMapping("/user/review/*")
@RestController
public class ReviewController {

	private final ReviewService reviewService;
	
	//@requestboay : JSON 데이터를 REviewVO객체로 변환해주는 기능 -> 반대기능은 어노테이션 @REsponsebady
	@PostMapping(value = "/new" , consumes = "application/json" , produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String>review_insert(@RequestBody ReviewVO vo, HttpSession session) throws Exception {
		
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		ResponseEntity<String> entity = null;
		log.info("리뷰" + vo);
		
		reviewService.review_insert(vo);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		

		
		//db저장작업
		
		
		return entity;
	}
	//전통적인방식 /list?pro_num=123&page=1, Rest API개발이후 list/123/1
	@GetMapping("/list/{pro_num}/{page}")
	public ResponseEntity<Map<String, Object>> list(@PathVariable("pro_num") Integer pro_num,@PathVariable("page") int page) throws Exception {
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();

		//상품후기목록
		Criteria cri = new Criteria();
		
		cri.setAmount(5);
		cri.setPageNum(page);
		//db연동작업
		
		List<ReviewVO> list = reviewService.list(pro_num, cri);
		

		int listCount = reviewService.listCount(pro_num);
		PageDTO pageMaker = new PageDTO(cri, listCount);
		
		map.put("list", list);
		map.put("pageMaker", pageMaker);
		

		//map ->json으로 변환
		entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		
		return entity;
	}
	
	
	@DeleteMapping("/delete/{rew_num}") ///user/review/delete/1
	public ResponseEntity<String> deletEntity(@PathVariable("rew_num") Long rew_num)throws Exception {
		ResponseEntity<String> entity = null;
		
		
		reviewService.delete(rew_num);
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		
		
		return entity;
	}
	
	@PutMapping(value = "/modify" , consumes = "application/json" , produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String>review_modify(@RequestBody ReviewVO vo, HttpSession session) throws Exception {
		
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		ResponseEntity<String> entity = null;
		log.info("리뷰" + vo);
		
		reviewService.review_modify(vo);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		

		
		//db저장작업
		
		
		return entity;
	}
}
