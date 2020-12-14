package com.innerview.mvc00.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

	@Autowired
	ReviewDAOInterface dao;
	@Autowired
	ReviewDAO dao1;
	
	public void insert(ReviewVO vo) {
		dao.insert(vo);
	}
	
	public void delete(ReviewVO vo) {
		dao.delete(vo);
	}
	
	public void update(ReviewVO vo) {
		dao.update(vo);
	}
	
	public ReviewVO one(ReviewVO vo) {
		return dao.one(vo);
		
	}
	
	public List<ReviewVO> list() {
		return dao.list();
		
	}
	
	
	public ReviewVO one2(ReviewVO vo) {
		return dao.one2(vo); }
	 
	
	public List<ReviewVO> itemReview(String iCode) {

		return dao1.itemReview(iCode);
	}
	
}
