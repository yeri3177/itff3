package com.kh.spring.sharing.model.vo;

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
public class BoardComment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int boardNo;
	private String writer;
	private String content;
	private int commentLevel; // 댓글 1, 대댓글 2
	private int commentRef;  // 댓글 null, 대댓글인 경우 부모댓글번호 no
	private Date regDate;
	
	private Member member;
	private String upperCommentWriter;
	
}