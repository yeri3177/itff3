package com.kh.spring.movie.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MoviePlus;
import com.kh.spring.movie.model.vo.MovieReservation;
import com.kh.spring.movie.model.vo.MovieSchedule;
import com.kh.spring.movie.model.vo.Seat;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Movie> selectTotalMovieList() {
		return session.selectList("movie.selectTotalMovieList");
	}

	@Override
	public List<MoviePlus> selectMovieSchedule(Map<String, Object> param) {
		System.out.println("param = " + param);
		return session.selectList("movie.selectMovieSchedule", param);
	}

	@Override
	public MovieSchedule selectOneSchedule(String scheduleId) {
		return session.selectOne("movie.selectOneSchedule", scheduleId);
	}

	@Override
	public Movie selectOneMovie(String movieId) {
		return session.selectOne("movie.selectOneMovie", movieId);
	}

	@Override
	public List<Seat> selectSeatList(String scheduleId) {
		return session.selectList("movie.selectSeatList", scheduleId);
	}

	@Override
	public int bookSeats(Map<String, Object> param) {
		return session.update("movie.bookSeats", param);
	}

	@Override
	public int insertReservation(MovieReservation reservation) {
		return session.insert("movie.insertReservation", reservation);
	}

	@Override
	public int updatePoint(Map<String, Object> param2) {
		return session.update("movie.updatePoint", param2);
	}

	@Override
	public String selectLatestReservId() {
		return session.selectOne("movie.selectLatestReservId");
	}
	
	
	
}
