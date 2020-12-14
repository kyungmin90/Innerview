package com.innerview.mvc00.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	
	@Autowired
	CartDAO dao;
	
	public void create(CartVO cartvo) {
		dao.create(cartvo);
	}
	
}
