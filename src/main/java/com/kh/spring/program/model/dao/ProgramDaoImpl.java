package com.kh.spring.program.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.movie.model.vo.Movie;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ProgramDaoImpl implements ProgramDao {
	
	@Autowired
	private SqlSession session;
	
	public List<Movie> searchProgram(Map<String, Object> param) {
		RowBounds rowBounds = new RowBounds((int)param.get("offset"), (int)param.get("limit"));
		return session.selectList("program.searchProgram", param, rowBounds);
	}

	@Override
	public int searchProgramTotalContent(String searchKeyword) {
		return session.selectOne("program.searchProgramTotalContent", searchKeyword);
	}

}
