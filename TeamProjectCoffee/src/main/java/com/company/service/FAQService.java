package com.company.service;

import java.util.List;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;

public interface FAQService {

	public boolean regist(BoardVO board);
	public boolean remove (int bno);
	public boolean modify(BoardVO board);
	
	public List<BoardVO> getList(Criteria cri);
	public BoardVO getRow(int bno);
	
	public int getTotalCnt(Criteria cri);

}
