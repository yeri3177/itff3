package com.kh.spring.sharing.model.dao;

import java.util.List;

import com.kh.spring.sharing.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

	int insertBoard(Board board);

}
