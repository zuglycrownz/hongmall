package com.hongmall.service;

import org.springframework.stereotype.Service;

import com.hongmall.mapper.mapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class serviceimpl implements service {

	
	private final mapper memberMapper;

	@Override
	public String idCheck(String MBSP_ID) {
		// TODO Auto-generated method stub
		return memberMapper.idCheck(MBSP_ID);
	}
}
