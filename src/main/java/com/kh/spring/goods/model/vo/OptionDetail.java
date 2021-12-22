package com.kh.spring.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OptionDetail {

	private int optionId;
	private String optionType;
	private String optionColor;
	private String optionSize;
	private int optionStock;
	private String optionImg;
}
