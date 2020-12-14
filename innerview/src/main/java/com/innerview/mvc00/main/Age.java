package com.innerview.mvc00.main;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Repository;


@Repository
public class Age {
	
	//나이 계산					
	public int iage (String uBirth) throws Exception{
	//DB의 Date를 받아와 현재 날짜와 계산하여 몇십대 인지 계산
		Date year = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy");
		String now_year = f.format(year);
		Date birth1 = f.parse(uBirth);
		Date now_y = f.parse(now_year);
	//Math.floor를 사용하여 소수점 내림 한국나이임으로 + 1, 나누기 10
		double user_birth = Math.floor(now_y.getYear() - birth1.getYear()+1)/10;
		byte user_age = (byte)user_birth;
		
		return user_age;
	}
}
