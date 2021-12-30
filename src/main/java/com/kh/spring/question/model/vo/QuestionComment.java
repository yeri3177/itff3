package com.kh.spring.question.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.spring.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data // Equivalent to @Getter @Setter @RequiredArgsConstructor @ToString @EqualsAndHashCode. 
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class QuestionComment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int questionNo;
	private String writer;
	private String content;
	private Date regDate;
	
	private Member member;
}
