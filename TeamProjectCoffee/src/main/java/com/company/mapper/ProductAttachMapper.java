package com.company.mapper;

import java.util.List;

import com.company.domain.FileAttach;

public interface ProductAttachMapper {
	
	// 추후 FileAttach로 담을 수 있는지 테스트 예정
	public int insert(FileAttach attach);
	public int delete(int pcode);
	public List<FileAttach> oldFileList();

}
