package com.innerview.mvc00.zzim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ZzimService {
	
	@Autowired
	ZzimDAO dao;
	
	public int one(ZzimVO vo) {
		//찜 된 상품이 있으면 결과값을 0또는 1로 출력
		ZzimVO revo = dao.one(vo);
		int result = 0; //없으면 0 반환
		if(revo != null) {
			result = 1; //있으면 1 반환
		}
		return result;
		
	}
	
	public int create(ZzimVO vo) {
		return dao.create(vo);
	}
	
	public int delete(ZzimVO vo) {
		return dao.delete(vo);
	}
}
