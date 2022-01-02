package com.kh.spring.sharing.model.dao;

import java.util.List;

import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;
import com.kh.spring.sharing.model.vo.BoardComment;

public interface BoardDao {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

	int insertBoard(Board board);

	int insertAttachment(Attachment attach);

	Board selectOneBoard(int no);

	List<Attachment> selectAttachmentListByBoardNo(int no);

	Board selectOneBoardCollection(int no);

	Attachment selectOneAttachment(int no);

	int deleteBoardAttachment(int attachNo);

	List<Attachment> selectAttachmentByBoardNo(int no);

	int deleteOneBoard(int no);

	List<BoardComment> selectCommentList(int boardNo);

}
