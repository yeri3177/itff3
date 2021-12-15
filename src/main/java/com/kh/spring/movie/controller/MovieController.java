package com.kh.spring.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.movie.model.service.MovieService;
import com.kh.spring.movie.model.vo.Movie;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/movie")
@Slf4j
public class MovieController {

	@Autowired
	private MovieService movieService;
	
	@GetMapping("/movieList.do")
	public String movieList() {
		List<Movie> list = movieService.selectMovieList();
		log.debug("list = {}", list);
		
		return "movie/movieList";
	}
	
}
