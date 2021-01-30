package com.company.mapper;

//마이페이지 매퍼인터페이스 - 은주

import com.company.domain.AuthVO;
import com.company.domain.LoginVO;
import com.company.domain.RegisterVO;
import com.company.domain.ChangeVO;

public interface MyPageMapper {
	public AuthVO selectByMember(LoginVO login);
	public int leaveMember(LoginVO login);
	public int updateMember(ChangeVO change);
}
