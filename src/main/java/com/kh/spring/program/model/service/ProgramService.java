package com.kh.spring.program.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.movie.model.vo.Movie;

public interface ProgramService {

	List<Movie> searchProgram(Map<String, Object> param);

	int searchProgramTotalContent(String searchKeyword);

}
