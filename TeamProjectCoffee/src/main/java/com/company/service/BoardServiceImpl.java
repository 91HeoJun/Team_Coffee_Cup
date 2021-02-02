package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.mapper.BoardMapper;


@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public boolean regist(BoardVO board) {
		
		return boardMapper.insert(board)>0?true:false;
	}

	@Override
	public boolean remove(int bno) {
		
		return boardMapper.delete(bno)>0?true:false;
	}

	@Override
	public boolean modify(BoardVO board) {

		return boardMapper.update(board)>0?true:false;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return boardMapper.list(cri);
	}

	@Override
	public BoardVO getRow(int bno) {
		return boardMapper.select(bno);
	}

	@Override
	public int getTotalCnt(Criteria cri) {
		return boardMapper.totalCnt(cri);
	}

}
