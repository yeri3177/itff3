package com.kh.spring.sharing.model.vo;

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
public class Board extends BoardEntity implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int attachCount;
	private List<Attachment> attachments;
	
	public Board(int no, String memberId, String title, String content, Date regDate, int readCount, String category, int attachCount, List<Attachment> attachments) {
		super(no, memberId, title, content, regDate, readCount, category);

		this.attachCount = attachCount;
		this.attachments = attachments;
	}
}

	
