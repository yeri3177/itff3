package com.kh.spring.goods.model.dao;

import java.util.List;

import com.kh.spring.goods.model.vo.Goods;

public interface GoodsDao {

	List<Goods> selectGoodsList();

}
