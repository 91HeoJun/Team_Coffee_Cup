package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.BoardFileAttach;
import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.mapper.BoardAttachMapper;
import com.company.mapper.BoardMapper;


@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public boolean regist(BoardVO board) {
		
		boolean result = boardMapper.insert(board)>0?true:false;
		
		// 첨부파일 없을 시 
		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return result;
		}
		
		// 첨부파일 있을 시 
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
		
		return result;
	}

	@Transactional
	@Override
	public boolean remove(int bno) {
		
		attachMapper.delete(bno);
		
		return boardMapper.delete(bno)>0?true:false;
	}

	@Override
	public boolean modify(BoardVO board) {
		
		// 첨부파일 우선 전체삭제 후 재삽입
		attachMapper.delete(board.getBno());
		
		boolean result = boardMapper.update(board)>0?true:false;
		
		// 첨부파일 없을 시
		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return result;
		}
		
		// 첨부파일 있을 시
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});

		return result;
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

	@Override
	public List<BoardFileAttach> AttachList(int bno) {
		return boardMapper.attachList(bno);
	}

}
