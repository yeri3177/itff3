package com.kh.spring.movie.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.movie.model.dao.MovieDao;
import com.kh.spring.movie.model.vo.Movie;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDao movieDao;
	
	@Override
	public List<Movie> selectMovieList() {
		return movieDao.selectMovieList();
	}

	
}
