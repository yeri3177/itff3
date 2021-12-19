package com.kh.spring.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int selectMemberTotalCount() {
		return session.selectOne("admin.selectMemberTotalCount");
	}


}
