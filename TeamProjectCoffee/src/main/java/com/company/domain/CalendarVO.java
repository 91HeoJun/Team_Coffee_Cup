package com.company.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CalendarVO implements Serializable {
	private int cal_seq;	// 출석체크 seq
	private String userid;		// 멤버 id
	private String rdate;   // 등록일

}



