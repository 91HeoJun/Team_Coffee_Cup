package com.company.mapper;

import java.util.List;
//새소식매퍼 - 은엽
import com.company.domain.NewsVO;

public interface NewsMapper {
	public void insert(NewsVO news);
	public List<NewsVO> listNews();
	public NewsVO read(int newsno);
	public void delete(int newsno);
	public void update(NewsVO news);

}
