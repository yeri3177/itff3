package com.kh.spring.program.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.program.model.dao.ProgramDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProgramServiceImpl implements ProgramService {

	@Autowired
	private ProgramDao programDao;

	@Override
	public List<Movie> searchProgram(Map<String, Object> param) {
		return programDao.searchProgram(param);
	}

	@Override
	public int searchProgramTotalContent(String searchKeyword) {
		return programDao.searchProgramTotalContent(searchKeyword);
	}
	
}
