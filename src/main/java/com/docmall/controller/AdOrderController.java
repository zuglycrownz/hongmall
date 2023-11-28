package com.docmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.OrderVO;
import com.docmall.domain.ProductVO;
import com.docmall.domain.ReviewVO;
import com.docmall.dto.Criteria;
import com.docmall.dto.PageDTO;
import com.docmall.service.AdOrderService;
import com.docmall.util.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/admin/order")
public class AdOrderController {
	@Resource(name = "uploadPath") // servlet-context.xml 의 uploadPath bean이름 참조를 해야 함.
	private String uploadPath;
	
	
	private final AdOrderService adOrderService;
	
	@GetMapping("/order_list")
	public void pro_list(Criteria cri, Model model) throws Exception {
		
		// this(1, 10);
		// 10 -> 2
		cri.setAmount(2);
		
		
		List<OrderVO> order_list = adOrderService.order_list(cri);
		

		model.addAttribute("order_list", order_list);
		
		int totalCount = adOrderService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	@GetMapping("/order/detail/{ord_code}")
	public ResponseEntity<List<String>> list(@PathVariable("pro_num") Integer pro_num,@PathVariable("page") int page) throws Exception {
		
		ResponseEntity<List<String>> entity = null;
	
//		
//		List<ReviewVO> list = reviewService.list(pro_num);
//		
//
//		
//		entity = new ResponseEntity<List<String>>(list,HttpStatus.OK);
		
		return entity;
	}
	//상품리스트에서 보여줄 이미지.  <img src="매핑주소">
	@ResponseBody
	@GetMapping("/imageDisplay") // /admin/product/imageDisplay?dateFolderName=값1&fileName=값2
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
}
