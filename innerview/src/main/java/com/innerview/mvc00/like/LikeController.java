package com.innerview.mvc00.like;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LikeController {

	@Autowired
	LikeService	service;
	
	/*
	 * @RequestMapping("likeresult.do") public void likeresult(LikeVO vo, Model
	 * model) { System.out.println("나 들어옴"); int result = service.create(vo);
	 * System.out.println("나나나나나   "+result); }
	 */
	@RequestMapping("likedelete.do")
	public void likedelete(LikeVO vo, Model model) {
		int result = service.delete(vo);
		System.out.println(result);
	}
	
	
	@RequestMapping("likeresult.do")
	public int likeresult(LikeVO vo, Model model){
	int result= service.create(vo);
	return result;
	}
}
