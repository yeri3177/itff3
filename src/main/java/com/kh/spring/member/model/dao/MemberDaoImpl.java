package com.kh.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.member.model.vo.Point;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Board;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int insertMember(Member member) {
		return session.insert("member.insertMember", member);
	}

	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("member.selectOneMember", id);
	}

	@Override
	public int updateMember(Member member) {
		return session.update("member.updateMember", member);
	}

	@Override
	public List<Member> selectMemberList(String gender) {
		return session.selectList("member.selectMemberList", gender);
	}

	@Override
	public List<Member> selectMemberList() {
		return session.selectList("member.selectMemberList1");
	}

	@Override
	public List<Member> selectMemberList(Map<String, Object> param) {
		return session.selectList("member.selectMemberList", param);
	}

	@Override
	public Member selectOneEmail(String email) {
		return session.selectOne("member.selectOneEmail", email);
	}

	@Override
	public Member selectOneNickname(String nickname) {
		return session.selectOne("member.selectOneNickname", nickname);
	}

	@Override
	public List<Board> selectBoardListByMemberId(int offset, int limit, String id) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("member.selectBoardListByMemberId", id, rowBounds);
	}

	@Override
	public int selectBoardTotalCount(String id) {
		return session.selectOne("member.selectBoardTotalCount", id);
	}

	@Override
	public int insertGoods(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertProfileImage(Map<String, Object> param) {
		return session.update("member.insertProfileImage", param);
	}

	@Override
	public List<Review> selectReviewListByMemberId(int offset, int limit, String id) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("member.selectReviewListByMemberId", id, rowBounds);
	}

	@Override
	public int selectReviewTotalCount(String id) {
		return session.selectOne("member.selectReviewTotalCount", id);
	}

	@Override
	public List<Point> selectPointListByMemberId(int offset, int limit, String id) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("member.selectPointListByMemberId", id, rowBounds);
	}

	@Override
	public int selectPointTotalCount(String id) {
		return session.selectOne("member.selectPointTotalCount", id);
	}

	@Override
	public int dailyCheckInsert(String id) {
		return session.insert("member.dailyCheckInsert", id);
	}

	@Override
	public int insertPointHistory(Map<String, Object> param) {
		return session.insert("member.insertPointHistory", param);
	}

	
	
	
	
}
