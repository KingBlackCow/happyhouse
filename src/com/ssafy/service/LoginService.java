package com.ssafy.service;

import com.ssafy.dto.MemberDto;

public interface LoginService {

	public MemberDto login(String userid, String userpwd) throws Exception;
	public String searchPw(String userid, String name)  throws Exception;
}
