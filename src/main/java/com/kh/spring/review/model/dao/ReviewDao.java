package com.kh.spring.review.model.dao;

import java.util.List;

import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Attachment;

public interface ReviewDao {

	List<Review> selectReviewList(int offset, int limit);

	int selectReviewTotalCount();

	int insertReview(Review review);

	int insertAttachment(Attachment attach);

	Review selectOneReviewCollection(int reviewNo);

	int updateReviewBoardReadCount(int reviewNo);

	Attachment selectOneAttachment(int attachNo);

	int deleteAttachment(int attachNo);

	int updateReview(Review review);

	int deleteReview(int reviewNo);

}
