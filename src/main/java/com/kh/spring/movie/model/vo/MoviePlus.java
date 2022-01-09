package com.kh.spring.movie.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class MoviePlus extends Movie implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<MovieSchedulePlus> schedules;

	public MoviePlus(String movieId, String titleKor, String titleEng, String description, Date openingDate,
			String director, String actors, String genre, String runningTime, String ageLimit, String image,
			List<MovieSchedulePlus> schedules) {
		super(movieId, titleKor, titleEng, description, openingDate, director, actors, genre, runningTime, ageLimit,
				image);
		this.schedules = schedules;
	}
	

	
}

