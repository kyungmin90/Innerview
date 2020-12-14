package com.innerview.mvc00.main;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class Algori {

	// 평점으로 점수 계산
	public double GradeSC(double iGrade) {
		//5.0만점, 10점 만점
		double x = iGrade * 2;
		return x;

	}

	// 생년월일로 세대 점수 계산   유저 생일(나이대), 상품 구매 나이대
	public byte age_score(String uBirth, int itemAge) throws Exception{

		//유저 생년을 받아 나이대 계산
		Date year = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy");
		String now_year = f.format(year);
		Date birth1 = f.parse(uBirth);
		Date now_y = f.parse(now_year);
		//Math.floor를 사용하여 소수점 내림
							
		double user_birth = Math.floor(now_y.getYear() - birth1.getYear() + 1)/10;
		
		byte user_age = (byte) user_birth;
		int y = (user_age + 100);
		int y2 = (100 - user_age);

		byte score = 0;

		 if (user_age <= itemAge) { 
			score = (byte) (-1 * (itemAge) + y);
		} else {
			score = (byte) (1 * (itemAge) + y2);
		}
		return score;
	}

	public double score(double x, byte y) {
		double result = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
		return result;
	}
	

	
	
	//퀵정렬
	
	public void swap(double[][] a, int idx1, int idx2) {
		double[] t = {a[idx1][0], a[idx1][1]}; 
		a[idx1][0] = a[idx2][0];
		a[idx1][1] = a[idx2][1];
		a[idx2][0] = t[0];
		a[idx2][1] = t[1];
	}
	
	public void QuickSort(double[][] a, int l, int r) {
		//왼쪽 오른쪽 시작부분 포인터 지정
		int pl = l;
		int pr = r;
		//a[][1]의 값을 기준으로
		double x = a[(pl + pr) / 2][1];
		
		do {
			//내림차순으로 정렬
			while(a[pl][1] > x) pl++;
			while(a[pr][1] < x) pr--;
			if(pl <= pr) swap(a, pl++, pr--);
			
		}while(pl <= pr);
		//퀵정렬 반복
		if(l < pr) QuickSort(a, l, pr);
		if(pl < r) QuickSort(a, pl, r);
	}



	
	
	

}
