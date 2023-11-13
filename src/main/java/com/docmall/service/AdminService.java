package com.docmall.service;

import java.util.Date;

import com.docmall.domain.AdminVO;

public interface AdminService {

	
	public Date login_date(String admin_id);
	
	AdminVO admin_ok(String admin_id);
}
