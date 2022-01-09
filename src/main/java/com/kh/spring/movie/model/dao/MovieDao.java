package com.kh.spring.movie.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MoviePlus;
import com.kh.spring.movie.model.vo.MovieReservation;
import com.kh.spring.movie.model.vo.MovieSchedule;
import com.kh.spring.movie.model.vo.Seat;

public interface MovieDao {

	List<Movie> selectTotalMovieList();

	List<MoviePlus> selectMovieSchedule(Map<String, Object> param);

	MovieSchedule selectOneSchedule(String scheduleId);

	Movie selectOneMovie(String movieId);

	List<Seat> selectSeatList(String scheduleId);

	int bookSeats(Map<String, Object> param);

	int insertReservation(MovieReservation reservation);

	int updatePoint(Map<String, Object> param2);

	String selectLatestReservId();



}
