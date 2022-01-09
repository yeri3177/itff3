package com.kh.spring.movie.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class MovieSchedulePlus extends MovieSchedule implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int maxSeat;
	private int availableSeats;
	
	public MovieSchedulePlus(String movieScheduleId, int theaterId, String movieId, String startDate, String startTime,
			int maxSeat, int availableSeats) {
		super(movieScheduleId, theaterId, movieId, startDate, startTime);
		this.maxSeat = maxSeat;
		this.availableSeats = availableSeats;
	}
	
	
}
