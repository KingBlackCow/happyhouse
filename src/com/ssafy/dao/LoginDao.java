package com.ssafy.dao;

import java.sql.SQLException;

import com.ssafy.dto.MemberDto;

public interface LoginDao {

	public MemberDto login(String userid, String userpwd) throws SQLException;
	public String searchPw(String userid, String name) throws SQLException;
}
