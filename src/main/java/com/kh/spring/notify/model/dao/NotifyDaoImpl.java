package com.kh.spring.notify.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notify.model.vo.SaveNotify;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class NotifyDaoImpl implements NotifyDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertSaveNotify(Map<String, Object> param) {
		return session.insert("notify.insertSaveNotify", param);
	}

	@Override
	public int selectCompareTime(String regTime) {
		return session.selectOne("notify.selectCompareTime", regTime);
	}

	@Override
	public List<SaveNotify> searchNewNotifyList(String id) {
		return session.selectList("notify.searchNewNotifyList", id);
	}

	@Override
	public Object selectOldNotifyCnt(String id) {
		return session.selectOne("notify.selectOldNotifyCnt", id);
	}

	@Override
	public int updateNotifyChecked(Map<String, String> param) {
		return session.update("notify.updateNotifyChecked", param);
	}

	@Override
	public List<SaveNotify> searchOldNotifyList(Map<String, String> param) {
		return session.selectList("notify.searchOldNotifyList", param);
	}

	@Override
	public int notifyCount(String id) {
		return session.selectOne("notify.notifyCount", id);
	}

}
