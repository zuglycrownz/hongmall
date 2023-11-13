package com.docmall.service;

import java.util.List;

import com.docmall.domain.CategoryVO;

public interface AdminCategoryService {

	
	List<CategoryVO> getFirstCategorylist();
	
	
	List<CategoryVO> getSecondCategorylist(Integer cg_parent_code);
	
	CategoryVO get(Integer cg_code);
}
