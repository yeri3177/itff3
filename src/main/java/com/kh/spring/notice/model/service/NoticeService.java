package com.kh.spring.notice.model.service;

import java.util.List;

import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.sharing.model.vo.Attachment;

public interface NoticeService {

	List<Notice> selectNoticeList(int offset, int limit);

	int countTotalContent();

	int insertNotice(Notice notice);

	Notice selectOneNoticeCollection(int no);

	Attachment selectOneAttachment(int no);

}
