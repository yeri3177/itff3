package com.kh.spring.goods.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Payment implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private int paymentNo;
	private String orderNo;
	private String memberId;
	private String receiver;
	private String phone;	
	private String postCode;
	private String address;
	private String detailAddress;
	private String orderComment;
	private int totalPrice;
	private int usedPoints;
	private Date paymentDate;
	private String cardName;
	private String cardNumber;
}
