package com.innerview.mvc00.main;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MainDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	 
	
	//home화면 카테고리 랭킹
	public List<MainVO> list1(String iField1) {
		List<MainVO> list1 =  mybatis.selectList("main.category", iField1);
		return list1;
	}
	
	//검색
	public List<MainVO> search(String searchInput) {
		List<MainVO> search =  mybatis.selectList("main.search", searchInput);
		System.out.println("리스트불러오니?");
		System.out.println(search);
		return search;
	}

}
	
	
	
	

