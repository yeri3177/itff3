package com.kh.spring.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.review.model.vo.Review;

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
	
	
}
