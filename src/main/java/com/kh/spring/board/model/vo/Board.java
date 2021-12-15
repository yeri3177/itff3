package com.kh.spring.board.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.kh.spring.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Board extends BoardEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Member member;
	private int attachCount;
	private List<Attachment> attachments;

	public Board(int no, String title, String memberId, String content, Date regDate, int readCount, Member member,
			int attachCount, List<Attachment> attachments) {
		super(no, title, memberId, content, regDate, readCount);
		this.member = member;
		this.attachCount = attachCount;
		this.attachments = attachments;
	}
	
	
}
