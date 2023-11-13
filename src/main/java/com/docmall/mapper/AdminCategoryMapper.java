package com.docmall.mapper;

import java.util.List;

import com.docmall.domain.CategoryVO;

public interface AdminCategoryMapper {

	
	List<CategoryVO> getFirstCategorylist();
	
	List<CategoryVO> getSecondCategorylist(Integer cg_parent_code);
	
	CategoryVO get(Integer cg_code);
}
