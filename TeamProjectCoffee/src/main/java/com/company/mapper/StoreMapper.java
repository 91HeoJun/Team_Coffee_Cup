package com.company.mapper;

import java.util.List;

import com.company.domain.StoreVO;

public interface StoreMapper {

	//매장 등록
	public int insert(StoreVO store);
	//매장 리스트 가져오기
	public List<StoreVO> selectAll();
}
