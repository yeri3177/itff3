package com.kh.spring.question.model.vo;

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
public class Question extends QuestionEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int attachCount;
	private List<Attachment> attachments;
	
	public Question(int questionNo, String memberId, String questionTitle, String questionContent, Date regDate, String answer, int attachCount, List<Attachment> attachments) {
		super(questionNo, memberId, questionTitle, questionContent, regDate, answer);
		this.attachCount = attachCount;
		this.attachments = attachments;
	}

}
