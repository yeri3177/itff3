package com.kh.spring.goods.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.goods.model.vo.CartJoin;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsCart;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.GoodsLike;
import com.kh.spring.goods.model.vo.OptionDetail;

public interface GoodsService {

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

	OptionDetail selectOneOptionDetail(Map<String, Object> map);

	int selectOneOptionId(Map<String, Object> map);

	int insertCart(Map<String, Object> param);

	GoodsCart selectOneCart(Map<String, Object> param);

	int updateCartQty(Map<String, Object> param);

	List<CartJoin> selectGoodsCartList(String memberId);

	int deleteCart(String cartId);

	CartJoin selectGoodsCartQtyModal(String id);

	int updateCart(Map<String, Object> map);

	GoodsLike selectOneGoodsLike(Map<String, Object> param);

	int insertGoodsLike(Map<String, Object> param);

	int deleteGoodsLike(Map<String, Object> param);


}
