package com.company.service;

import com.company.domain.Criteria;
import com.company.domain.ReplyPageVO;
import com.company.domain.ReplyVO;

public interface ReplyService {
	
	public boolean replyAdd(ReplyVO rep);
	public boolean replyDelete(int rno);
	public boolean replyUpdate(ReplyVO rep);

	public ReplyVO get(int rno);
	public ReplyPageVO getList(Criteria cri, int bno);
}
