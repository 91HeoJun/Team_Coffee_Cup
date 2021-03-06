package com.company.service;

import java.util.List;

import com.company.domain.CalendarVO;

public interface CalendarService {

	// 출석체크
    boolean calwrite(CalendarVO cal);
	
    // 출석확인
 	public List<CalendarVO> getCalendarList(CalendarVO cal);
 	
 	// 같은 ID 몇개인지 찾기
 	public int getIdCount(String userid);
 		
 	// 포인트 지급
 	public boolean upPoint(String userid);
 	
 	// today
 	public CalendarVO gettoday(CalendarVO mem);
 	
 	
}
