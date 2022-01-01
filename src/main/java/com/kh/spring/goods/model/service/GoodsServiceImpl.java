package com.kh.spring.goods.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.goods.model.dao.GoodsDao;
import com.kh.spring.goods.model.vo.CartJoin;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsCart;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.OptionDetail;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;

	@Override
	public List<Goods> selectGoodsList(int offset, int limit) {
		return goodsDao.selectGoodsList(offset, limit);
	}

	@Override
	public int selectGoodsTotalCount() {
		return goodsDao.selectGoodsTotalCount();
	}

	@Override
	public List<Integer> selectOptionId(int pid) {
		return goodsDao.selectOptionId(pid);
	}

	@Override
	public OptionDetail selectOptionList(Integer option) {
		return goodsDao.selectOptionList(option);
	}

	@Override
	public Goods selectOneGoods(int pid) {
		return goodsDao.selectOneGoods(pid);
	}

	@Override
	public List<OptionDetail> selectColorByFirstType(int pid) {
		return goodsDao.selectColorByFirstType(pid);
	}

	@Override
	public List<OptionDetail> selectSizeByFirstColor(int pid) {
		return goodsDao.selectSizeByFirstColor(pid);
	}

	@Override
	public List<OptionDetail> selectColorByType(Map<String, Object> map) {
		return goodsDao.selectColorByType(map);
	}

	@Override
	public List<GoodsJoin> selectOneGoodsDetail(int pid) {
		return goodsDao.selectOneGoodsDetail(pid);
	}

	@Override
	public List<OptionDetail> selectSizeByColor(Map<String, Object> map) {
		return goodsDao.selectSizeByColor(map);
	}

	@Override
	public OptionDetail selectOneOptionDetail(Map<String, Object> map) {
		return goodsDao.selectOneOptionDetail(map);
	}

	@Override
	public int selectOneOptionId(Map<String, Object> map) {
		return goodsDao.selectOneOptionId(map);
	}

	@Override
	public int insertCart(Map<String, Object> param) {
		return goodsDao.insertCart(param);
	}

	@Override
	public GoodsCart selectOneCart(Map<String, Object> param) {
		return goodsDao.selectOneCart(param);
	}

	@Override
	public int updateCartQty(Map<String, Object> param) {
		return goodsDao.updateCartQty(param);
	}

	@Override
	public List<CartJoin> selectGoodsCartList(String memberId) {
		return goodsDao.selectGoodsCartList(memberId);
	}

	@Override
	public int deleteCart(String cartId) {
		return goodsDao.deleteCart(cartId);
	}

	@Override
	public CartJoin selectGoodsCartQtyModal(String id) {
		return goodsDao.selectGoodsCartQtyModal(id);
	}


	
	
}
