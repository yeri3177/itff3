package com.kh.spring.movie.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.spring.admin.model.vo.PointHistory;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Seat implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String seatNo;
	private String movieScheduleId;
	private int isBooked;
	
	private Movie movie;
	private MovieSchedule movieSchedule;
	private Theater theater;
}
