package com.kh.spring.goods.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.goods.model.vo.Goods;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Goods> selectGoodsList() {
		return session.selectList("goods.selectGoodsList");
	}
	
	
}
