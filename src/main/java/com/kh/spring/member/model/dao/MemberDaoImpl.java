package com.kh.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

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
	
	
	
	
}
