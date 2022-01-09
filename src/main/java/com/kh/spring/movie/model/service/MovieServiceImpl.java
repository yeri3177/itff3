package com.kh.spring.movie.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.movie.model.dao.MovieDao;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MoviePlus;
import com.kh.spring.movie.model.vo.MovieReservation;
import com.kh.spring.movie.model.vo.MovieSchedule;
import com.kh.spring.movie.model.vo.Seat;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDao movieDao;

	@Override
	public List<Movie> selectTotalMovieList() {
		return movieDao.selectTotalMovieList();
	}

	@Override
	public List<MoviePlus> selectMovieSchedule(Map<String, Object> param) {
		return movieDao.selectMovieSchedule(param);
	}

	@Override
	public MovieSchedule selectOneSchedule(String scheduleId) {
		return movieDao.selectOneSchedule(scheduleId);
	}

	@Override
	public Movie selectOneMovie(String movieId) {
		// TODO Auto-generated method stub
		return movieDao.selectOneMovie(movieId);
	}

	@Override
	public List<Seat> selectSeatList(String scheduleId) {
		return movieDao.selectSeatList(scheduleId);
	}

	@Override
	public int bookSeats(Map<String, Object> param) {
		return movieDao.bookSeats(param);
	}

	@Override
	public int insertReservation(MovieReservation reservation) {
		return movieDao.insertReservation(reservation);
	}

	@Override
	public int updatePoint(Map<String, Object> param2) {
		return movieDao.updatePoint(param2);
	}

	@Override
	public String selectLatestReservId() {
		return movieDao.selectLatestReservId();
	}
	


	
}
