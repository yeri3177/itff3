package com.kh.spring.question.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.question.model.dao.QuestionDao;
import com.kh.spring.question.model.vo.Question;
import com.kh.spring.question.model.vo.QuestionComment;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	@Override
	public int insertQuestion(Question question) {
		
		int result = 0;
		try {
			log.debug("서비스까지는 왔다");
			
			result = questionDao.insertQuestion(question);
			log.debug("새로 생성된 question.quesitonNo = {}", question.getQuestionNo());
			
			// attachment insert 나눠서 처리
			List<Attachment> attachments = question.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					attach.setQuestionNo(question.getQuestionNo());
					log.debug("attach ? {}", attach);
					result = questionDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}

	@Override
	public List<Question> selectQuestionList(Map<String, Object> param) {
		return questionDao.selectQuestionList(param);
	}

	@Override
	public int countTotalContent(String id) {
		return questionDao.countTotalContent(id);
	}

	@Override
	public Question selectQuestionCollection(int no) {
		return questionDao.selectOneQuestionCollection(no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return questionDao.selectOneAttachment(no);
	}

	@Override
	public int updateQuestion(Question question) {
		int result = 0;
		try {
			
			result = questionDao.updateQuestion(question);
			log.debug("question.questionNo = {}", question.getQuestionNo());
			
			List<Attachment> attachments = question.getAttachments();
			if(attachments != null) {
				log.debug("attachments? {}", attachments);
				log.debug("attachments.get(0).getAttachNo() : {}", attachments.get(0).getAttachNo());
				log.debug("attachments.get(0).getQuestionNo() ? {}", attachments.get(0).getQuestionNo());
				
				for(Attachment attach : attachments) {
					
						attach.setQuestionNo(question.getQuestionNo());
						log.debug("attach = {}", attach);
						result = questionDao.insertAttachment(attach);
						
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteQuestionAttachment(int attachNo1) {
		return questionDao.deleteQuestionAttachment(attachNo1);
	}

	@Override
	public QuestionComment selectQuestionComment(int no) {
		return questionDao.selectQuestionComment(no);
	}

	@Override
	public int insertQuestionComment(Map<String, Object> param) {
		return questionDao.insertQuestionComment(param);
	}

	@Override
	public int deleteQuestionComment(int commentNo) {
		return questionDao.deleteQuestionComment(commentNo);
	}

	@Override
	public List<Question> selectQuestionListByAdmin(int limit, int offset) {
		return questionDao.selectQuestionListByAdmin(limit, offset);
	}

	@Override
	public int countTotalContentByAdmin() {
		return questionDao.countTotalContentByAdmin();
	}

	@Override
	public int deleteOneQuestion(int questionNo) {
		return questionDao.deleteOneQuestion(questionNo);
	}
	
}
