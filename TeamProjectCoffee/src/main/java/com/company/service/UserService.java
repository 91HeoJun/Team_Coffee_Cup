package com.company.service;

import javax.servlet.http.HttpSession;

import com.company.domain.RegisterVO;

public interface UserService {
	//아이디 중복
	public RegisterVO selectById(String userid);
	//회원가입
	public boolean register(RegisterVO regist);
	//로그아웃
	public void logout(HttpSession session);
}
