package com.docmall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.domain.ProductVO;
import com.docmall.mapper.OrderMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {

	private final OrderMapper orderMapper;

	@Override
	public List<ProductVO> pro_list() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
