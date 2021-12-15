package com.kh.spring.memo.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.memo.model.dao.MemoDao;
import com.kh.spring.memo.model.vo.Memo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemoServiceImpl implements MemoService {

	@Autowired
	private MemoDao memoDao;

	@Override
	public int insertMemo(Memo memo) {
		return memoDao.insertMemo(memo);
	}

	@Override
	public List<Memo> selectMemoList() {
		log.debug("{}", "selectMemoList service 요청!");
		return memoDao.selectMemoList();
	}

	@Override
	public int deleteMemo(int no, String password) {
		return memoDao.deleteMemo(no);
	}

	@Override
	public Memo selectOneMemo(int no) {
		return memoDao.selectOneMemo(no);
	}
	
	
	
	
}
