package com.docmall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.docmall.domain.OrderVO;
import com.docmall.domain.PaymentVO;
import com.docmall.domain.ProductVO;
import com.docmall.mapper.OrderMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {

	private final OrderMapper orderMapper;

//	@Override
//	public List<ProductVO> pro_list() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int getOrderSeq() {
		// TODO Auto-generated method stub
		return orderMapper.getOrderSeq();
	}

	
	@Transactional //트랜잭션. 여러 작업을 할때 1,2번이 성공하더라고 3번이 실패하면 1,2번도 실패로처리. 하나로 묶어준다 생각하면됨
	@Override
	public void order_insert(OrderVO o_vo,PaymentVO p_vo) {
		// TODO Auto-generated method stub
		orderMapper.order_insert(o_vo);
		orderMapper.order_detail_insert(o_vo.getOrd_code(),o_vo.getMbsp_id());
		orderMapper.cart_del(o_vo.getMbsp_id());
		orderMapper.payment_insert(p_vo);
	}


	
	
	
	
}
