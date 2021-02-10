package com.company.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class pageVO {

	private int startPage;
	private int endPage;
	private boolean previous;
	private boolean next;
	private int total;
	
	private Criteria cri;
	
	public pageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 페이지 번호 당 글 범위
		this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0)*10);
		this.startPage = endPage - 9;
		
		// 페이지 총 수
		int realEnd = (int) (Math.ceil((total/1.0) / cri.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		// 다음 / 이전
		this.previous = this.startPage > 1;
		this.next = this.endPage < realEnd;	
	}
}