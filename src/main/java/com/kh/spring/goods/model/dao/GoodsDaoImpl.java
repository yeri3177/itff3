package com.kh.spring.goods.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.OptionDetail;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Goods> selectGoodsList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("goods.selectGoodsList", null, rowBounds);
	}

	@Override
	public int selectGoodsTotalCount() {
		return session.selectOne("goods.selectGoodsTotalCount");
	}

	@Override
	public List<Integer> selectOptionId(int pid) {
		return session.selectList("goods.selectOptionId", pid);
	}

	@Override
	public OptionDetail selectOptionList(Integer option) {
		return session.selectOne("goods.selectOptionList", option);
	}

	@Override
	public Goods selectOneGoods(int pid) {
		return session.selectOne("goods.selectOneGoods", pid);
	}


}
