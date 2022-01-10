package com.kh.spring.member.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberMovieReservation implements Serializable {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	private String movieReservationId;
	private String movieScheduleId;
	private String memberId;
	private String movieId;
	private String titleKor;
	private String selectedSeat;
	private Date regDate; 
	private int theaterId;
	private String startDate;
	private String startTime;
	private int amount;
	private int count;
	private String image;
	
}
