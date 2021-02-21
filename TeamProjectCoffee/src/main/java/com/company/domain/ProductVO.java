package com.company.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

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
	
	private int pcode;  //상품코드
	private String pcategory;  //상품종류
	private String product;  //상품이름
	private String pcontent; //상품 상세내용
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pdate;  //상품 제조(로스팅)일자
	private int price;  //상품가격
	private String pamount;  //상품양(무게)	- 재고관리기능 못넣음..
	private String origin;  //상품원산지
   // private String picture_url; //상품 이미지 경로 
	
	//첨부파일 목록
	private ProductFileAttach attach;
}
