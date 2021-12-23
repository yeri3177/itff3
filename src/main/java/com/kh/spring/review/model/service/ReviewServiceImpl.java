package com.kh.spring.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.review.model.dao.ReviewDao;
import com.kh.spring.review.model.vo.Review;

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
	
	
}
