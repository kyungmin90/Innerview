package com.innerview.mvc00.zzim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZzimController {

	@Autowired
	ZzimService	service;
	
	//찜 생성 controller
	@RequestMapping("zzim/zzimresult.do")
	public void zzim(ZzimVO vo, Model model) {
		int result = service.create(vo);
//		System.out.println(result);
	}
	//찜 삭제 controller
	@RequestMapping("zzim/zzimdelete.do")
	public void zzimdelete(ZzimVO vo, Model model) {
		int result = service.delete(vo);
//		System.out.println(result);
	}
}
