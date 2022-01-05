package com.kh.spring.question.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.question.model.vo.Question;
import com.kh.spring.question.model.vo.QuestionComment;
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

	@Override
	public QuestionComment selectQuestionComment(int no) {
		return session.selectOne("question.selectQuestionComment", no);
	}

	@Override
	public int insertQuestionComment(Map<String, Object> param) {
		return session.insert("question.insertQuestionComment", param);
	}

	@Override
	public int deleteQuestionComment(int commentNo) {
		return session.delete("question.deleteQuestionComment", commentNo);
	}

	@Override
	public List<Question> selectQuestionListByAdmin(int limit, int offset) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("question.selectQuestionListByAdmin", null, rowBounds);
	}

	@Override
	public int countTotalContentByAdmin() {
		return session.selectOne("question.countTotalContentByAdmin");
	}

	@Override
	public int deleteOneQuestion(int questionNo) {
		return session.delete("question.deleteOneQuestion", questionNo);
	}

	@Override
	public int updateQuestionAnswer(int questionNo) {
		return session.update("question.updateQuestionAnswer", questionNo);
	}

	@Override
	public int updateQuestionAnswerToN(int questionNo) {
		return session.update("question.updateQuestionAnswerToN", questionNo);
	}

	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("question.selectOneMember", id);
	}

	@Override
	public int insertSaveNotify(Map<String, Object> param) {
		return session.insert("question.insertSaveNotify", param);
	}


}
