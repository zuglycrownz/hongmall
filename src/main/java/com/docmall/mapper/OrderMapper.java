package com.docmall.mapper;

import org.apache.ibatis.annotations.Param;

import com.docmall.domain.OrderVO;
import com.docmall.domain.PaymentVO;

public interface OrderMapper {

	
	int getOrderSeq(); //주문번호
	
	
	//주문하기
	void order_insert(OrderVO o_vo); //주문테이블 저장
	
	
	//상세데이터 넣기
	void order_detail_insert(@Param("ord_code") Long ord_code,@Param("mbsp_id") String mbsp_id);
	
	//장바구니 내역 삭제
	void cart_del(String mbsp_id);
	
	void payment_insert(PaymentVO p_vo);
	
	// 위에 세개는 하나.
}
