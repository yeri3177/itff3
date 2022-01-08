package com.kh.spring.goods.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderDetailJoin implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private GoodsOrder goodsOrder;
	private OrderDetail orderDetail;
	private Payment payment;
	private Goods goods;
	private OptionDetail optionDetail;

}
