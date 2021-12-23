package com.kh.spring.review.model.dao;

import java.util.List;

import com.kh.spring.review.model.vo.Review;

public interface ReviewDao {

	List<Review> selectReviewList(int offset, int limit);

	int selectReviewTotalCount();

}
