package com.kh.spring.goods.model.dao;

import java.util.List;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.OptionDetail;

public interface GoodsDao {

	List<Goods> selectGoodsList(int offset, int limit);

	int selectGoodsTotalCount();

	List<Integer> selectOptionId(int pid);

	OptionDetail selectOptionList(Integer option);

	Goods selectOneGoods(int pid);



}
