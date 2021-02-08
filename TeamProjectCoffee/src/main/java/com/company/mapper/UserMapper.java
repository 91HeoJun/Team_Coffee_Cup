package com.company.mapper;

import com.company.domain.RegisterVO;

public interface UserMapper {
	public RegisterVO selectById(String userid);
	public int register(RegisterVO regist);
}
