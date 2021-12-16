package com.kh.spring.sharing.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.sharing.model.dao.BoardDao;
import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Service("boardService")
@Slf4j
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
	
//	@Override
//	@Transactional(
//			propagation = Propagation.REQUIRED, 
//			isolation = Isolation.READ_COMMITTED,
//			rollbackFor = Exception.class
//			)
//	public int insertBoard(Board board) {
//		
//		int result = 0;
//		
//		// board insert
//		result = boardDao.insertBoard(board);
//		log.debug("board.no = {}", board.getNo()); // 등록한 글의 번호
//		
//		// attachment insert
//		List<Attachment> attachments = board.getAttachments();
//		if(attachments != null) {
//			for(Attachment attach : attachments) {
//				attach.setBoardNo(board.getNo());
//			}
//		}
//	}
	
}
