package com.kh.spring.goods.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.goods.model.dao.GoodsDao;
import com.kh.spring.goods.model.vo.Goods;
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
	public List<OptionDetail> selectOneImg(Map<String, Object> map) {
		return goodsDao.selectOneImg(map);
	}


	
	
}
