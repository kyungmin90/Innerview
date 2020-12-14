package com.innerview.mvc00.item;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAO implements ItemCRUD {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public int create(ItemVO vo) {
		return mybatis.insert("item.insert", vo);
	}

	@Override
	public ItemVO one(String iCode) {
		return mybatis.selectOne("item.one", iCode);
	}

	
	@Override
	public List<ItemVO> list(String iField1) {
//		System.out.println("DAO"+iField1);
		return mybatis.selectList("item.list", iField1);
	}
	
	//주 재료가 같은 제품들만을 return 하는 메서드
	public List<ItemRecommendVO> recommend(String iIngredient1){
		return mybatis.selectList("item.recommend",iIngredient1);
	}
	

	@Override
	public int update(ItemVO vo) {
		return mybatis.update("item.update", vo);
	}

	@Override
	public int delete(ItemVO vo) {
		return mybatis.delete("item.delete", vo);
	}
	

}
