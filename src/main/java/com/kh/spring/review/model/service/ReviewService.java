package com.kh.spring.review.model.service;

import java.util.List;

import com.kh.spring.review.model.vo.Review;

public interface ReviewService {

	List<Review> selectReviewList(int offset, int limit);

	int selectReviewTotalCount();

}
