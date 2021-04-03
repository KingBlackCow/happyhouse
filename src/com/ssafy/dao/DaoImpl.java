package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dto.ApartDto;
import com.ssafy.util.DBUtil;

public class DaoImpl implements Dao{
	
	
	@Override
	public List<ApartDto> listApart(String key, String word) throws SQLException{
		List<ApartDto> list = new ArrayList<ApartDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, dong, AptName, code, dealAmount \n");
			sql.append("from housedeal \n");
			if(!word.isEmpty()) {
				if("dong".equals(key)) {
					sql.append("where dong like ? \n");
				} else {
					sql.append("where AptName like ? \n");
				}
			}
			sql.append("order by no asc \n");
			pstmt = conn.prepareStatement(sql.toString());
			if(!word.isEmpty()) {
				if("dong".equals(key))
					pstmt.setString(1, "%" + word + "%");
				else
					pstmt.setString(1, "%" + word + "%");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ApartDto apartDto = new ApartDto();
				apartDto.setNo(rs.getInt("no"));
				apartDto.setDong(rs.getString("dong"));
				apartDto.setAptName(rs.getString("AptName"));
				apartDto.setCode(rs.getString("code"));
				apartDto.setDealAmount(rs.getString("dealAmount"));
				list.add(apartDto);
			}
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		
		return list;
	}
}
