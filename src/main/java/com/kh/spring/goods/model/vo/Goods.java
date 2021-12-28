package com.kh.spring.goods.model.vo;

import java.io.Serializable;
import java.util.Date;
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
public class Goods implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int pId;
	private String pName;
	private int pPrice;
	private String pInfo;
	private String pImg;
	private String pCategory;
	private Date pEnroll;
	private String pSubcategory; 
	
	private int attachCount;
	private List<Attachment> attachments;

}
