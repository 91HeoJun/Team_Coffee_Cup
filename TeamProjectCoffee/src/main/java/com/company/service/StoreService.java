package com.company.service;

import java.util.List;

import com.company.domain.FileAttach;
import com.company.domain.StoreVO;

public interface StoreService {
	public boolean insert(StoreVO store);
	public List<StoreVO> getAll();
	//첨부 파일 목록 가져오기
	public List<FileAttach> getAttachList(int code);
}
