package com.company.mapper;

import com.company.domain.AuthVO;
import com.company.domain.LoginVO;
import com.company.domain.RegisterVO;
import com.company.domain.ChangeVO;

public interface MyPageMapper {
	//mapper.xml에 작성했던 id값이랑 변수명이랑 동일하게 작성
	public AuthVO isLogin(LoginVO login);
	public int leaveMember(LoginVO login);
	public int updateMember(ChangeVO change);
	public RegisterVO getId(LoginVO login);
}