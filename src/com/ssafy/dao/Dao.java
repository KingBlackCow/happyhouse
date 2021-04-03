package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.dto.ApartDto;



public interface Dao {
	public List<ApartDto> listApart(String key, String word) throws SQLException;

}
