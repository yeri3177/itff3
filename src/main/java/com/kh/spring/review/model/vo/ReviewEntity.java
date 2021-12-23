package com.kh.spring.review.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int reviewNo;
	private String memberId;
	private String reviewTitle;
	private String reviewContent;
	private Date regDate;
	private int readCount;
	private int  recommend;
}
