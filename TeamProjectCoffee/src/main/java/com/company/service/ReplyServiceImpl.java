package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.Criteria;
import com.company.domain.ReplyPageVO;
import com.company.domain.ReplyVO;
import com.company.mapper.BoardMapper;
import com.company.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Transactional
	@Override
	public boolean replyAdd(ReplyVO rep) {
		// reply 작성 시 댓글수 증가
		boardMapper.replyCntUpdate(1, rep.getBno());
		return replyMapper.insert(rep)>0?true:false;
	}

	@Transactional
	@Override
	public boolean replyDelete(int rno) {
		ReplyVO rep = replyMapper.read(rno);
		// reply 삭제 시 댓글수 차감
		boardMapper.replyCntUpdate(-1, rep.getBno());
		
		return replyMapper.delete(rno)>0?true:false;
	}

	@Override
	public boolean replyUpdate(ReplyVO rep) {
		return replyMapper.update(rep)>0?true:false;
	}

	@Override
	public ReplyVO get(int rno) {
		return replyMapper.read(rno);
	}

	@Override
	public ReplyPageVO getList(Criteria cri, int bno) {
		
		return new ReplyPageVO(replyMapper.countBno(bno), replyMapper.list(bno, cri));
	}

}
