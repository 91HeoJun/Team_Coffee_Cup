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
	public void regist(NewsVO news) {
		newsMapper.insert(news);
	}
	
	//삭제
	@Override
	public void remove(int newsno) {
		newsMapper.delete(newsno);
	}
	
	//수정
	@Override
	public void modify(NewsVO news) {
		newsMapper.update(news);
	}
	
	//전체게시글
	@Override
	public List<NewsVO> newsList() {
		return newsMapper.newsList();
	}
	
	//단일게시글 읽기
	@Override
	public NewsVO read(int newsno) {
		return newsMapper.read(newsno);
	}

}
