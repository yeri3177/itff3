package com.kh.spring.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PointHistory {

	private int historyNo;
	private String memberId;
	private String reason;
	private String change;
	private int point;
	private Date regDate;
}
