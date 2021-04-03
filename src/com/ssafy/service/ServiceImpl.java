package com.ssafy.service;

import java.util.List;

import com.ssafy.dao.Dao;
import com.ssafy.dao.DaoImpl;
import com.ssafy.dto.ApartDto;


public class ServiceImpl implements Service{
	private Dao apartDao;
	
	public ServiceImpl() {
		apartDao = new DaoImpl();
	}
	
	@Override
	public List<ApartDto> listApart(String key, String word) throws Exception {
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		return apartDao.listApart(key, word);
	}

}
