package com.company.domain;
//마이페이지 회원정보 수정 테스트용 회원가입VO-은주
//예지씨가 만든걸로 VO클래스명 수정하고 RegisterVO는 삭제예정
//주소API사용시 addr1,addr2로 테이블 다시 만드는거 의논하기
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
//CREATE TABLE UserTBL (
//		userid		VARCHAR2(15), 
//		password	VARCHAR2(20)	NOT NULL, 
//		name		NVARCHAR2(10)	NOT NULL, 
//		addr		VARCHAR2(50)	NOT NULL, 
//		email		VARCHAR2(50)	NOT NULL, 
//		tel			VARCHAR2(20)	NOT NULL, 
//	    CONSTRAINT UserTBL_PK PRIMARY KEY (userid)
//	);
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
	private String addr;
	private String email;
	private String tel;
	

}
