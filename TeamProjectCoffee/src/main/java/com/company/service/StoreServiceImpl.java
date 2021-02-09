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
	public StoreVO getRow(int code) {
		StoreVO store = mapper.select(code);
		store.setAttachList(attachMapper.getList(code));
		
		return store;
	}
	
	@Override
	public List<FileAttach> getAttachList(int code) {
		return attachMapper.getList(code);
	}
	
	@Override
	public boolean delete(int code) {
		
		attachMapper.deleteList(code);
		
		return mapper.delete(code)>0?true:false;
	}

	@Override
	public boolean modify(StoreVO store) {
		// 첨부물 전체 삭제
		attachMapper.deleteList(store.getCode());
		//게시물 수정
		boolean result = mapper.update(store) > 0 ? true : false;

		// 첨부파일이 null이거나 size()가 0이라면
		// return false - 그 이후 명령문을 수행하지 않는다.
		if (store.getAttachList() == null || store.getAttachList().size() <= 0) {
			return result;
		}
		//첨부물 삽입
		store.getAttachList().forEach(attach -> {
			attach.setCode(store.getCode());
			attachMapper.insert(attach);
		});
		return result;
	}

}
