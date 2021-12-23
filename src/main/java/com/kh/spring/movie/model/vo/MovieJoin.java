package com.kh.spring.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MovieJoin {

	private Movie movie;
	private MovieSchedule movieSchedule;
	private Seat seat;
	private Theater theater;
}
