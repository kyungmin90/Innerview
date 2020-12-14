package com.innerview.mvc00.main;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MainService {

	@Autowired
	MainDAO dao;

	//home 화면 카테고리 랭킹 list
	public List<MainVO> list1(String iField1){
		return dao.list1(iField1);
	}
	
	
	//검색 결과 list
	public List<MainVO> search(String searchInput){
		return dao.search(searchInput);
	}
	
	
	
	
	
}
