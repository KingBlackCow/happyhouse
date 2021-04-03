package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.ApartDto;



public interface Service {
	public List<ApartDto> listApart(String key, String word) throws Exception;
}
