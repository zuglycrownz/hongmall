package com.docmall.service;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.docmall.domain.AdminVO;
import com.docmall.mapper.AdminMapper;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

	
	public final AdminMapper adminMapper;

	@Override
	public AdminVO admin_ok(String admin_id) {
		// TODO Auto-generated method stub
		return adminMapper.admin_ok(admin_id);
	}

	@Override
	public Date login_date(String admin_id) {
		// TODO Auto-generated method stub
		
		return adminMapper.login_date(admin_id);
	}
}
