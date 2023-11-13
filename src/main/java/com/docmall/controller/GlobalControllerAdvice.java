package com.docmall.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.docmall.domain.CategoryVO;
import com.docmall.service.AdminCategoryService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequiredArgsConstructor
@Log4j
@ControllerAdvice(basePackages = {"com.docmall.controller"})
public class GlobalControllerAdvice {
	
	private final AdminCategoryService adminCategoryService;
	
	@ModelAttribute
	public void getFirstCategoryList(Model model) {
		log.info("1차카테고리 리스트");
		List<CategoryVO> firstCategorylist = adminCategoryService.getFirstCategorylist();
		model.addAttribute("firstCategorylist", firstCategorylist);
		
	}	


}
