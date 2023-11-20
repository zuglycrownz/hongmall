package com.docmall.service;

import com.docmall.domain.OrderVO;
import com.docmall.domain.PaymentVO;

public interface OrderService {
	
	int getOrderSeq();
	
//	List<ProductVO> pro_list();
	
	void order_insert(OrderVO o_vo,PaymentVO p_vo);
	
}
