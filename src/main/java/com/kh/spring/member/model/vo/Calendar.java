package com.kh.spring.member.model.vo;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Calendar implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int calendarNo;
	private String memberId;
	private String memberCheck;
	private String checkDate;
	private Date regDate;
			
}
