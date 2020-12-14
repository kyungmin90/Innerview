package com.innerview.mvc00.util;

public class QuickSort {
	
	static void swap(double[][]a, int idx1, int idx2) {
		//int배열 t에 첫번째 배열의 0, 1 입력
		double[] t = {a[idx1][0], a[idx1][1]}; 
		//첫번째 배열에 두번째 배열의 0, 1 입력
		a[idx1][0] = a[idx2][0]; 
		a[idx1][1] = a[idx2][1];
		//두번째 배열에 t 배열에 있는 0, 1입력
		a[idx2][0] = t[0];
		a[idx2][1] = t[1];
	}
	
	public static void quickSort(double[][] a, int left, int right) {
		//오른쪽, 왼쪽 시작 부분, pointer 지정
		int pl = left;
		int pr = right;
		//결과값을 가져오기 위해 a[][1]의 값을 기준으로 삼음
		double x = a[(pl+pr)/2][1];

		do {
			//조건을 반대로 주어 내림차순으로 설정
			while (a[pl][1] > x) pl++;
			while (a[pr][1] < x) pr--;
			if(pl <= pr)//조건에 맞으면 두개의 배열 swap
				swap(a, pl++, pr--);
		}while(pl <= pr);
		//quicksort 반복
		if(left < pr) quickSort(a, left, pr);
		if(pl < right) quickSort(a, pl, right);
	}


}
