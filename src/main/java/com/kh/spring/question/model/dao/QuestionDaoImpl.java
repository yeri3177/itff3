package com.kh.spring.question.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.question.model.vo.Question;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insertQuestion(Question question) {
		return session.insert("question.insertQuestion", question);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("question.insertAttachment", attach);
	}

	@Override
	public List<Question> selectQuestionList(Map<String, Object> param) {
		RowBounds rowBounds = new RowBounds((int) param.get("offset"), (int) param.get("limit"));
		log.debug("param = {}", param);
		
		
		return session.selectList("question.selectQuestionList", param, rowBounds);
	}

	@Override
	public int countTotalContent(String id) {
		return session.selectOne("question.countTotalContent", id);
	}

	@Override
	public Question selectOneQuestionCollection(int no) {
		return session.selectOne("question.selectOneQuestionCollection", no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return session.selectOne("question.selectOneAttachment", no);
	}

	@Override
	public int updateQuestion(Question question) {
		return session.update("question.updateQuestion", question);
	}

	@Override
	public int deleteQuestionAttachment(int attachNo1) {
		return session.delete("question.deleteQuestionAttachment", attachNo1);
	}
}
