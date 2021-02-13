package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.RegisterVO;
import com.company.mapper.UserMapper;

@Service
public class UseServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public RegisterVO selectById(String userid) {
		return userMapper.selectById(userid);
	}

	@Override
	public boolean register(RegisterVO regist) {
		return userMapper.register(regist)>0?true:false;
	}

}
