package com.kh.spring.movie.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.movie.model.vo.Movie;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Movie> selectMovieList() {
		return session.selectList("movie.selectMovieList");
	}

	
}
