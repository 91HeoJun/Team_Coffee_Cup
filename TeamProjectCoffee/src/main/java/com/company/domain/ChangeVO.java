package com.company.domain;
//마이페이지에서 회원정보 수정시 필요한 VO-은주
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChangeVO {
	private String userid;
	private String password;
	private String new_password;
	private String confirm_password;
	private String postCode;
	private String address;
	private String detailAddress;
	private String email;
	private String tel;
	
	//비밀번호 확인을 js에서 하지 않고 vo에 담아서 하는 방법
	public boolean newPasswordEqualsConfirmPassword() {
		return new_password.equals(confirm_password);
	}
}