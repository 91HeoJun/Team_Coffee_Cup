package com.company.service;

import java.util.List;

import com.company.domain.StoreVO;

public interface StoreService {
	public boolean insert(StoreVO store);
	public List<StoreVO> getAll();
}
