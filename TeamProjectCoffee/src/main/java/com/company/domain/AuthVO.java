package com.company.domain;
//마이페이지 -은주
//로그인 성공시 정보를 담을 객체 
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AuthVO {
	private String userid;
	private String name;
}
