package com.kh.spring.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.notice.model.exception.BoardException;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Notice> selectNoticeList(int offset, int limit) {
		return noticeDao.selectNoticeList(offset, limit);
	}

	@Override
	public int countTotalContent() {
		return noticeDao.countTotalContent();
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = 0;
		log.debug("아히");
		try {
			result = noticeDao.insertNotice(notice);
			log.debug("새로 생성된 notice.noticeNo = {}", notice.getNoticeNo());
			
			// attachmenet insert 나눠서 처리
			List<Attachment> attachments = notice.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					attach.setAttachNo(notice.getNoticeNo());
					result = noticeDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			throw new BoardException("공지사항 글/첨부파일 등록 오류", e);
		}
		
		
		return result;
	}
	
}
