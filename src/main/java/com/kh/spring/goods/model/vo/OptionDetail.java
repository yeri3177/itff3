package com.kh.spring.goods.model.vo;

import java.io.Serializable;
import java.util.List;

import com.kh.spring.sharing.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OptionDetail implements Serializable {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	private int optionId;
	private String optionType;
	private String optionColor;
	private String optionSize;
	private int optionStock;
	private String optionImg;
	
	private int attachCount;
	private List<Attachment> attachments;
}
