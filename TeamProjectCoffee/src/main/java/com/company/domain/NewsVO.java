package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
// 새소식VO - 은엽

//CREATE TABLE NEWSTBL (
//NEWSNO        NUMBER(10) NOTNULL,
//NEWSNAME		VARCHAR2(50) NOT NULL, 
//NEWSCONTENT	VARCHAR2(100) NOT NULL

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NewsVO {
	private int newsno;
	private String newsname;
	private String newscontent;
	
}
