package com.company.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.FileAttach;
import com.company.domain.StoreVO;
import com.company.mapper.StoreAttachMapper;
import com.company.mapper.StoreMapper;

import lombok.extern.slf4j.Slf4j;
@Service("StoreService")
@Slf4j
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
		//매장 목록 가져오기
		List<StoreVO> list =  mapper.selectAll();
		//각 매장의 파일 첨부 목록 가져오기
		list.forEach(store->{
			store.setAttachList(attachMapper.getList(store.getCode()));
			log.info("첨부 파일"+store.getAttachList());
		});
		
		return list;
	}
	
	@Override
	public List<FileAttach> getAttachList(int code) {
		return attachMapper.getList(code);
	}

}
