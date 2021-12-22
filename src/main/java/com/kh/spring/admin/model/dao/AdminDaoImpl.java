package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.model.vo.PointHistory;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;
	
	/**
	 * [회원]
	 */

	@Override
	public List<Member> selectMemberList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return session.selectList("admin.selectMemberList", null, rowBounds);
	}
	
	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("admin.selectOneMember", id);
	}
	
	@Override
	public int selectMemberTotalCount() {
		return session.selectOne("admin.selectMemberTotalCount");
	}
	
	@Override
	public List<PointHistory> selectMemberPointHistoryList(String id) {
		return session.selectList("admin.selectMemberPointHistoryList", id);
	}
	
	@Override
	public int updateMember(Member member) {
		return session.update("admin.updateMember", member);
	}

	@Override
	public List<Member> searchMember(Map<String, Object> param) {
			int offset = (int) param.get("start");
			int limit = (int) param.get("end");
			log.debug("offset, limit = {}", offset, limit);
			log.debug("param = {}", param);
			RowBounds rowBounds = new RowBounds(offset, limit); 
			
		return session.selectList("admin.searchMember", param, rowBounds);
	}

	@Override
	public int searchMemberCount(Map<String, Object> param) {
		return session.selectOne("admin.searchMemberCount", param);
	}

	/**
	 * [굿즈]
	 */

	@Override
	public List<Goods> selectGoodsList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return session.selectList("admin.selectGoodsList", null, rowBounds);
	}

	@Override
	public int insertGoods(Goods goods) {
		return session.insert("admin.insertGoods", goods);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("admin.insertAttachment", attach);
	}

	@Override
	public int deleteGoods(int pId) {
		return session.delete("admin.deleteGoods", pId);
	}

	@Override
	public Goods selectOneGoods(int pId) {
		return session.selectOne("admin.selectOneGoods", pId);
	}

	@Override
	public int updateGoods(Goods goods) {
		return session.update("admin.updateGoods", goods);
	}

	@Override
	public List<Goods> selectRecentTenGoodsList() {
		return session.selectList("admin.selectRecentTenGoodsList");
	}

	@Override
	public List<Goods> searchGoods(Map<String, Object> param) {
		int offset = (int) param.get("start");
		int limit = (int) param.get("end");
		log.debug("offset, limit = {}", offset, limit);
		log.debug("param = {}", param);
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
	return session.selectList("admin.searchGoods", param, rowBounds);
	}

	@Override
	public int searchGoodsCount(Map<String, Object> param) {
		return session.selectOne("admin.searchGoodsCount", param);
	}

	@Override
	public int insertPointHistory(Map<String, Object> param) {
		return session.insert("admin.insertPointHistory", param);
	}

	@Override
	public int updateMemberPoint(Map<String, Object> param) {
		return session.update("admin.updateMemberPoint", param);
	}
}