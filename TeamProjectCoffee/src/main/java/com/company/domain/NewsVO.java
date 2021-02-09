package com.company.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
// 새소식VO - 은엽


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NewsVO {
	private int newsno;
	private String newstitle;
	private String newscontent;
	private Date newsregdate;
	private int newsviewcnt;
	
}
