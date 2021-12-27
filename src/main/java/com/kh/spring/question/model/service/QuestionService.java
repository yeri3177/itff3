package com.kh.spring.question.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.question.model.vo.Question;
import com.kh.spring.question.model.vo.QuestionComment;
import com.kh.spring.sharing.model.vo.Attachment;

public interface QuestionService {

	int insertQuestion(Question question);

	List<Question> selectQuestionList(Map<String, Object> param);

	int countTotalContent(String id);

	Question selectQuestionCollection(int no);

	Attachment selectOneAttachment(int no);

	int updateQuestion(Question question);

	int deleteQuestionAttachment(int attachNo1);

	QuestionComment selectQuestionComment(int no);

	int insertQuestionComment(Map<String, Object> param);

	int deleteQuestionComment(int commentNo);

	List<Question> selectQuestionListByAdmin(int limit, int offset);

	int deleteOneQuestion(int questionNo);

	int countTotalContentByAdmin();

	int updateQuestionAnswer(int questionNo);

	int updateQuestionAnswerToN(int questionNo);

}
