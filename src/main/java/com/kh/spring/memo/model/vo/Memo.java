package com.kh.spring.memo.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Memo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long no;
	@NonNull
	private String memo;
	@NonNull
	private String password;
	private Date regDate;
}
