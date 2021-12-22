package com.kh.spring.notice.model.vo;

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
public class NoticeEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date regDate;
	private int readCount;

}
