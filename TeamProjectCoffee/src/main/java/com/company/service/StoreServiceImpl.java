package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.StoreVO;
import com.company.mapper.StoreAttachMapper;
import com.company.mapper.StoreMapper;
@Service("StoreService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper mapper;
	@Autowired
	private StoreAttachMapper attachMapper;
	
	@Override
	public boolean insert(StoreVO store) {
		boolean result = mapper.insert(store) > 0 ? true : false;
		
		if (store.getAttachList() == null || store.getAttachList().size() <= 0) {
			return result;
		}
		store.getAttachList().forEach(attach -> {
			attach.setCode(store.getCode());
			attachMapper.insert(attach);
		});
		return result;		
	}
	
	@Override
	public List<StoreVO> getAll() {
		return mapper.selectAll();
	}

}
