package com.kh.spring.sharing.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//	private int no;
//	private int boardNo;
//	private String originalFilename;
//	private String renamedFilename;
//	private Date regDate;
	
	private int attachNo;
	private int marketNo;
	private int noticeNo;
	private int reviewNo;
	private String renamedFilename;
	private String originalFilename;
	private Date regDate;
}
