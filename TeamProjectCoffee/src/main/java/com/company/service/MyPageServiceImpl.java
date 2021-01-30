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
		return mapper.selectByMember(login);
	}

	@Override
	public boolean leave(LoginVO login) {
		return mapper.leaveMember(login)>0?true:false;
	}

	@Override
	public boolean update(ChangeVO change) {
		return mapper.updateMember(change)>0?true:false;
	}

}
