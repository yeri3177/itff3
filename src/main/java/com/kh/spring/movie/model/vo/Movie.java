package com.kh.spring.movie.model.vo;

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
public class Movie implements Serializable {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	private String movieId;
	private String titleKor;
	private String titleEng;
	private String description;
	private Date openingDate;
	private String director; 
	private String actors;
	private String genre;
	private String runningTime;
	private String ageLimit;
	private String image;
	
}
