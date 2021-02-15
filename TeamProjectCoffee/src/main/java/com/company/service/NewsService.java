package com.company.service;

import java.util.List;

import com.company.domain.NewsVO;

// 새소식 - 은엽

public interface NewsService {

	// 게시글 등록/삭제/수정
	public void insertNews(NewsVO news);
	public void deleteNews(int newsno);
	public void updateNews(NewsVO news);

	// 게시글 조회 - 전체/단일
	public List<NewsVO> listNews();
	public NewsVO detailNews(int newsno);
}
