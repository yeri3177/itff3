package com.kh.spring.movie.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MovieJoin implements Serializable  {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	private Movie movie;
	private MovieSchedule movieSchedule;
	private MovieReservation movieReservation;
	private Seat seat;
	private Theater theater;
}
