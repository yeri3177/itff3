package com.kh.spring.goods.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.OptionDetail;

public interface GoodsDao {

	List<Goods> selectGoodsList(int offset, int limit);

	int selectGoodsTotalCount();

	List<Integer> selectOptionId(int pid);

	OptionDetail selectOptionList(Integer option);

	Goods selectOneGoods(int pid);

	List<OptionDetail> selectColorByFirstType(int pid);

	List<OptionDetail> selectSizeByFirstColor(int pid);

	List<OptionDetail> selectColorByType(Map<String, Object> map);

	List<GoodsJoin> selectOneGoodsDetail(int pid);

	List<OptionDetail> selectSizeByColor(Map<String, Object> map);

	List<OptionDetail> selectOneImg(Map<String, Object> map);

	int selectOneOptionId(Map<String, Object> map);

	int insertCart(Map<String, Object> param);



}
