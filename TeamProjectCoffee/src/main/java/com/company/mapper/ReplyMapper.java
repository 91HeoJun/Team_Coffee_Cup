package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.Criteria;
import com.company.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO rep);
	public int delete(int rno);
	public int update(ReplyVO rep);
	
	public ReplyVO read(int rno);
	public List<ReplyVO> list(@Param("bno")int bno, @Param("cri")Criteria cri);
	
	public int countBno(int bno);
}
