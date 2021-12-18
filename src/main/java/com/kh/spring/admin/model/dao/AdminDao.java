package com.kh.spring.admin.model.dao;

import java.util.List;

import com.kh.spring.goods.model.vo.Goods;

public interface AdminDao {

	List<Goods> selectGoodsList();

}
