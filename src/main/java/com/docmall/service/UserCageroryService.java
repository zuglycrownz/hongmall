package com.docmall.service;

import java.util.List;

import com.docmall.domain.CategoryVO;

public interface UserCageroryService {

	
	List<CategoryVO> getSecondCategorylist(Integer cg_parent_code);
}
