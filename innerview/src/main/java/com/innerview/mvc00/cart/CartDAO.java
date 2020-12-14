package com.innerview.mvc00.cart;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void create(CartVO vo) {
		mybatis.insert("cart.insert", vo);
	}
	
}
