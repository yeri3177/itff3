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
import com.kh.spring.goods.model.vo.GoodsLikeJoin;
import com.kh.spring.goods.model.vo.GoodsOrder;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.goods.model.vo.OrderDetail;
import com.kh.spring.goods.model.vo.OrderDetailJoin;
import com.kh.spring.goods.model.vo.OrderJoin;
import com.kh.spring.goods.model.vo.Payment;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSession session;
	
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

	@Override
	public List<GoodsLikeJoin> selectGoodsList(Map<String, Object> param) {
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("goods.selectGoodsList", param, rowBounds);
	}

	@Override
	public int insertGoodsOrder(Map<String, Object> map) {
		return session.insert("goods.insertGoodsOrder", map);
	}

	@Override
	public String selectOneOrderNo(Map<String, Object> map) {
		return session.selectOne("goods.selectOneOrderNo", map);
	}

	@Override
	public int insertOrderDetail(Map<String, Object> map) {
		return session.insert("goods.insertOrderDetail", map);
	}

	@Override
	public int insertPayment(Map<String, Object> map) {
		return session.insert("goods.insertPayment", map);
	}

	@Override
	public int updateMemberAddress(Map<String, Object> map) {
		return session.update("goods.updateMemberAddress", map);
	}

	@Override
	public int updateMemberPoint(Map<String, Object> map) {
		return session.update("goods.updateMemberPoint", map);
	}

	@Override
	public int deleteCartList(Map<String, Object> map) {
		return session.delete("goods.deleteCartList", map);
	}

	@Override
	public int insertPointHistoryByPayment(Map<String, Object> map) {
		return session.delete("goods.insertPointHistoryByPayment", map);
	}

	@Override
	public Payment selectOnePayment(String id) {
		return session.selectOne("goods.selectOnePayment", id);
	}

	@Override
	public Payment selectPaymentByPaymentNo(int no) {
		return session.selectOne("goods.selectPaymentByPaymentNo", no);
	}

	@Override
	public GoodsOrder selectOneGoodsOrder(String id) {
		return session.selectOne("goods.selectOneGoodsOrder", id);
	}

	@Override
	public List<OrderJoin> selectOrderList(String memberId) {
		return session.selectList("goods.selectOrderList", memberId);
	}

	@Override
	public int selectOrderNo(int orderDetailNo) {
		return session.selectOne("goods.selectOrderNo", orderDetailNo);
	}

	@Override
	public int selectFirstOrderDetailNo(int orderNo) {
		return session.selectOne("goods.selectFirstOrderDetailNo", orderNo);
	}

	@Override
	public OrderDetailJoin selectOneOrderDetailJoin(int orderDetailNo) {
		return session.selectOne("goods.selectOneOrderDetailJoin", orderDetailNo);
	}

	@Override
	public List<GoodsLikeJoin> selectGoodsLikeItems(String loginId) {
		return session.selectList("goods.selectGoodsLikeItems", loginId);
	}

	@Override
	public int selectAllMemberCount() {
		return session.selectOne("goods.selectAllMemberCount");
	}

	@Override
	public int selectOrderMemberCount() {
		return session.selectOne("goods.selectOrderMemberCount");
	}

	@Override
	public List<String> selectAgeNumber() {
		return session.selectList("goods.selectAgeNumber");
	}

	@Override
	public List<GoodsLikeJoin> selectGoodsListBySortType(Map<String, Object> param) {
		int offset = (int)param.get("offset");
		int limit = (int)param.get("limit");
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("goods.selectGoodsListBySortType", param, rowBounds);
	}

	@Override
	public List<OrderDetail> selectOrderDetailList(String orderNo) {
		return session.selectList("goods.selectOrderDetailList", orderNo);
	}

	@Override
	public int updateGoodsStock(List<OrderDetail> orderDetail) {
		int result = 0;
		
		for(int i=0; i<orderDetail.size(); i++) {
			int optionId = orderDetail.get(i).getOptionId();
			result +=  session.update("goods.updateGoodsStock", optionId);
		}
		return result;
		
	}


}