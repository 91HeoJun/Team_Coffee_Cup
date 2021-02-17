package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.mapper.NoticeMapper;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Transactional
	@Override
	public boolean regist(BoardVO board) {
		return noticeMapper.insert(board)>0?true:false;
	}

	@Transactional
	@Override
	public boolean remove(int bno) {
		return noticeMapper.delete(bno)>0?true:false;
	}

	@Override
	public boolean modify(BoardVO board) {
		return noticeMapper.update(board)>0?true:false;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return noticeMapper.list(cri);
	}

	@Override
	public BoardVO getRow(int bno) {
		return noticeMapper.select(bno);
	}

	@Override
	public int getTotalCnt(Criteria cri) {
		return noticeMapper.totalCnt(cri);
	}


}
