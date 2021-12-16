package com.kh.spring.sharing.model.service;

import java.util.List;

import com.kh.spring.sharing.model.vo.Board;

public interface BoardService {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

}
