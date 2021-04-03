package com.ssafy.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.dao.JoinDao;
import com.ssafy.dao.JoinDaoImpl;
import com.ssafy.dto.MemberDto;
import com.ssafy.util.DBUtil;

public class JoinServiceImpl implements JoinService {
	
	JoinDao joinDao;
	public JoinServiceImpl() {
		joinDao = new JoinDaoImpl();
	}
	@Override
	public void Join(MemberDto member) throws Exception {
		
		joinDao.join(member);
	}
	
	@Override
	public MemberDto getMember(String id) throws SQLException {
		return joinDao.getMember(id);
	}
	
	@Override
	public void modifyMember(MemberDto memberDto) throws SQLException {
		joinDao.modifyMember(memberDto);
	}
	@Override
	public int deleteMember(String userid) throws SQLException {
		int res = joinDao.deleteMember(userid);
		return res; 
	}
	
}
