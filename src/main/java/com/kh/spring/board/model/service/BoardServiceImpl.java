package com.kh.spring.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.exception.BoardException;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Service("boardService")   // controller에서 service 빈을 찾을 때 이름을 지정할 수 있다.
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
	 * - 여러건의 dml이 모두 성공/실패로 처리되어야 하는 최소단위
	 */
	@Override
	@Transactional(
			propagation = Propagation.REQUIRED,    // 전파?
			isolation = Isolation.READ_COMMITTED,    // 커밋되어야 볼수있게 됨. sql에서 커밋 안하고 이클립스 서버로 보려고 하면 무한로딩 걸리는 그거
			rollbackFor = Exception.class   // 위에 두개는 기본값이라 생략해도 되는데 이건 써야함
			)    
	public int insertBoard(Board board) {
		
		int result = 0;
		try {
			// board insert
			result = boardDao.insertBoard(board);
			log.debug("board.no = {}", board.getNo());   // 등록한 글의 번호
			
			// attachment insert
			List<Attachment> attachments = board.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					attach.setBoardNo(board.getNo());   // attachment의 boardNo는 fk이므로 반드시 글번호를 세팅해줘야 한다.
					result = boardDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			// 사용자정의 예외(RuntimeException)로 전환해서 던짐. 컨트롤러에서 알아서 하라고 던짐
			throw new BoardException("게시글/첨부파일 등록 오류", e);    
		}
		
		return result;
	}

	@Override
	public Board selectOneBoard(int no) {
		// 1. board레코드(1행) 조회
		Board board = boardDao.selectOneBoard(no);
		log.debug("board = {}", board);
		
		// 2. attachment레코드(n행) 조회
		List<Attachment> attachments = boardDao.selectAttachmentListByBoardNo(no);
		log.debug("attachments = {}", attachments);
		
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
	
	
	
}
   