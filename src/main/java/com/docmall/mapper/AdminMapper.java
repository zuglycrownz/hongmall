package com.docmall.mapper;

import java.util.Date;

import com.docmall.domain.AdminVO;

public interface AdminMapper {

	
	AdminVO admin_ok(String admin_id);
	
	public Date login_date(String admin_id);
}
