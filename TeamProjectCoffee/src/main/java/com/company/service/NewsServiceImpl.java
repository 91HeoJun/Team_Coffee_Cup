package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.NewsVO;
import com.company.mapper.NewsMapper;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsMapper newsMapper;
	
	
	//게시글등록
	@Override
	public void insertNews(NewsVO news) {
		newsMapper.insert(news);
	}
	
	//삭제
	@Override
	public void deleteNews(int newsno) {
		newsMapper.delete(newsno);
	}
	
	//수정
	@Override
	public void updateNews(NewsVO news) {
		newsMapper.update(news);
	}
	
	//전체게시글
	@Override
	public List<NewsVO> listNews() {
		return newsMapper.listNews();
	}
	
	//단일게시글 읽기
	@Override
	public NewsVO detailNews(int newsno) {
		return newsMapper.read(newsno);
	}

}
