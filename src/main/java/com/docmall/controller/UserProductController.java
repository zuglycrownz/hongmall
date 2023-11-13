package com.docmall.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.ProductVO;
import com.docmall.dto.Criteria;
import com.docmall.dto.PageDTO;
import com.docmall.service.UserProductService;
import com.docmall.util.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/user/product/*")
@RequiredArgsConstructor
@Controller
@Log4j
public class UserProductController {
	@ModelAttribute
	@GetMapping("/pro_list")
	public void pro_list(Criteria cri , Integer cg_code, @ModelAttribute("cg_name")String cg_name) throws Exception {
		
		
		
	}
	private final UserProductService userProductService;
	
	@Resource(name = "uploadPath") // servlet-context.xml 의 uploadPath bean이름 참조를 해야 함.
	private String uploadPath;
	// /user/product/pro_list?cg_code=2차카테고리코드
	@GetMapping("/pro_list/")
	@ModelAttribute
	public String pro_list(Criteria cri , Integer cg_code,String cg_name,Model model) throws Exception {
		
		cri.setAmount(8);
		
		List<ProductVO> pro_list = userProductService.pro_list(cg_code,cri);
		System.out.println("플레이리스트"+userProductService.pro_list(cg_code,cri));
		pro_list.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});
		model.addAttribute("pro_list", pro_list);
		
		int totalCount = userProductService.getTotalCount(cg_code);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/product/pro_list";
	}
	@ResponseBody
	@GetMapping("/imageDisplay") // /admin/product/imageDisplay?dateFolderName=값1&fileName=값2
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
}
