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

import com.docmall.domain.OrderDetailInfoVO;
import com.docmall.domain.OrderDetailProductVO;
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
	public void pro_list(Criteria cri, Model model,@ModelAttribute("start_date") String start_date,@ModelAttribute("end_date") String end_date) throws Exception {
		
		// this(1, 10);
		// 10 -> 2
		cri.setAmount(2);
		
		
		List<OrderVO> order_list = adOrderService.order_list(cri,start_date,end_date);
		

		model.addAttribute("order_list", order_list);
		
		int totalCount = adOrderService.getTotalCount(cri,start_date,end_date);
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
	}
	//json으로 변환한거 전송
	@GetMapping("/order_detail_info1/{ord_code}")
	public ResponseEntity<List<OrderDetailInfoVO>> order_detail_list1(@PathVariable("ord_code") Long ord_code) throws Exception {
		
		ResponseEntity<List<OrderDetailInfoVO>> entity = null;
		List<OrderDetailInfoVO> orderDetailList = adOrderService.orderDetailInfo1(ord_code);
		
		orderDetailList.forEach(vo -> {
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
		});

		entity = new ResponseEntity<List<OrderDetailInfoVO>>(orderDetailList,HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/order_product_delete")
	public String order_product_delete(Criteria cri, Long ord_code,Integer pro_num) {
		
		adOrderService.order_product_delete(ord_code, pro_num);
		
		return "redirect:/admin/order/order_list";
	}
	
	//상품리스트에서 보여줄 이미지.  <img src="매핑주소">
	@ResponseBody
	@GetMapping("/imageDisplay") // /admin/product/imageDisplay?dateFolderName=값1&fileName=값2
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
	@GetMapping("/order_detail_info2/{ord_code}")
	public String order_detail_list2(@PathVariable("ord_code") Long ord_code,Model model)throws Exception {
		
		List<OrderDetailProductVO> orderDetailList = adOrderService.orderDetailInfo2(ord_code);
		
		
		orderDetailList.forEach(vo -> {
			vo.getProductVO().setPro_up_folder(vo.getProductVO().getPro_up_folder().replace("\\", "/"));
		});
		
		
		model.addAttribute("orderProductlist",orderDetailList);
		
		return "/admin/order/order_detail_product";
	}
}
