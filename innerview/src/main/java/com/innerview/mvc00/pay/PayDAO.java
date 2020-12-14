package com.innerview.mvc00.pay;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.innerview.mvc00.user.UserVO;

@Repository
public class PayDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insert(PayVO vo) {
		mybatis.insert("pay.insert", vo);
	}
	
	public UserVO select1(String uID) {
		System.out.println("dao: "+uID);

		return mybatis.selectOne("pay.select", uID);
	}
}