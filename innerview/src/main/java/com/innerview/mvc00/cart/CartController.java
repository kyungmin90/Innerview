package com.innerview.mvc00.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	//장바구니에 DB생성하는 controller
	@RequestMapping("cart/createCart.do")
	public void create(CartVO cartvo) {
		service.create(cartvo);
	}

}
