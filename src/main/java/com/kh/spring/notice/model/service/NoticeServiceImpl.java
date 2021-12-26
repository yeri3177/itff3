package com.kh.spring.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.notice.model.dao.NoticeDao;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.sharing.model.exception.BoardException;
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
					attach.setNoticeNo(notice.getNoticeNo());
					log.debug("attach? {}", attach);
					result = noticeDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			throw new BoardException("공지사항 글/첨부파일 등록 오류", e);
		}
		
		
		return result;
	}

	@Override
	public Notice selectOneNoticeCollection(int no) {
		return noticeDao.selectOneNoticeCollection(no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return noticeDao.selectOneAttachment(no);
	}

	@Override
	public List<Member> selectOneloginMember(int no) {
		return noticeDao.selectOneloginMember(no);
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = 0;
		
		try {
			result = noticeDao.updateNotice(notice);
			log.debug("notice.noticeNo= {}", notice.getNoticeNo());
			
			// attachment insert 나눠서 처리
			List<Attachment> attachments = notice.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					attach.setNoticeNo(notice.getNoticeNo());
					log.debug("attach {}?", attach);
					result = noticeDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}

	@Override
	public int deleteNoticeAttachment(int attachNo) {
		return noticeDao.deleteNoticeAttachment(attachNo);
	}

	@Override
	public int deleteOneNotice(int no) {
		return noticeDao.deleteOneNotice(no);
	}

	@Override
	public List<Attachment> selectAttachmentByNoticeNo(int no) {
		return noticeDao.selectAttachmentByNoticeNo(no);
	}

	@Override
	public List<Notice> mainNotice() {
		return noticeDao.mainNotice();
	}
	
}
