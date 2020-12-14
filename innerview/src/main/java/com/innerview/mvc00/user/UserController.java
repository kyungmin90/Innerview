package com.innerview.mvc00.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
	@Autowired
	UserService service;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	//회원가입
	@RequestMapping("create2.do")
	public void create2(UserVO userVO) {
		userVO.setuPW(pwEncoder.encode(userVO.getuPW())); // 비밀번호 암호화
		service.create(userVO);
	}
		
	//아이디 중복 체크
	@RequestMapping("checkID2.do")
	public void checkID2(String uID, Model model) {
		model.addAttribute("result",service.checkID(uID));
	}
	
	//로그인
	@RequestMapping("login2.do")
	public void login2(UserVO userVO,Model model, HttpSession session) {
		if(service.login(userVO)) {
			//로그인 성공 시 아이디 세션으로 넘기기
			session.setAttribute("uID", userVO.getuID());
		}else {
			//로그인 실패 시 null 세션으로 넘기기
			session.setAttribute("uID", "null");
		}
	}
	
	//비밀번호 수정
	@RequestMapping("updatePW2.do")
	public void updatePW2(UserVO userVO, Model model) {
		userVO.setuPW(pwEncoder.encode(userVO.getuPW()));
		model.addAttribute("result",service.update(userVO));
	}
	
	
	//카카오 회원가입
	   @RequestMapping("registerKakao2.do")
	   public void registerKakao2(UserVO userVO, HttpSession session){
		   System.out.println(userVO.getuName());
	      session.setAttribute("result1",userVO.getuName());
	      session.setAttribute("result2",userVO.getuEmail());
	      session.setAttribute("result3",userVO.getuGender());
	   }
	   
	 //결제취소
	   @RequestMapping("delete2.do")
	   public void delete2(String uID,Model model) {
	      System.out.println("호출됨");
	      System.out.println(uID);
	      model.addAttribute("result",service.delete(uID));
	      
	   }
    
	
}
