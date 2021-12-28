package com.kh.spring.admin.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SaveNotify implements Serializable {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	private String target;
	private String content;
	private String type;
	private String url;

}
