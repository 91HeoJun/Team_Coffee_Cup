package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.mapper.FAQMapper;

@Service("faqService")
public class FAQServiceImpl implements FAQService {

	@Autowired
	private FAQMapper faqMapper;
	
	@Transactional
	@Override
	public boolean regist(BoardVO board) {
		return faqMapper.insert(board)>0?true:false;
	}

	@Transactional
	@Override
	public boolean remove(int bno) {
		return faqMapper.delete(bno)>0?true:false;
	}

	@Override
	public boolean modify(BoardVO board) {
		return faqMapper.update(board)>0?true:false;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return faqMapper.list(cri);
	}

	@Override
	public BoardVO getRow(int bno) {
		return faqMapper.select(bno);
	}

	@Override
	public int getTotalCnt(Criteria cri) {
		return faqMapper.totalCnt(cri);
	}

}
