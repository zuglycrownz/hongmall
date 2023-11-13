package com.docmall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.domain.CategoryVO;
import com.docmall.mapper.AdminCategoryMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class AdminCategoryServiceImpl  implements AdminCategoryService{

	private final AdminCategoryMapper adminCategoryMapper;

	@Override
	public List<CategoryVO> getFirstCategorylist() {
		// TODO Auto-generated method stub
		return adminCategoryMapper.getFirstCategorylist();
	}

	@Override
	public List<CategoryVO> getSecondCategorylist(Integer cg_parent_code) {
		// TODO Auto-generated method stub
		return adminCategoryMapper.getSecondCategorylist(cg_parent_code);
	}

	@Override
	public CategoryVO get(Integer cg_code) {
		// TODO Auto-generated method stub
		return adminCategoryMapper.get(cg_code);
	}


}
