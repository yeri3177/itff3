package com.kh.spring.review.model.service;

import java.util.List;

import com.kh.spring.review.model.vo.Review;
import com.kh.spring.review.model.vo.ReviewComment;
import com.kh.spring.sharing.model.vo.Attachment;

public interface ReviewService {

	List<Review> selectReviewList(int offset, int limit);

	int selectReviewTotalCount();

	int insertReview(Review review);

	Review selectOneReviewCollection(int reviewNo);

	int updateReviewBoardReadCount(int reviewNo);

	Attachment selectOneAttachment(int attachNo);

	int deleteAttachment(int i);

	int updateReview(Review review);

	int deleteReview(int reviewNo);

	List<ReviewComment> selectCommentList(int reviewNo);

	int insertReviewComment(ReviewComment reviewComment);

}
