package com.kh.spring.review.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.spring.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class ReviewComment implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int no;
	private int reviewNo;	// 이 댓글이 달려있는 글번호
	private String writer;
	private String content;
	private Date regDate;
	private int commentLevel;   // 댓글은 1, 대댓글은 2
	private int commentRef;   // 댓글은 null, 대댓글은 부모댓글번호 no
	
	private Member member;
	private String upperCommentWriter;   // 대댓글의 경우 원 댓글 작성자의 닉네임
	
}
