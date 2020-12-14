package com.innerview.mvc00.item;

import java.util.List;

public interface ItemCRUD {
	int create(ItemVO vo);
	ItemVO one(String iCode);
	List<ItemVO> list(String iField1);
	int update(ItemVO vo);
	int delete(ItemVO vo);
}
