package com.ssafy.service;


import com.ssafy.dao.LoginDao;
import com.ssafy.dao.LoginDaoImpl;
import com.ssafy.dto.MemberDto;

public class LoginServiceImpl implements LoginService {

	LoginDao loginDao;
	
	public LoginServiceImpl() {
		loginDao = new LoginDaoImpl();
	}
	
	@Override
	public MemberDto login(String userid, String userpwd) throws Exception {
		if(userid == null || userpwd == null)
			return null;
		return loginDao.login(userid, userpwd);
	}
	
	public String searchPw(String userid, String name)  throws Exception{
		if(userid == null || name == null)
			return null;
		return loginDao.searchPw(userid, name);
	}

}
