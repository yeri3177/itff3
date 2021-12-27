package com.kh.spring.review.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Review extends ReviewEntity implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Member member;
	private int attachCount;
	private int reviewCommentCount;
	private List<Attachment> attachments;
	
	public Review(int reviewNo, String memberId, String reviewTitle, String reviewContent, Date regDate, int readCount,
			int recommend, Member member, int attachCount, int reviewCommentCount, List<Attachment> attachments) {
		super(reviewNo, memberId, reviewTitle, reviewContent, regDate, readCount, recommend);
		this.member = member;
		this.attachCount = attachCount;
		this.reviewCommentCount = reviewCommentCount;
		this.attachments = attachments;
	}
	
	
	

}
