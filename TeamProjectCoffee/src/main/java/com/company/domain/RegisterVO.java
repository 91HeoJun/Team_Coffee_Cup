package com.company.domain;
//마이페이지 회원정보 회원가입VO-은주
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * 
CREATE TABLE UserTBL (
	userid		VARCHAR2(15),  --아이디
	password	VARCHAR2(20)	NOT NULL, --비밀번호 
	name		NVARCHAR2(10)	NOT NULL,  --이름
	postcode	VARCHAR2(50)	NOT NULL, --우편번호
	address		VARCHAR2(50)	NOT NULL, --주소
	detailAddress    VARCHAR2(50),        --상세주소
	email		VARCHAR2(50)	NOT NULL, --이메일
	tel			VARCHAR2(20)	NOT NULL, --전화번호
	point 		number(20) not null,      --포인트
	CONSTRAINT UserTBL_PK PRIMARY KEY (userid)
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
	private int point;

}

