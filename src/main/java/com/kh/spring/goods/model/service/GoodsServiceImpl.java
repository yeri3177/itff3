package com.kh.spring.goods.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.goods.model.dao.GoodsDao;
import com.kh.spring.goods.model.vo.Goods;

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
	
	
}
