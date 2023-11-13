package com.docmall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.docmall.domain.CategoryVO;
import com.docmall.mapper.UserCategoryMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserCageroryServiceImpl implements UserCageroryService{

	private final UserCategoryMapper userCategoryMapper;

	@Override
	public List<CategoryVO> getSecondCategorylist(Integer cg_parent_code) {
		// TODO Auto-generated method stub
		return userCategoryMapper.getSecondCategorylist(cg_parent_code);
	}
}
