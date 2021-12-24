package com.kh.spring.question.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.question.model.vo.Question;
import com.kh.spring.sharing.model.vo.Attachment;

public interface QuestionDao {

	int insertQuestion(Question question);

	int insertAttachment(Attachment attach);

	List<Question> selectQuestionList(Map<String, Object> param);

	int countTotalContent(String id);

	Question selectOneQuestionCollection(int no);

	Attachment selectOneAttachment(int no);

	int updateQuestion(Question question);

	int deleteQuestionAttachment(int attachNo1);

}
