package com.kh.spring.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Attachment;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Review> selectReviewList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("review.selectReviewList", null, rowBounds);
	}

	@Override
	public int selectReviewTotalCount() {
		return session.selectOne("review.selectReviewTotalCount");
	}

	@Override
	public int insertReview(Review review) {
		return session.insert("review.insertReview", review);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("review.insertAttachment", attach);
	}

	@Override
	public Review selectOneReviewCollection(int reviewNo) {
		return session.selectOne("review.selectOneReviewCollection", reviewNo);
	}

	@Override
	public int updateReviewBoardReadCount(int reviewNo) {
		return session.update("review.updateReviewBoardReadCount", reviewNo);
	}

	@Override
	public Attachment selectOneAttachment(int attachNo) {
		return session.selectOne("review.selectOneAttachment", attachNo);
	}

	@Override
	public int deleteAttachment(int attachNo) {
		return session.delete("review.deleteAttachment", attachNo);
	}

	@Override
	public int updateReview(Review review) {
		return session.update("review.updateReview", review);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return session.delete("review.deleteReview", reviewNo);
	}
	
	
}
