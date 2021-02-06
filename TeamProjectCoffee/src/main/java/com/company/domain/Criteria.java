package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	// 페이지 나누기
	private int pageNum;	// 페이지 번호
	private int amount;		// 페이지내 게시물 수
	
	public Criteria() {
		this(1, 10);
	}

	// 페이지당 당 게시물수
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// 검색기
	private String type;	// 검색 카테고리
	private String keyword;	// 검색어
	
	// 검색타입 배열처리
	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}
}
