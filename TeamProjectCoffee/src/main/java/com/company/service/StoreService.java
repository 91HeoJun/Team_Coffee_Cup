package com.company.service;

import java.util.List;

import com.company.domain.FileAttach;
import com.company.domain.StoreVO;

public interface StoreService {
	public boolean insert(StoreVO store);
	public List<StoreVO> getAll();
	//첨부 파일 목록 가져오기
	public List<FileAttach> getAttachList(int code);
	//매장 삭제
	public boolean delete(int code);
	//매장 수정
	public boolean modify(StoreVO store);
	//매장 가져오기
	public StoreVO getRow(int code);
}
