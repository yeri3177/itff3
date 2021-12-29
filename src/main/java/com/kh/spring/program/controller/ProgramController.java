package com.kh.spring.program.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MovieJoin;
import com.kh.spring.movie.model.vo.MovieSchedule;
import com.kh.spring.program.model.service.ProgramService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/program")
@Slf4j
public class ProgramController {

	@Autowired
	private  ProgramService programService;
	
	
	
	
	//////////////////////////
	
	@GetMapping("/openClose.do")
	public void openClose() {}
	
	@GetMapping("/ai.do")
	public void ai() {}
	
	@GetMapping("/security.do")
	public void security() {}
	
	@GetMapping("/deepRunning.do")
	public void deepRunning() {}
	
	@GetMapping("/bigData.do")
	public void bigData() {}
	
	@GetMapping("/flatform.do")
	public void flatform() {}
	
	@GetMapping("/debugging.do")
	public void debugging() {}
	
	@GetMapping("/programSearch.do")
	public void programSearch() {}
	
	/////////////////////////////////////
	
	
	
	@GetMapping("/synopsis/matrix.do")
	public void matrix(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/aiSynopsis.do")
	public void aiSynopsis(
			Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/iRobot.do")
	public void iRobot(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/eagleEye.do")
	public void eagleEye(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/password.do")
	public void password(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/gattaca.do")
	public void gattaca(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/thirteen.do")
	public void thirteen(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/her.do")
	public void her(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/citizenFour.do")
	public void citizenFour(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/casinoRoyale.do")
	public void casinoRoyale(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/missionImpossible.do")
	public void missionImpossible(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/erin.do")
	public void erin(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	@GetMapping("/synopsis/looper.do")
	public void looper(Model model,
			@RequestParam String movieId
			) {
		
		String newMovieId = "movie-" + movieId;
		log.debug("newMovieId = {}", newMovieId);
		
		List<MovieJoin> list = programService.selectMovieSchedule(newMovieId);
		log.debug("list = {}", list);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		List<Movie> movie = new ArrayList<Movie>();
		Movie movies = new Movie();
		String ageLimit = null;
		
		for(int i = 0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();
			
			movies = list.get(i).getMovie();
			
			movieSchedule.add(movieSchedules);
			movie.add(movies);
			
			ageLimit = list.get(i).getMovie().getAgeLimit();
		}
		
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("ageLimit",ageLimit);
		
	}
	
	
	///////////////////////////////////////////////
	
	
	
	@GetMapping("/programFinder.do")
	public String programFinder(
			@RequestParam String program,
			@RequestParam(defaultValue = "1") int cPage,
			Model model,
			HttpServletRequest request
			) {
		
		model.addAttribute("program", program);
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		String searchKeyword = "%" + program + "%";
		
		Map<String, Object> param = new HashMap<>();
		param.put("searchKeyword", searchKeyword);
		param.put("limit", limit);
		param.put("offset", offset);
		
		List<Movie> movieList = programService.searchProgram(param);
		log.debug("movieList = {}", movieList);
		model.addAttribute("movieList", movieList);
		
		// 총 게시물 수
		int totalContent = programService.searchProgramTotalContent(searchKeyword);
		log.debug("totalContent = {}", totalContent);
		
		String url = request.getRequestURI();
		
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		
		return "program/programSearch";
	}
	
}
