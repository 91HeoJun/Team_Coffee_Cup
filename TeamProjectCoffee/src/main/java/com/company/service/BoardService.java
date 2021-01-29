package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;

public interface BoardService {

	public boolean regist(BoardVO board);
	public boolean remove (int bno);
	public boolean modify(BoardVO board);
	
	public List<BoardVO> getList();
	public BoardVO getRow(int bno);
	
}
