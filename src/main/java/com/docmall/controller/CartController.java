package com.docmall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.aop.target.SimpleBeanTargetSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.docmall.domain.CartVO;
import com.docmall.domain.MemberVO;
import com.docmall.domain.ProductVO;
import com.docmall.dto.CartDTOList;
import com.docmall.service.CartService;
import com.docmall.util.FileUtils;

import lombok.RequiredArgsConstructor;


@RequestMapping("/user/cart/*")
@RequiredArgsConstructor
@Controller
public class CartController {
	
	@Resource(name = "uploadPath") // servlet-context.xml 의 uploadPath bean이름 참조를 해야 함.
	private String uploadPath;
	
	private final CartService cartService;
	
	@ResponseBody
	@PostMapping("/cart_add")
	public ResponseEntity<String> cart_add(CartVO vo,HttpSession session,Model model) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		//ajax방식
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		vo.setMbsp_id(mbsp_id);
		
		cartService.cart_add(vo);
		
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
	}
	
	@ModelAttribute
	@GetMapping("/cart_list")
	public void cart_list(HttpSession session,Model model) throws Exception {
		
		String mbsp_id = ((MemberVO) session.getAttribute("loginStatus")).getMbsp_id();
		
		
		
		model.addAttribute("cart_list",cartService.cart_list(mbsp_id));
		

		List<ProductVO> pro_list = cartService.pro_list();
		
		double cart_total_price = 0;
		
//		pro_list.forEach(vo -> {
//			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));
//			
//			cart_total_price = ((double)(vo.getPro_price() - (vo.getPro_price() * vo.getPro_discount() / 100) * vo.getPro_amount()));
//		});
//		
		for(int i=0; i<pro_list.size(); i++) {
			
			ProductVO vo = pro_list.get(i);
			vo.setPro_up_folder(vo.getPro_up_folder().replace("\\", "/"));		
			cart_total_price = ((double)(vo.getPro_price() - (vo.getPro_price() * vo.getPro_discount() / 100) * vo.getPro_amount()));
		}
		
		model.addAttribute("pro_list", pro_list);
		model.addAttribute("cart_total_price", cart_total_price);
		
	}
	
	@PostMapping("/cart_amount_change")
	public ResponseEntity<String> cart_amount_change(HttpSession session,Long cart_code,int cart_amount) throws Exception {
		ResponseEntity<String> entity = null;
		cartService.cart_amount_change(cart_code, cart_amount);
		//ajax방식
		entity = new ResponseEntity<String>("success",HttpStatus.OK);
		return entity;
	}
	
	@ResponseBody
	@GetMapping("/imageDisplay") // /user/product/imageDisplay?dateFolderName=값1&fileName=값2
	public ResponseEntity<byte[]> imageDisplay(String dateFolderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + dateFolderName, fileName);
	}
}
