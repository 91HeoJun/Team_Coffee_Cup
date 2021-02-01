package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
//상품VO
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	private int pCode;  //상품코드
	private String pcategory;  //상품종류
	private String product;  //상품이름
	private String pContent; //상품 상세내용
	private String pDate;  //상품 제조(로스팅)일자
	private int price;  //상품가격
	private int pAmount;  //상품 재고수량
	private boolean image;  //상품이미지
	private String origin;  //상품원산지
	
}
