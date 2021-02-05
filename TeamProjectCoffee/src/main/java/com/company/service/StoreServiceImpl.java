package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.StoreVO;
import com.company.mapper.StoreMapper;
@Service("StoreService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper mapper;
	
	@Override
	public boolean insert(StoreVO store) {
		return mapper.insert(store)>0?true:false;
	}

}
