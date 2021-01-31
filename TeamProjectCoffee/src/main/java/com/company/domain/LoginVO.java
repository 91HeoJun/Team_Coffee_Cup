package com.company.domain;
//마이페이지에서 이용할 로그인정보, 탈퇴시 필요한 vo-은주
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter

public class LoginVO {
	private String userid;
	private String password;

}
