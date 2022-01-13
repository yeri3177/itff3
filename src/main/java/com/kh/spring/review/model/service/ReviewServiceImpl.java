package com.kh.spring.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.review.model.dao.ReviewDao;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.review.model.vo.ReviewComment;
import com.kh.spring.review.model.vo.ReviewLike;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;

	@Override
	public List<Review> selectReviewList(int offset, int limit) {
		return reviewDao.selectReviewList(offset, limit);
	}

	@Override
	public int selectReviewTotalCount() {
		return reviewDao.selectReviewTotalCount();
	}

	@Override
	public int insertReview(Review review) {
		int result = 0;
		try {
			// board insert
			result = reviewDao.insertReview(review);
			log.debug("review.no = {}", review.getReviewNo());   // 등록한 글의 번호
			
			// attachment insert
			List<Attachment> attachments = review.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					attach.setReviewNo(review.getReviewNo());   // attachment의 boardNo는 fk이므로 반드시 글번호를 세팅해줘야 한다.
					result = reviewDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();    
		}
		
		return result;
	}

	@Override
	public Review selectOneReviewCollection(int reviewNo) {
		return reviewDao.selectOneReviewCollection(reviewNo);
	}

	@Override
	public int updateReviewBoardReadCount(int reviewNo) {
		return reviewDao.updateReviewBoardReadCount(reviewNo);
	}

	@Override
	public Attachment selectOneAttachment(int attachNo) {
		return reviewDao.selectOneAttachment(attachNo);
	}

	@Override
	public int deleteAttachment(int attachNo) {
		return reviewDao.deleteAttachment(attachNo);
	}

	@Override
	public int updateReview(Review review) {
		int result = 0;
		try {
			// board insert
			result = reviewDao.updateReview(review);
			log.debug("review.no = {}", review.getReviewNo());   // 등록한 글의 번호
			
			// attachment insert
			List<Attachment> attachments = review.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					result = reviewDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			// 사용자정의 예외(RuntimeException)로 전환해서 던짐. 컨트롤러에서 알아서 하라고 던짐
//			throw new BoardException("게시글/첨부파일 등록 오류", e);
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteReview(int reviewNo) {
		return reviewDao.deleteReview(reviewNo);
	}

	@Override
	public List<ReviewComment> selectCommentList(int reviewNo) {
		return reviewDao.selectCommentList(reviewNo);
	}

	@Override
	public int insertReviewComment(ReviewComment reviewComment) {
		return reviewDao.insertReviewComment(reviewComment);
	}

	@Override
	public int deleteReviewComment(int no) {
		return reviewDao.deleteReviewComment(no);
	}

	@Override
	public int getReviewLike(ReviewLike reviewLike) {
		return reviewDao.getReviewLike(reviewLike);
	}

	@Override
	public int deleteReviewLike(ReviewLike reviewLike) {
		int result = 0;
		try {
			result = reviewDao.deleteReviewLike(reviewLike);
			
			result = reviewDao.updateReviewLike(reviewLike.getReviewNo());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertReviewLike(ReviewLike reviewLike) {
		int result = 0;
		try {
			result = reviewDao.insertReviewLike(reviewLike);
			
			result = reviewDao.updateReviewLike(reviewLike.getReviewNo());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Review> searchReview(Map<String, Object> searchParam) {
		return reviewDao.searchReview(searchParam);
	}
	
	
	
}
