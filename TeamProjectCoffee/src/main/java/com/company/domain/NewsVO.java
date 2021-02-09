package com.company.domain;
/*
newsno number(10),
newstitle varchar2(200) not null,
newscontent varchar2(2000) not null,
newsregdate date default sysdate,
newsviewcnt int,
CONSTRAINT pk_news_tbl PRIMARY KEY (newsno)
*/

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
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
