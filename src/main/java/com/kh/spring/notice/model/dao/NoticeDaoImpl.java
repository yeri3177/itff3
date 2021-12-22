package com.kh.spring.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Notice> selectNoticeList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
//		selectList의 두번째 인자 parameter는 생략 불가능하니 null로 전달
		return session.selectList("notice.selectNoticeList", null, rowBounds);
	}

	@Override
	public int countTotalContent() {
		return session.selectOne("notice.countTotalContent");
	}

	@Override
	public int insertNotice(Notice notice) {
		return session.insert("notice.insertNotice", notice);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("notice.insertAttachment", attach);
	}

	@Override
	public Notice selectOneNoticeCollection(int no) {
		return session.selectOne("notice.selectOneNoticeCollection", no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return session.selectOne("notice.selectOneAttachment", no);
	}

	@Override
	public List<Member> selectOneloginMember(int no) {
		return session.selectList("notice.selectOneloginMember", no);
	}
	
}
