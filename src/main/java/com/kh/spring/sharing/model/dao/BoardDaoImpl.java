package com.kh.spring.sharing.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Board> selectBoardList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("board.selectBoardList", null, rowBounds);
	}

	@Override
	public int selectBoardTotalCount() {
		return session.selectOne("board.selectBoardTotalCount");
	}

	@Override
	public int insertBoard(Board board) {
		return session.insert("board.insertBoard", board);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("board.insertAttachment", attach);
	}

	@Override
	public Board selectOneBoard(int no) {
		return session.selectOne("board.selectOneBoard", no);
	}

	@Override
	public List<Attachment> selectAttachmentListByBoardNo(int boardNo) {
		return session.selectList("board.selectAttachmentListByBoardNo", boardNo);
	}

	@Override
	public Board selectOneBoardCollection(int no) {
		return session.selectOne("board.selectOneBoardCollection", no);
	}

	
}
