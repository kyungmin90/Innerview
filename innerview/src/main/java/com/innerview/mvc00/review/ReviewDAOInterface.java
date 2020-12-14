package com.innerview.mvc00.review;

import java.util.List;

public interface ReviewDAOInterface {

	void insert(ReviewVO vo);

	void delete(ReviewVO vo);

	void update(ReviewVO vo);

	ReviewVO one(ReviewVO vo);

	List<ReviewVO> list();

	//listNO
	ReviewVO one2(ReviewVO vo);

}