package com.ssafy.dao;

import java.sql.SQLException;

import com.ssafy.dto.MemberDto;

public interface JoinDao {

	public void join(MemberDto dto) throws SQLException;
	public MemberDto getMember(String id) throws SQLException; 
	public void modifyMember(MemberDto memberDto)  throws SQLException;
	public int deleteMember(String userid) throws SQLException;
}
