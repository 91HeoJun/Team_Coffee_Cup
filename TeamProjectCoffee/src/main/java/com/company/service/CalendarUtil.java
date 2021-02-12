package com.company.service;

import java.util.List;

import com.company.domain.CalendarVO;

public class CalendarUtil {
	
	// null값이면 true로 반환
	public static boolean nvl(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	// 날짜를 보여주는 함수 
	public static String caltoday(int year, int month, int day) {
		
		String s = "";
	    
		s += String.format("%2d", day);
		
		return s;		
	}
		

	// db  1 -> 01  형식으로 넣어주는 함수 
	public static String two(String msg) {
		return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
	
	
	// 각 날짜별로 테이블을 생성하는 함수
	// 출석도장 표시 
	public static String makeTable(int year, int month, int day, List<CalendarVO> list) {
			
			String s = "";
			String dates = (year + "") + two(month + "") + two(day + ""); // "20210201"
			
			for(CalendarVO cal : list) {			
				if(cal.getRdate().substring(0, 8).equals(dates)) { // 20210201 == dates
					
					 s += "<img src='../resources/calendarimg/stamp_on.png'>";
					
				}			
			}	
			
			return s;
		}
	
	

}






