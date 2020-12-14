package com.innerview.mvc00.item;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innerview.mvc00.util.ArrayInputCheck;
import com.innerview.mvc00.util.ItemRecommend;
import com.innerview.mvc00.util.QuickSort;

@Service
public class ItemService implements ItemCRUD {
	
	@Autowired
	ItemDAO dao;
	
	@Override
	public int create(ItemVO vo) {
		return dao.create(vo);
	}

	@Override
	public ItemVO one(String iCode) {
		return dao.one(iCode);
	}
	
	@Override
	public List<ItemVO> list(String iField1) {
		System.out.println("서비스"+iField1);
		return dao.list(iField1);
	}
	
	//제품 비교 service
	//제품 꺼내서 -> 알고리즘 적용 해서 점수 도출 -> 같은 이름의 제품 리스트에서 제외-> 2차원 배열이나 리스트에 저장 -> 퀵정렬-> 리스트 전달
	public List<ItemRecommendResultVO> recommend(String iIngredient1, ItemVO vo){
		//비교할 같은 제품군의 제품 list에 저장 
		List<ItemRecommendVO> list = dao.recommend(iIngredient1);
		//정렬하기 위한 2차원 배열
		double[][] index =  new double[list.size()][2];
		
		//list에 들어있는 값 vo로 꺼내기 
		for (int i = 0; i < list.size(); i++) {
			ItemRecommendVO recovo = list.get(i);

			//알고리즘 객체 
			ItemRecommend reco = new ItemRecommend();							
			//현재 보고있는,비교군이 되는 제품 제외
			if(vo.getiCode() != recovo.getiCode()) {
				//가격차이 2배 이상 제품 제외
				if((vo.getiPrice()*2) >= recovo.getiPrice()) {
				//조건에 맞는 요소들 2차원 배열에 icode 값 저장
				index[i][0] = recovo.getiCode();
				//조건에 맞는 요소들 2차원 배열에 제품비교 결과 값 저장
				index[i][1] = reco.itemRecommend(vo.getiPrice(), recovo.getiPrice(), vo.getiComponent1(), vo.getiComponent1(), recovo.getiComponent1(), recovo.getiComponent2(), vo.getiGrade(), recovo.getiGrade());
				}
			}
		}
		
		//퀵 정렬
		QuickSort sort = new QuickSort();
		//포인터는 index를 사용하기 때문에 길이에서 -1을 지정해줘야 한다.
		sort.quickSort(index, 0, index.length-1);
		
		//결과를 새로운, 길이가 3이하의 resultlist에 넣어서 전달하기
		List<ItemRecommendResultVO> resultlist = new ArrayList<ItemRecommendResultVO>();
		
		int count ;
		//길이 측정 메서드 
		ArrayInputCheck check = new ArrayInputCheck();
		//전달할 list의 값이 3이 이상이면 3으로 자르고, 그 이하는 각 갯수에 맞추도록 하는 메서드
		count = check.arrayInputCheck(index);
		//1~3번 반복
		for (int i = 0; i < count; i++) {
			ItemRecommendResultVO resultvo = new ItemRecommendResultVO();
			resultvo.setiCode((int)index[i][0]);
			//list의 사이즈 만큼 반복
			for (int j = 0; j < list.size(); j++) {
				ItemRecommendVO recovo = list.get(j);
				//vo에 담긴 icode와 index의 icode가 같을때 
				if (recovo.getiCode() == index[i][0]) {
					//해당 코드의 이미지를 넘길 배열의 [i][1]에 넣는다.
					resultvo.setiImage(recovo.getiImage());
				}
			}
			//resultlist에 저장
			resultlist.add(resultvo);
		}
		return resultlist;
	}
	

	@Override
	public int update(ItemVO vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(ItemVO vo) {
		return delete(vo);
	}

}
