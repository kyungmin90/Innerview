package com.innerview.mvc00.pay;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.innerview.mvc00.user.UserVO;

@Controller
public class PayController {
	
	@Autowired
	PayService service;
	
	@RequestMapping("pay/payCheck.do") // payAPI.jsp에서 맵핑
	public void insert(PayVO payVO) {
		service.insert(payVO);
		// form으로 받은 값 insert (pTotalPrice, uID)
	}
	
	@RequestMapping("select1.do") // pay.jsp에서 맵핑
	public String select1(HttpSession session,
			@RequestParam("payVal") String payVal,
			@RequestParam("iTitle") String iTitle,
			@RequestParam("pTotalPrice") String pTotalPrice, Model model) {
		
		System.out.println("control: "+payVal);
		
		String uID = (String)session.getAttribute("uID");
		UserVO userVO = service.select1(uID);
		
		model.addAttribute("payVal", payVal);
		model.addAttribute("iTitle", iTitle);
		model.addAttribute("pTotalPrice", pTotalPrice);
		model.addAttribute("userVO", userVO);
		
		//모델에 담아서 payAPI.jsp로 리턴
		return "pay/payAPI";
	}
}