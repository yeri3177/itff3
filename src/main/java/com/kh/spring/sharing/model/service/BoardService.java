package com.kh.spring.sharing.model.service;

import java.util.List;

import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;
import com.kh.spring.sharing.model.vo.BoardComment;

public interface BoardService {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

	int updateBoard(Board board);

	Board selectOneBoard(int no);

	Board selectOneBoardCollection(int no);

	Attachment selectOneAttachment(int no);

	int deleteBoardAttachment(int attachNo);

	List<Attachment> selectAttachmentByBoardNo(int no);

	int deleteOneBoard(int no);

	int deleteAttachment(int i);

	List<BoardComment> selectCommentList(int boardNo);

	int insertBoardComment(BoardComment boardComment);

	int deleteBoardComment(int no);

	int updateBoardReadCount(int no);

}
