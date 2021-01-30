package com.company.service;

import com.company.domain.AuthVO;
import com.company.domain.LoginVO;
import com.company.domain.RegisterVO;
import com.company.domain.ChangeVO;

//마이페이지 서비스 - 은주


public interface MyPageService {
	//로그인 -> 로그인 성공시 userid, name 가지고 다니기
	public AuthVO isLogin(LoginVO login);
	//회원탈퇴
	public boolean leave(LoginVO login);
	//비밀번호 수정
	public boolean update(ChangeVO change);
}
