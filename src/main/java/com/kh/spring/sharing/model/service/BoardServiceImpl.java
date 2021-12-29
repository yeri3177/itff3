package com.kh.spring.sharing.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.sharing.model.dao.BoardDao;
import com.kh.spring.sharing.model.exception.BoardException;
import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Service("boardService")
@Slf4j
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> selectBoardList(int offset, int limit) {
		return boardDao.selectBoardList(offset, limit);
	}
	
	@Override
	public int selectBoardTotalCount() {
		return boardDao.selectBoardTotalCount();
	}
	/**
	 * 트랜잭션 처리
	 * - 여러건의 dml이 모두 성공/ 실패로 처리되어야 하는 최소단위
	 */

	@Override
	@Transactional(
			propagation = Propagation.REQUIRED, 
			isolation = Isolation.READ_COMMITTED, 
			rollbackFor = Exception.class
	)
	public int insertBoard(Board board) {
		int result = 0;
		// board insert
		try {
			result = boardDao.insertBoard(board);
			log.debug("BoardServiceImpl_board.no = {}", board.getNo());
			// attachment insert
			List<Attachment> attachments = board.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					attach.setMarketNo(board.getNo()); // fk컬럼값 세팅(필수)
					result = boardDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			// 사용자정의예외(RuntimeException)로 전환 던짐
			throw new BoardException("게시글/첨부파일 등록 오류", e);
		} 
		return result;
	}

	@Override
	public Board selectOneBoard(int no) {
		//1. board레코드(1행) 조회
		Board board = boardDao.selectOneBoard(no);
		log.debug("board = {}", board);
		
		//2. attachment레코드(n행) 조회
		List<Attachment> attachments = boardDao.selectAttachmentListByBoardNo(no);
		log.debug("attachment = {}", attachments);
		
		if(!attachments.isEmpty())
			board.setAttachments(attachments);
		
		return board;
	}

	@Override
	public Board selectOneBoardCollection(int no) {
		return boardDao.selectOneBoardCollection(no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return boardDao.selectOneAttachment(no);
	}

	@Override
	public int deleteBoardAttachment(int attachNo) {
		return boardDao.deleteBoardAttachment(attachNo);
	}

	@Override
	public List<Attachment> selectAttachmentByBoardNo(int no) {
		return boardDao.selectAttachmentByBoardNo(no);
	}

	@Override
	public int deleteOneBoard(int no) {
		return boardDao.deleteOneBoard(no);
	}

	

	
}
