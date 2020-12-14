package com.innerview.mvc00.main;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {

	@Autowired
	MainService service;
	
	@Autowired
	AlgoService service2;
	//로그인시 추천 알고리즘
	@RequestMapping("main_views/homeLogin.do")
	public void list(HttpSession session, Model model) throws Exception {
		String uID = (String)session.getAttribute("uID");
		//유저 나이정보를 통해가져온 각 상품별 점수 상위 5개의 상품번호를 가져온 후 상품번호로 상품 찾고 VO담아 list로 가져옴
		model.addAttribute("list", service2.homelist(service2.list(uID)));
		
	}

	//home 화면 카테고리 랭킹 버튼 클릭시 ajax
	@RequestMapping("main_views/categoryAjax.do")
	public void list1(Model model, String iField1) {
		model.addAttribute("category", service.list1(iField1));
		System.out.println(iField1);
	}
	
	
	//검색
	@RequestMapping("main_views/search.do")
	public void search(Model model, String searchInput) {
		model.addAttribute("search", service.search(searchInput));
		System.out.println(searchInput);
	}
	


	

}
