package com.kh.spring.sharing.model.service;

import java.util.List;

import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

public interface BoardService {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

	int insertBoard(Board board);

	Board selectOneBoard(int no);

	Board selectOneBoardCollection(int no);

	Attachment selectOneAttachment(int no);

	int deleteBoardAttachment(int attachNo);

	List<Attachment> selectAttachmentByBoardNo(int no);

	int deleteOneBoard(int no);

}
