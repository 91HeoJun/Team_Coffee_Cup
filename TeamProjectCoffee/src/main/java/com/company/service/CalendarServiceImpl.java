package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.CalendarVO;
import com.company.mapper.CalendarMapper;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarMapper mapper;
	
	// 출석체크
	@Override
	public boolean calwrite(CalendarVO cal) {
		
		return mapper.calwrite(cal);
		
	}

	// 출석확인
	@Override
	public List<CalendarVO> getCalendarList(CalendarVO cal) {
		
		return mapper.getCalendarList(cal);
	}

	// 같은 ID 몇개인지 찾기 
	@Override
	public int getIdCount(String userid) {
		
		return mapper.getIdCount(userid);
	}

	// 포인트 지급
	@Override
	public boolean upPoint(String userid) {
		
		return mapper.upPoint(userid);
	}

	// today
	@Override
	public CalendarVO gettoday(CalendarVO mem) {
	
		return mapper.gettoday(mem);
	}

	


	
	
	
	
	
	

}
