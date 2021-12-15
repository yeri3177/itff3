package com.kh.spring.memo.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.memo.model.vo.Memo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemoDaoImpl implements MemoDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertMemo(Memo memo) {
		return session.insert("memo.insertMemo", memo);
	}

	@Override
	public List<Memo> selectMemoList() {
		log.debug("{}", "selectMemoList dao 요청!");
		return session.selectList("memo.selectMemoList");
	}

	@Override
	public int deleteMemo(int no) {
		return session.delete("memo.deleteMemo", no);
	}

	@Override
	public Memo selectOneMemo(int no) {
		return session.selectOne("memo.selectOneMemo", no);
	}
	
	
	
	
}
