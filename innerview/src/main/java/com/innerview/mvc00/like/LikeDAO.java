package com.innerview.mvc00.like;


import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public LikeVO one(LikeVO vo) {
		return mybatis.selectOne("like.one",vo);
	}
	
	public int create(LikeVO vo) {
		return mybatis.insert("like.create", vo);
	}
	
	public int delete(LikeVO vo) {
		return mybatis.delete("like.delete",vo);
	}
	
	
	
	/*
	 * public void likeUpdate(LikeVO vo) { HashMap<String,Object> map = new
	 * HashMap<String, Object>(); int id = getLike(id); map.put("id",id); }
	 * 
	 * public int getLike(int id){ HashMap<String,Object> map = new HashMap<String,
	 * Object>(); map.put("id",id); }
	 */
	
}
