package com.innerview.mvc00.zzim;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ZzimDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public ZzimVO one(ZzimVO vo) {
		return mybatis.selectOne("zzim.one",vo);
	}
	
	public int create(ZzimVO vo) {
		return mybatis.insert("zzim.insert",vo);
	}
	
	public int delete(ZzimVO vo) {
		return mybatis.delete("zzim.delete",vo);
	}
	
}
