package com.innerview.mvc00.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlgoService {

	@Autowired
	AlgoDAO dao;

	@Autowired
	Algori algori;
	 
	
	//유저 생년월일
	public String myAge(String uID) {
		return dao.myAge(uID);
	}
	
	
	
	//내림차순으로 정렬하여 상품번호 5개
		public int[] list(String uID) throws Exception {
			String uAge = dao.myAge(uID);
			
			//DAO에서 가져온 상품 점수 리스트
			List<ResultVO> list = dao.score(uAge);
			System.out.println(list);
			//상품 번호 : 점수 로 이중배열에 담기
			double[][] list1 = new double[list.size()][2];
			for (int i = 0; i < list1.length; i++) {
				list1[i][0] = list.get(i).getiCode();
				list1[i][1] = list.get(i).getResult();
				
				System.out.println(list1[i][0]+":"+list1[i][1]);
			}
			//Quick 정렬을 사용하여 점수 내림차순으로 정렬
			algori.QuickSort(list1, 0, list.size()-1);
			System.out.println("정렬되었음===============================");
			
			for (int i = 0; i < list1.length; i++) {
				
				System.out.println(list1[i][0]+":"+list1[i][1]);
			}
			
			//상위 5개의 상품번호를 배열에 담은 후 return
			int[] result = new int[5];
			
			for (int i = 0; i < result.length; i++) {
				result[i] = (int)list1[i][0];
				System.out.println(result[i]);
			}

			return result;

		}
		
		//로그인시 메인 추천 상품 리스트
		public List<MainVO> homelist(int[] list) {
			return dao.list1(list); 
		}

	
}
