package com.innerview.mvc00.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.innerview.mvc00.user.UserVO;

@Service
public class PayService {

	@Autowired
	PayDAO dao;
	
	public void insert(PayVO vo) {
		dao.insert(vo);
	}
	
	public UserVO select1(String uID) {
		System.out.println("service: "+uID);
	
		return dao.select1(uID);
	}
}