package com.kh.spring.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Goods> selectGoodsList() {
		return session.selectList("admin.selectGoodsList");
	}

	@Override
	public int insertGoods(Goods goods) {
		return session.insert("admin.insertGoods", goods);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("admin.insertAttachment", attach);
	}

}
