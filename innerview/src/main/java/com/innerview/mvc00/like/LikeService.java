package com.innerview.mvc00.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {
	
	@Autowired
	LikeDAO dao;
	
	public int one(LikeVO vo) {
//		return dao.one(vo);
		LikeVO revo = dao.one(vo);
		int result = 0;
		if(revo != null) {
			result = 1;
		}
		return result;
		
	}
	
	public int create(LikeVO vo) {
		return dao.create(vo);
		
	}
	
	public int delete(LikeVO vo) {
		return dao.delete(vo);
	}
}
