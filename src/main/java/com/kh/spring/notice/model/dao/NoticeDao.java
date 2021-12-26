package com.kh.spring.notice.model.dao;

import java.util.List;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.sharing.model.vo.Attachment;

public interface NoticeDao {

	List<Notice> selectNoticeList(int offset, int limit);

	int countTotalContent();

	int insertNotice(Notice notice);

	int insertAttachment(Attachment attach);

	Notice selectOneNoticeCollection(int no);

	Attachment selectOneAttachment(int no);

	List<Member> selectOneloginMember(int no);

	int updateNotice(Notice notice);


	int deleteNoticeAttachment(int attachNo);

	int deleteOneNotice(int no);

	List<Attachment> selectAttachmentByNoticeNo(int no);

	List<Notice> mainNotice();

}
