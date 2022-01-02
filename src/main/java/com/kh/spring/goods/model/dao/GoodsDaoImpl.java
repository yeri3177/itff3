package com.kh.spring.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.goods.model.vo.CartJoin;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsCart;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.GoodsLike;
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

	@Override
	public List<OptionDetail> selectColorByFirstType(int pid) {
		return session.selectList("goods.selectColorByFirstType", pid);
	}

	@Override
	public List<OptionDetail> selectSizeByFirstColor(int pid) {
		return session.selectList("goods.selectSizeByFirstColor", pid);
	}

	@Override
	public List<OptionDetail> selectColorByType(Map<String, Object> map) {
		return session.selectList("goods.selectColorByType", map);
	}

	@Override
	public List<GoodsJoin> selectOneGoodsDetail(int pid) {
		return session.selectList("goods.selectOneGoodsDetail", pid);
	}

	@Override
	public List<OptionDetail> selectSizeByColor(Map<String, Object> map) {
		return session.selectList("goods.selectSizeByColor", map);
	}

	@Override
	public OptionDetail selectOneOptionDetail(Map<String, Object> map) {
		return session.selectOne("goods.selectOneOptionDetail", map);
	}

	@Override
	public int selectOneOptionId(Map<String, Object> map) {
		return session.selectOne("goods.selectOneOptionId", map);
	}

	@Override
	public int insertCart(Map<String, Object> param) {
		return session.insert("goods.insertCart", param);
	}

	@Override
	public GoodsCart selectOneCart(Map<String, Object> param) {
		return session.selectOne("goods.selectOneCart", param);
	}

	@Override
	public int updateCartQty(Map<String, Object> param) {
		return session.update("goods.updateCartQty", param);
	}

	@Override
	public List<CartJoin> selectGoodsCartList(String memberId) {
		return session.selectList("goods.selectGoodsCartList", memberId);
	}

	@Override
	public int deleteCart(String cartId) {
		return session.delete("goods.deleteCart", cartId);
	}

	@Override
	public CartJoin selectGoodsCartQtyModal(String id) {
		return session.selectOne("goods.selectGoodsCartQtyModal", id);
	}

	@Override
	public int updateCart(Map<String, Object> map) {
		return session.update("goods.updateCart", map);
	}

	@Override
	public GoodsLike selectOneGoodsLike(Map<String, Object> param) {
		return session.selectOne("goods.selectOneGoodsLike", param);
	}

	@Override
	public int insertGoodsLike(Map<String, Object> param) {
		return session.insert("goods.insertGoodsLike", param);
	}

	@Override
	public int deleteGoodsLike(Map<String, Object> param) {
		return session.delete("goods.deleteGoodsLike", param);
	}


}
