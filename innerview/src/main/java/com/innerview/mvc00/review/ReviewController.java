package com.innerview.mvc00.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;

	
	@RequestMapping("review/insert.do")
	public void insert(ReviewVO reviewVO) {
		service.insert(reviewVO);
	}

	@RequestMapping("delete.do")
	public void delete(ReviewVO reviewVO) {
		service.delete(reviewVO);
	}

	@RequestMapping("update.do")
	public void update(ReviewVO reviewVO) {
		service.update(reviewVO);

	}

	@RequestMapping("one.do")
	public void one(ReviewVO reviewVO, Model model) {
		ReviewVO vo = service.one(reviewVO);
		model.addAttribute("vo", vo);

	}

	//댓글목록 (@controller방식 views화면을 리턴)
	@RequestMapping("review/list.do")
	public void list(Model model) {
		List<ReviewVO> list = service.list();
		model.addAttribute("list", list);
		}

	
	@RequestMapping("listno.do")
    public void listno(Model model) {
	    List<ReviewVO> list = service.list();
	    model.addAttribute("list", list);
	    }
	 
	
	
	
	
	//아이템 리뷰 출력 controller	
	@RequestMapping("review/itemReview.do")
	public void itemReview(Model model, String iCode) {

		List<ReviewVO> list = service.itemReview(iCode);
		

		//리뷰가 담겼는지 판단하는 부분
		boolean flag = false; //리뷰가 없으면 false
		if(list.size() != 0) {	
			flag = true; //리뷰가 있으면 true
		}
		model.addAttribute("flag",flag);
		model.addAttribute("list", list);
		
	}
	
	
}
