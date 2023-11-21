package com.docmall.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.CartVO;
import com.docmall.domain.MemberVO;
import com.docmall.domain.OrderVO;
import com.docmall.domain.PaymentVO;
import com.docmall.domain.OrderDetailVO;
import com.docmall.domain.ProductVO;
import com.docmall.dto.CartDTOList;
import com.docmall.kakaopay.ApproveResponse;
import com.docmall.kakaopay.ReadyResponse;
import com.docmall.service.CartService;
import com.docmall.service.KakaoPayServiceImpl;
import com.docmall.service.OrderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/user/order/*")
public class OrderController {

	
	private final OrderService orderService;
	
	private final CartService cartservice;
	
	private final KakaoPayServiceImpl kakaoPayServiceImpl;
	
	@GetMapping("/order_info")
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
		
		//ord_status,payment_status 정보존재안함
	}
	@GetMapping("/order_ready")
	public String order_ready(CartVO vo,HttpSession session) throws Exception {
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		
		cartservice.cart_add(vo);
		
		return "redirect:/user/order/order_info";
	}
	
	@GetMapping(value = "/orderPay",produces="application/json")
	public @ResponseBody ReadyResponse payReady(OrderVO o_vo,PaymentVO p_vo,String paymethod,int totalprice,HttpSession session) throws Exception {
		

		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		o_vo.setMbsp_id(mbsp_id);
		
		log.info("결제방법 :"  + paymethod);
		log.info("주문정보 :" + o_vo );
		
		
		Long ord_code = (long)orderService.getOrderSeq();
		
		p_vo.setOrd_code(ord_code);
		p_vo.setMbsp_id(mbsp_id);
		p_vo.setPay_method("카카오페이");
		p_vo.setPay_tot_price(totalprice);
		
		o_vo.setOrd_code(ord_code);
		o_vo.setOrd_status("주문완료");
		o_vo.setPayment_status("결제완료");
		
		//결제 3가지 콤보네이션
		
		
		List<CartDTOList> cart_list = cartservice.cart_list(mbsp_id);
		

		
		String itemName = cart_list.get(0).getPro_name() + "외" + String.valueOf(cart_list.size() - 1) + "건"	;	
		//결제준비요청
		ReadyResponse readyResponse = kakaoPayServiceImpl.payReady(o_vo.getOrd_code(), itemName, totalprice, mbsp_id, totalprice);
		
		
		orderService.order_insert(o_vo,p_vo); //주문,주문상세 정보저장,장바구니 삭제
		
		log.info("결제고유번호" + readyResponse.getTid());
		log.info("결제요청URL" + readyResponse.getNext_redirect_pc_url());
		
		session.setAttribute("tid", readyResponse.getTid());
		session.setAttribute("ord_code",o_vo.getOrd_code());
		
		
		
		return readyResponse;
	}
	
	//결제승인요청
	//http://localhost:9090/user/order/orderApproval
	@GetMapping("/orderApproval")
	public String orderApproval(@RequestParam("pg_token") String pg_token, HttpSession session) {
		
		Long ord_code = (Long)session.getAttribute("ord_code");
		String tid = (String)session.getAttribute("tid");
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		// 2)결제승인요청작업
		ApproveResponse approveResponse = kakaoPayServiceImpl.payApprove(ord_code, tid, pg_token, mbsp_id);
		
		session.removeAttribute("ord_code");
		session.removeAttribute("tid");
		
		return "redirect:/user/order/orderComplete";
	}
	//http://localhost:9090/user/order/orderComplete
	//결제성공시주소
	@GetMapping("/orderComplete")
	public void orderComplete(HttpSession session) {
		session.removeAttribute("loginStatus");
	}
	//결제실패시주소
	@GetMapping("/orderFail")
	public void orderFail() {
		
	}
	
	@GetMapping("/nobank")
	public ResponseEntity<String> nobank(OrderVO o_vo,PaymentVO p_vo,String paymethod,int totalprice,HttpSession session) {
		
		ResponseEntity<String> entity = null;
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		o_vo.setMbsp_id(mbsp_id);
		

		
		Long ord_code = (long)orderService.getOrderSeq();
		o_vo.setOrd_code(ord_code);
		o_vo.setOrd_status("주문완료");
		o_vo.setPayment_status("결제완료");
		
		
		p_vo.setPay_method("무통장입금");
		p_vo.setOrd_code(ord_code);
		p_vo.setMbsp_id(mbsp_id);
		p_vo.setPay_tot_price(totalprice);
		p_vo.setPay_nobank_price(totalprice);
		//결제 3가지 콤보네이션
		
		log.info("결제방법 :"  + paymethod);
		log.info("주문정보 :" + o_vo );
		log.info("주문정보 :" + p_vo );
		
		List<CartDTOList> cart_list = cartservice.cart_list(mbsp_id);
		

		
		String itemName = cart_list.get(0).getPro_name() + "외" + String.valueOf(cart_list.size() - 1) + "건"	;	
		//결제준비요청
		ReadyResponse readyResponse = kakaoPayServiceImpl.payReady(o_vo.getOrd_code(), itemName, totalprice, mbsp_id, totalprice);
		
		
		orderService.order_insert(o_vo,p_vo); //주문,주문상세 정보저장,장바구니 삭제
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		return entity;
	}
	
	
}
