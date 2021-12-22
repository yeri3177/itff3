package com.kh.spring.sharing.model.dao;

import java.util.List;

import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoardList(int offset, int limit);

	int selectBoardTotalCount();

	int insertBoard(Board board);

	int insertAttachment(Attachment attach);

	Board selectOneBoard(int no);

	List<Attachment> selectAttachmentListByBoardNo(int no);

}
