package com.company.mapper;

import java.util.List;

import com.company.domain.BoardFileAttach;

public interface BoardAttachMapper {
	
	// 추후 FileAttach로 담을 수 있는지 테스트 예정
	public int insert(BoardFileAttach attach);
	public int delete(int bno);
	public List<BoardFileAttach> oldFileList();

}
