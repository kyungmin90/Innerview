package com.innerview.mvc00.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.batch.MyBatisBatchItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO implements ReviewDAOInterface {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insert(ReviewVO vo) {
		mybatis.insert("review.insert" , vo);
	}
	
	@Override
	public void delete(ReviewVO vo) {
		mybatis.delete("review.delete" , vo);
	}
	
	@Override
	public void update(ReviewVO vo) {
		mybatis.update("review.update" , vo);
	}
	
	@Override
	public ReviewVO one(ReviewVO vo) {
		ReviewVO vo2 = mybatis.selectOne("review.one" , vo);
		return vo2;
	}
	
	
	@Override
	public List<ReviewVO> list() {
	List<ReviewVO> list= mybatis.selectList("review.list");
	System.out.println(list);
	return list;
		
	}
	
	
	//listNO
	@Override
	public ReviewVO one2(ReviewVO vo) {
		ReviewVO vo2 = mybatis.selectOne("review.listno" , vo);
		return vo2; }
	 
	
	public List<ReviewVO> itemReview(String iCode) {
		return mybatis.selectList("review.itemReview", iCode);
	}
		

}
