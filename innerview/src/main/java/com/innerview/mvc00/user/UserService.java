package com.innerview.mvc00.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@Autowired
	UserDAO dao;
	
	//암호화 di
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	//회원가입
	public void create(UserVO vo) {
		dao.create(vo);
	}
	
	//중복확인
	public int checkID(String uID) {
		return dao.checkID(uID);
	}
	
	//로그인
	public boolean login(UserVO vo) {
		//로그인 페이지에서 받은 아이디로 비밀번호가져오기
		String passWord = dao.login(vo.getuID());
		//로그인 페이지에서 받은 비밀번호랑 db에저장된 비밀번호랑 matches로 비교하기
		boolean result = false;
		if(pwEncoder.matches(vo.getuPW(), passWord)) {
			result = true;
		}
		return result;

	}
	
	//비밀번호 수정
	public int update(UserVO vo) {
		return dao.update(vo);
	}
	
	//결제취소
	   public int delete(String uID) {
	      System.out.println(uID);
	      return dao.delete(uID);
	   }
}
