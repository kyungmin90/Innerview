package com.innerview.mvc00.main;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AlgoDAO {

	
	@Autowired
	SqlSessionTemplate mybatis;
	//나이 변환
	@Autowired
	Age iAge;
	//점수 구하기
	@Autowired
	Algori algori;
	

	
	//유저 생년월일 가져오기
	public String myAge(String uID) {
		return mybatis.selectOne("myage", uID);
	}

	
	//전체 상품의 점수 리스트
	public List<ResultVO> score(String uAge) throws Exception{
		//컬럼 수 = 상품코드
		int iSize = mybatis.selectOne("itemsize");
		//점수 결과가 들어갈 List
		List<ResultVO> resultlist = new ArrayList<ResultVO>();
		
		//상품의 수 만큼 반복
		for (int i = 0; i < iSize; i++) {
			//전체상품별 리뷰를 가지고 상품별 나이를 가져옴
			List<AlgoVO> itemAge = mybatis.selectList("age", i+1);
			//전체상품의 평점을 가져옴
			double iGrade = mybatis.selectOne("igrade", i+1);

			int age_sum = 0;
			
			//상품별 리뷰 작성자의 나이 list size 반복
			for (int j = 0; j < itemAge.size(); j++) {
				//유저의 생년월일을 꺼내 생년을 가지고 나이대 계산
				int a = iAge.iage(itemAge.get(j).getuBirth());
				
				//나이대를 더한다
				age_sum += a;
			}
			//더한 나이대의 평균을 구한다
			int age_av = age_sum / itemAge.size();
			
			//나이 점수(로그인한유저 나이대, 상품리뷰 평균 나이대
			byte ageSC = algori.age_score(uAge, age_av);
			
			//평점 점수(상품 평점)
			double gradeSC = algori.GradeSC(iGrade);
			
			//결과(나이점수, 평점점수)
			double result = algori.score(ageSC, (byte)gradeSC);
			
			//결과를 vo에 담아 return
			ResultVO resultVO = new ResultVO();
			resultVO.setiCode(i+1);
			resultVO.setResult(result);		
			resultlist.add(resultVO);
		}
		return resultlist;
	
	}
	
	//int배열로 넘어온 상품 코드를 가지고 DB에서 상품 정보를 가져옴
	 public List<MainVO> list1(int[] list) {
		 //상품정보를 담을 List 생성
		 List<MainVO> list1 = new ArrayList<MainVO>();
		 
		
		 //int배열 만큼 반복(5번)
		 for (int i = 0; i < list.length; i++) {
			 
			 //int배열의 값으로 DB에서 상품 정보를 가져옴
			 //vo에 담아 return
			 MainVO vo = new MainVO();			 
			 vo = mybatis.selectOne("main.list",list[i]);
			
			 list1.add(i, vo);
			 
		}
		 return list1;
	}
	
	
	
	
}
