package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.BoardFileAttach;
import com.company.domain.BoardVO;
import com.company.domain.Criteria;

public interface BoardMapper {

	public int insert(BoardVO board);
	public int delete(int bno);
	public int update(BoardVO board);
	
	public List<BoardVO> list(Criteria cri);
	public BoardVO select(int bno);
	
	public int totalCnt(Criteria cri);
	public int replyCntUpdate(@Param("amount")int amount, @Param("bno")int bno);
	
	public List<BoardFileAttach> attachList(int bno);
	
}
