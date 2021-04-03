package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.util.DBUtil;
import com.ssafy.dto.MemberDto;

public class JoinDaoImpl implements JoinDao {

	@Override
	public void join(MemberDto dto) throws SQLException {
		MemberDto memberDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnect();
			String sql = "";
			sql+="INSERT INTO ssafy_member (userid, username, userpwd, email, address) VALUES (?, ?, ?, ?, ?)";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUsername());
			pstmt.setString(3, dto.getUserpwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			System.out.println( dto.getUserid());
			System.out.println( dto.getUsername());
			System.out.println( dto.getUserpwd());
			System.out.println( dto.getEmail());
			System.out.println( dto.getAddress());
			System.out.println(pstmt);
			pstmt.executeUpdate();
			//rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
			memberDto = null;
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
	}

	@Override
	public MemberDto getMember(String id) throws SQLException {
		MemberDto memberDto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("select userid, username, userpwd, email, address \n");
			sql.append("from ssafy_member \n");
			sql.append("where userid = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setUserid(rs.getString("userid"));
				memberDto.setUsername(rs.getString("username"));
				memberDto.setUserpwd(rs.getString("userpwd"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setAddress(rs.getString("address"));
				System.out.println(memberDto.getUserid());
			}
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		return memberDto;
	}
	
	public void modifyMember(MemberDto memberDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getConnect();
			StringBuilder insertMember = new StringBuilder();
			insertMember.append("update ssafy_member \n");
			insertMember.append("set userpwd = ? \n");
			insertMember.append("where userid = ?");
			pstmt = conn.prepareStatement(insertMember.toString());
			
			pstmt.setString(1, memberDto.getUserpwd());
		
			pstmt.setString(2, memberDto.getUserid());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} finally {
			DBUtil.close(pstmt, conn);
		}
	}

	@Override
	public int deleteMember(String userid) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM ssafy_member WHERE userid = ?";
		try {
			conn = DBUtil.getConnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			System.out.println(pstmt);
			int res = pstmt.executeUpdate();
			return res;
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return 0;
	}

	
}
