package com.docmall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.CartVO;
import com.docmall.domain.ProductVO;
import com.docmall.dto.CartDTOList;
import com.docmall.dto.Criteria;

public interface CartService {

	
	void cart_add(CartVO vo);
	List<CartDTOList> cart_list(String mbsp_id);
	
	
	List<ProductVO> pro_list();
	
	void cart_amount_change(Long cart_code, int cart_amount);
	
}
