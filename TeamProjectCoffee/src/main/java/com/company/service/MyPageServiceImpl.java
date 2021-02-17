package com.company.service;
//마이페이지 서비스임플 - 은주

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.AuthVO;
import com.company.domain.LoginVO;
import com.company.domain.RegisterVO;
import com.company.domain.ChangeVO;
import com.company.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public AuthVO isLogin(LoginVO login) {
		return mapper.isLogin(login);
	}

	@Override
	public boolean leave(String userid) {
		return mapper.leaveMember(userid)>0?true:false;
	}

	@Override
	public boolean update(ChangeVO change) {
		return mapper.updateMember(change)>0?true:false;
	}

	@Override
	public RegisterVO getId(String userid) {
		return mapper.getId(userid);
	}

	
}
