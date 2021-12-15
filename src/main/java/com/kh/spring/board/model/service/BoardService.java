package com.kh.spring.board.model.service;

import java.util.List;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface BoardService {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

	int insertBoard(Board board);

	Board selectOneBoard(int no);

	Board selectOneBoardCollection(int no);

	Attachment selectOneAttachment(int no);

}
