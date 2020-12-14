package com.innerview.mvc00.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO implements User {
	@Autowired
	SqlSessionTemplate mybatis;
	
	//회원가입
	@Override
	public void create(UserVO vo) {
		mybatis.insert("user.create",vo);		
	}
	
	//중복확인
	public int checkID(String uID) {
		int result = (int)mybatis.selectOne("user.checkID", uID);
		return result;
	}
	
	//로그인
	public String login(String uID) {
		String passWord = mybatis.selectOne("user.login",uID);
		return passWord;
	}
	
	//비밀번호 수정
	public int update(UserVO vo) {
		int result = mybatis.update("user.updatePW",vo);
		return result;
	}
	
	//결제취소
	   public int delete(String uID) {
	      int result =  mybatis.delete("user.delete", uID);
	      System.out.println(result);
	      return result;
	   }
	
}
