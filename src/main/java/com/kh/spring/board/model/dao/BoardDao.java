package com.kh.spring.board.model.dao;

import java.util.List;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

	int insertBoard(Board board);

	int insertAttachment(Attachment attach);

	Board selectOneBoard(int no);

	List<Attachment> selectAttachmentListByBoardNo(int no);

	Board selectOneBoardCollection(int no);

	Attachment selectOneAttachment(int no);

}
