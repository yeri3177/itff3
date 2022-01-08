package com.kh.spring.admin.model.vo;

import java.io.Serializable;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsOrder;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.goods.model.vo.OrderDetail;
import com.kh.spring.goods.model.vo.Payment;
import com.kh.spring.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GoodsPaymentJoin implements Serializable  {
	
	private static final long serialVersionUID = 1L;
	
	private OrderDetail orderDetail;
	private Member member;
	private Payment payment;
}
