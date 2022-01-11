package com.kh.spring.goods.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.goods.exception.GoodsException;
import com.kh.spring.goods.model.dao.GoodsDao;
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

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;

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

	@Override
	public int updateCart(Map<String, Object> map) {
		return goodsDao.updateCart(map);
	}

	@Override
	public GoodsLike selectOneGoodsLike(Map<String, Object> param) {
		return goodsDao.selectOneGoodsLike(param);
	}

	@Override
	public int insertGoodsLike(Map<String, Object> param) {
		return goodsDao.insertGoodsLike(param);
	}

	@Override
	public int deleteGoodsLike(Map<String, Object> param) {
		return goodsDao.deleteGoodsLike(param);
	}

	@Override
	public List<GoodsLikeJoin> selectGoodsList(Map<String, Object> param) {
		return goodsDao.selectGoodsList(param);
	}

	@Override
	public int insertGoodsOrder(Map<String, Object> map) {
		return goodsDao.insertGoodsOrder(map);
	}

	@Override
	public String selectOneOrderNo(Map<String, Object> map) {
		return goodsDao.selectOneOrderNo(map);
	}

	@Override
	public int insertOrderDetail(Map<String, Object> map) {
		return goodsDao.insertOrderDetail(map);
	}

	@Override
	public int insertPayment(Map<String, Object> map) {
		return goodsDao.insertPayment(map);
	}

	@Override
	public int updateMemberAddress(Map<String, Object> map) {
		return goodsDao.updateMemberAddress(map);
	}

	@Override
	public int updateMemberPoint(Map<String, Object> map) {
		return goodsDao.updateMemberPoint(map);
	}

	@Override
	public int deleteCartList(Map<String, Object> map) {
		return goodsDao.deleteCartList(map);
	}

	@Override
	public int insertPointHistoryByPayment(Map<String, Object> map) {
		return goodsDao.insertPointHistoryByPayment(map);
	}

	@Override
	public Payment selectOnePayment(String id) {
		return goodsDao.selectOnePayment(id);
	}

	@Override
	public Payment selectPaymentByPaymentNo(int no) {
		return goodsDao.selectPaymentByPaymentNo(no);
	}

	@Override
	public GoodsOrder selectOneGoodsOrder(String id) {
		return goodsDao.selectOneGoodsOrder(id);
	}

	@Override
	public List<OrderJoin> selectOrderList(String memberId) {
		return goodsDao.selectOrderList(memberId);
	}

	@Override
	public int selectOrderNo(int orderDetailNo) {
		return goodsDao.selectOrderNo(orderDetailNo);
	}

	@Override
	public int selectFirstOrderDetailNo(int orderNo) {
		return goodsDao.selectFirstOrderDetailNo(orderNo);
	}

	@Override
	public OrderDetailJoin selectOneOrderDetailJoin(int orderDetailNo) {
		return goodsDao.selectOneOrderDetailJoin(orderDetailNo);
	}

	@Override
	public List<GoodsLikeJoin> selectGoodsLikeItems(String loginId) {
		return goodsDao.selectGoodsLikeItems(loginId);
	}

	@Override
	public int selectAllMemberCount() {
		return goodsDao.selectAllMemberCount();
	}

	@Override
	public int selectOrderMemberCount() {
		return goodsDao.selectOrderMemberCount();
	}

	@Override
	public List<String> selectAgeNumber() {
		return goodsDao.selectAgeNumber();
	}

	@Override
	public List<GoodsLikeJoin> selectGoodsListBySortType(Map<String, Object> param) {
		return goodsDao.selectGoodsListBySortType(param);
	}

	@Override
	public List<OrderDetail> selectOrderDetailList(String orderNo) {
		return goodsDao.selectOrderDetailList(orderNo);
	}

	@Override
	@Transactional (
		propagation = Propagation.REQUIRED, 
		isolation = Isolation.READ_COMMITTED,
		rollbackFor = Exception.class
	)
	public int updateGoodsStock(List<OrderDetail> orderDetail) {
		int result = 0;
		
		try {
			for(int i=0; i<orderDetail.size(); i++) {
				int optionId = orderDetail.get(i).getOptionId();
				result +=  goodsDao.updateGoodsStock(optionId);
			}
		} catch (Exception e) {
			throw new GoodsException("updateGoodsStock 오류", e);
		}
		
		//return goodsDao.updateGoodsStock(orderDetail);
		return result;
	}

	@Override
	public int updateOrderDetailStatus(int orderDetailNo) {
		return goodsDao.updateOrderDetailStatus(orderDetailNo);
	}
	
	
}