package com.innerview.mvc00.util;

public class ArrayInputCheck {
	public static int arrayInputCheck(double[][] array) {
		//최대값 지정
		int count = 3;
		//배열의 길이 최대3 최소1 사이 배열은 살아있으나 안에 값이 없는 경우 찾기 위한 반복문 
		for (int i = 0; i < 3; i++) {
			if (array[i][0] == 0.0) {
				count = i;
				break;
			}
		}
		if(array.length == 1) {
			//최소값 지정
			count = 1;
		}
		//값이 없어도 for문이 최소 1번, 최대 3번 반복
		return count;

	}

}
