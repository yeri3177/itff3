package com.kh.spring.notice.model.service;

import java.util.List;

import com.kh.spring.notice.model.vo.Notice;

public interface NoticeService {

	List<Notice> selectNoticeList(int offset, int limit);

	int countTotalContent();

	int insertNotice(Notice notice);

}
