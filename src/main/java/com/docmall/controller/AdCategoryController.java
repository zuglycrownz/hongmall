package com.docmall.controller;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.CategoryVO;
import com.docmall.service.AdminCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Log4j
@Controller
@RequestMapping("/admin/category/**")
public class AdCategoryController {


	private final AdminCategoryService adminCategoryService;
	
	@ResponseBody
	@GetMapping("/secondCategory/{cg_parent_code}")
	public ResponseEntity<List<CategoryVO>> secondCategory(@PathVariable("cg_parent_code") Integer cg_parent_code, Model model) throws Exception{
		
		log.info("1차카테고리 코드 :" + cg_parent_code);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		
		entity = new ResponseEntity<List<CategoryVO>>(adminCategoryService.getSecondCategorylist(cg_parent_code),HttpStatus.OK);
		
		model.addAttribute("SecondCategorylist", entity);
		return entity;
	}
}
