package com.kh.spring.question.model.vo;

import java.io.Serializable;
import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data // Equivalent to @Getter @Setter @RequiredArgsConstructor @ToString @EqualsAndHashCode. 
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class QuestionEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int questionNo;
	private String memberId;
	private String questionTitle;
	private String questionContent;
	private Date regDate;
	
	
	
}
