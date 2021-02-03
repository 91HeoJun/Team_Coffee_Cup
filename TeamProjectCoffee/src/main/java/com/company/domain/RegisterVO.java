package com.company.domain;
//마이페이지 회원정보 수정 테스트용 회원가입VO-은주
//예지씨가 만든걸로 VO클래스명 수정하고 RegisterVO는 삭제예정
//주소API사용시 addr1,addr2로 테이블 다시 만드는거 의논하기
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * 	userid		VARCHAR2(15), 			-아이디
	password	VARCHAR2(20)	NOT NULL, -비밀번호
	name		NVARCHAR2(10)	NOT NULL, -이름
	postcode	VARCHAR2(50)	NOT NULL,-우편번호
	address		VARCHAR2(50)	NOT NULL,-주소
	detailAddress    VARCHAR2(50),		-상세주소
	email		VARCHAR2(50)	NOT NULL, -이메일
	tel			VARCHAR2(20)	NOT NULL, -전화번호
	CONSTRAINT UserTBL_PK PRIMARY KEY (userid) -외래키: 아이디
);

 * */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RegisterVO {
	private String userid;
	private String password;
	private String confirm_password;
	private String name;
	private String postCode;
	private String address;
	private String detailAddress;
	private String email;
	private String tel;
	

}

