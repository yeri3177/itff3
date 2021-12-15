package com.kh.spring.movie.model.dao;

import java.util.List;

import com.kh.spring.movie.model.vo.Movie;

public interface MovieDao {

	List<Movie> selectMovieList();

}
