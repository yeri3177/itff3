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
public class OrderDetail implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String orderDetailNo;
	private String orderNo;
	private int pId;
	private int optionId;
	private int quantity;
}
