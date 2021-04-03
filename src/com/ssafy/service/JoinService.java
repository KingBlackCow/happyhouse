package com.ssafy.service;

import java.sql.SQLException;

import com.ssafy.dao.JoinDao;
import com.ssafy.dto.MemberDto;

public interface JoinService {

	public void Join(MemberDto member) throws Exception;
	public  MemberDto getMember(String id) throws Exception;
	public void modifyMember(MemberDto memberDto) throws Exception;
	public int deleteMember(String userid) throws SQLException;
	
}
