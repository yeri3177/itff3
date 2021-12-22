package com.kh.spring.notice.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.kh.spring.sharing.model.vo.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice extends NoticeEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int attachCount;
	private List<Attachment> attachments;
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date regDate, int readCount, int attachCount, List<Attachment> attachments) {
		super(noticeNo, noticeTitle, noticeContent, regDate, readCount);
		this.attachCount = attachCount;
		this.attachments = attachments;
	}
	
}
