package com.kh.spring.review.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class ReviewLike implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int reviewLikeNo;
	private String memberId;
	private int reviewNo;

}
