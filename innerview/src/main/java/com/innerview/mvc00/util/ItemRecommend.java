package com.innerview.mvc00.util;

public class ItemRecommend{
	
	//가격 점수
	//현재 제품의 가격을 기준으로 가격이 가까우면 높은 점수, 멀어지면 낮은 점수를 도출하는 메서드
	public static int abs(int iprice, int targetprice) {
		//현재 제품 가격 기준으로 비교제품 가격을 백분율 수치로 변경
		targetprice = targetprice * 100 / iprice;
		iprice = iprice * 100 / iprice;
		
		//가격보다 낮으면 기존 수치로 사용
		if(iprice >= targetprice) {
			 return targetprice;
		}else {
			//가격보다 높으면 기준 가격 2배에 비교제품 가격 차감
			return (iprice * 2) - targetprice;
		} 
	}
	
	//성분 점수
	//점과 점사이의 거리를 구하는 메서드
	//=>두 제품의 성분 차이에 따라 점수를 도출하는 메서드  
	public static double point(double iIngredient1, double iIngredient2, double targetIngre1, double targetIngre2) {
		//주 성분에 대한 값을 더 많은 비중을 두기 위해 4:1의 비율로 기준 설정
		//4배의 값을 곱하고 주 성분의 양이 일치할경우에 100점을 기준으로 점수를 도출
		double result = (double)Math.sqrt(Math.pow(Math.abs((100+4*(targetIngre1-iIngredient1))), 2) + Math.pow(Math.abs(targetIngre2-iIngredient2), 2));
		return result; 
	}
	
	//평점 점수
	//두 제품의 리뷰에 따른 점수를 도출하는 메서드
	public static double grade(double iGrade, double targetgrade) {
		//마이너스 값을 방지하기 위한 최소값을 위해 +5, 전체 결과 값에 미약하게나마 영향을 주기 위해 *5
		double result = (targetgrade - iGrade + 5)*5;
		return result;
	}
	
	//점수를 도출하는 세가지 메서드를 사용해서 나온 결과 값으로 최종 점수를 도출하는 메서드 
	public static double itemRecommend(int iprice, int targetprice, double iIngredient1, double iIngredient2, double targetIngre1, double targetIngre2, double iGrade, double targetgrade) {
		//가격 점수
		int x = abs(iprice, targetprice);
		//성분 점수
		double y = point(iIngredient1, iIngredient2,targetIngre1,targetIngre2);
		//평점 점수 
		double z = grade(iGrade, targetgrade);
		//전부 양수로 도출된 세가지 값을 이용해 x,y,z 평면에 점을 찍고 원점(0.0.0)을 기준으로 거리(최종 점수) 도출 
		double total = (double) Math.sqrt(Math.pow(Math.abs((x)), 2) + Math.pow(Math.abs(y), 2) + Math.pow(Math.abs(z), 2));
		return total;
		
	}
	
	
}
