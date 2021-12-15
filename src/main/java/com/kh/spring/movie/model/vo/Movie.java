package com.kh.spring.movie.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Movie implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int movieId;
	private String description;
	private String titleKor;
	private String titleEng;
	private Date productionDate;
	private Date openingDate;
	private String director; 
	private String field;
	private String genre;
	private String runningTime;
	private String ageLimit;
	private String imageUrl;
}
