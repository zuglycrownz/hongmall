package com.docmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.MemberVO;
import com.docmall.domain.OrderVO;
import com.docmall.domain.OrderDetailVO;
import com.docmall.domain.ProductVO;
import com.docmall.dto.CartDTOList;
import com.docmall.kakaopay.ReadyResponse;
import com.docmall.service.CartService;
import com.docmall.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/user/order")
public class OrderController {

	
	private final OrderService oderService;
	
	private final CartService cartservice;
	
	@GetMapping("/orderListInfo")
	public void orderListInfo(HttpSession session, Model model) {
		List<ProductVO>  order_info = cartservice.pro_list();
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		
		model.addAttribute("order_list",cartservice.cart_list(mbsp_id));
		
		
		double order_price = 0;
		
//		pro_list.forEach(vo -> {
//			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
//			
//			cart_total_price = ((double)(vo.getPro_price() - (vo.getPro_price() * vo.getPro_discount() / 100) * vo.getPro_amount()));
//		});
	//	
		for(int i=0; i<order_info.size(); i++) {
			
			ProductVO vo = order_info.get(i);
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));		
			order_price = ((double)(vo.getPro_price() - (vo.getPro_price() * vo.getPro_discount() / 100) * vo.getPro_amount()));
		}
		model.addAttribute("order_info", order_info);
		model.addAttribute("order_price", order_price);
		
//		model.addAttribute("pro_list", pro_list);
//		model.addAttribute("cart_total_price", cart_total_price);
//		 f8ccc077f6a23c53a9da7f63ec52b981
	}
	@GetMapping(value = "/oderpay",produces="application/json")
	public @ResponseBody ReadyResponse payReady(OrderVO o_vo,OrderDetailVO od_vo,int totalamount,HttpSession session) throws Exception {
		
		return null;
	}
	//결제성공시주소
	@GetMapping("/orderApproval")
	public void orderApproval() {
		
	}
	//결제취소시주소
	@GetMapping("/orderCancel")
	public void orderCancel() {
		
	}
	//결제실패시주소
	@GetMapping("/orderFail")
	public void orderFail() {
		
	}
	
}
