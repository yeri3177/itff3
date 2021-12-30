package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.admin.model.vo.PointHistory;
import com.kh.spring.event.model.vo.RouletteEvent;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MovieJoin;
import com.kh.spring.movie.model.vo.Theater;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.question.model.vo.Question;
import com.kh.spring.question.model.vo.QuestionComment;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Member> selectMemberList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return session.selectList("admin.selectMemberList", null, rowBounds);
	}
	
	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("admin.selectOneMember", id);
	}
	
	@Override
	public int selectMemberTotalCount() {
		return session.selectOne("admin.selectMemberTotalCount");
	}
	
	@Override
	public List<PointHistory> selectMemberPointHistoryList(String id) {
		return session.selectList("admin.selectMemberPointHistoryList", id);
	}
	
	@Override
	public int updateMember(Member member) {
		return session.update("admin.updateMember", member);
	}

	@Override
	public List<Member> searchMember(Map<String, Object> param) {
			int offset = (int) param.get("start");
			int limit = (int) param.get("end");
			log.debug("offset, limit = {}", offset, limit);
			log.debug("param = {}", param);
			RowBounds rowBounds = new RowBounds(offset, limit); 
			
		return session.selectList("admin.searchMember", param, rowBounds);
	}

	@Override
	public int searchMemberCount(Map<String, Object> param) {
		return session.selectOne("admin.searchMemberCount", param);
	}
	
	/**
	 * 영화
	 */
	
	@Override
	public List<Movie> selectMovieList() {
		return session.selectList("admin.searchMovieList");
	}

	/**
	 * [굿즈]
	 */

	@Override
	public List<Goods> selectGoodsList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return session.selectList("admin.selectGoodsList", null, rowBounds);
	}

	@Override
	public int insertGoods(Goods goods) {
		return session.insert("admin.insertGoods", goods);
	}

	@Override
	public int insertAttachment(Attachment attach) {
		return session.insert("admin.insertAttachment", attach);
	}

	@Override
	public int deleteGoods(int pId) {
		return session.delete("admin.deleteGoods", pId);
	}

	@Override
	public Goods selectOneGoods(int pId) {
		return session.selectOne("admin.selectOneGoods", pId);
	}

	@Override
	public int updateGoods(Goods goods) {
		return session.update("admin.updateGoods", goods);
	}

	@Override
	public List<Goods> selectRecentTenGoodsList() {
		return session.selectList("admin.selectRecentTenGoodsList");
	}

	@Override
	public List<Goods> searchGoods(Map<String, Object> param) {
		int offset = (int) param.get("start");
		int limit = (int) param.get("end");
		log.debug("offset, limit = {}", offset, limit);
		log.debug("param = {}", param);
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
	return session.selectList("admin.searchGoods", param, rowBounds);
	}

	@Override
	public int searchGoodsCount(Map<String, Object> param) {
		return session.selectOne("admin.searchGoodsCount", param);
	}

	@Override
	public int insertPointHistory(Map<String, Object> param) {
		return session.insert("admin.insertPointHistory", param);
	}

	@Override
	public int updateMemberPoint(Map<String, Object> param) {
		return session.update("admin.updateMemberPoint", param);
	}

	@Override
	public Movie selectOneMovie(String movieId) {
		return session.selectOne("admin.selectOneMovie", movieId);
	}

	@Override
	public List<Theater> selectTheaterList() {
		return session.selectList("admin.selectTheaterList");
	}

	@Override
	public List<MovieJoin> selectOneTheater(int theaterId) {
		return session.selectList("admin.selectOneTheater", theaterId);
	}

	@Override
	public List<MovieJoin> adminOneMovieSchedule(String movieId) {
		return session.selectList("admin.adminOneMovieSchedule", movieId);
	}

	@Override
	public List<MovieJoin> adminOneMovieScheduleDate(Map<String, Object> param) {
		return session.selectList("admin.adminOneMovieScheduleDate", param);
	}

	@Override
	public List<Notice> adminSelectNoticeList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.adminSelectNoticeList", null, rowBounds);
	}

	@Override
	public int countTotalNoticeContent() {
		return session.selectOne("admin.countTotalNoticeContent");
	}

	@Override
	public int insertNotice(Notice notice) {
		return session.insert("admin.insertNotice", notice);
	}

	@Override
	public Notice selectOneNoticeCollection(int no) {
		return session.selectOne("admin.selectOneNoticeCollection", no);
	}

	@Override
	public List<Member> selectOneloginMember(int no) {
		return session.selectList("admin.selectOneloginMember", no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return session.selectOne("admin.selectOneAttachment", no);
	}

	@Override
	public List<GoodsJoin> selectOneGoodsDetail(int pId) {
		return session.selectList("admin.selectOneGoodsDetail", pId);
	}

	@Override
	public OptionDetail selectOneGoodsOption(int optionId) {
		return session.selectOne("admin.selectOneGoodsOption", optionId);
	}

	@Override
	public int updateGoodsOption(OptionDetail optionDetail) {
		return session.update("admin.updateGoodsOption", optionDetail);
	}

	@Override
	public int insertGoodsOption(Map<String, Object> param) {
		return session.insert("admin.insertGoodsOption", param);
	}

	@Override
	public int insertOptionDetail(Map<String, Object> param) {
		return session.insert("admin.insertOptionDetail", param);
	}

	@Override
	public int selectOptionId() {
		return session.selectOne("admin.selectOptionId");
	}

	@Override
	public int deleteGoodsOption(int optionId) {
		return session.delete("admin.deleteGoodsOption", optionId);
	}

	@Override
	public int deleteNoticeAttachment(int attachNo) {
		return session.delete("admin.deleteNoticeAttachment", attachNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		return session.update("admin.updateNotice", notice);
	}

	@Override
	public List<Attachment> selectAttachmentByNoticeNo(int noticeNo) {
		return session.selectList("admin.selectAttachmentByNoticeNo", noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return session.delete("admin.deleteNotice", noticeNo);
	}

	@Override
	public int adminManageRegisterAweekAgoCount() {
		return session.selectOne("admin.adminManageRegisterAweekAgoCount");
	}

	@Override
	public int adminManageTodayScreeningCount() {
		return session.selectOne("admin.adminManageTodayScreeningCount");
	}

	@Override
	public List<Review> adminManageRecentTenReviewList() {
		return session.selectList("admin.adminManageRecentTenReviewList");
	}

	@Override
	public List<Question> adminSelectQuestionList(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.adminSelectQuestionList", null, rowBounds);
	}

	@Override
	public int countTotalQuestionContent() {
		return session.selectOne("admin.countTotalQuestionContent");
	}

	@Override
	public Question selectQuestionCollection(int questionNo) {
		return session.selectOne("admin.selectQuestionCollection", questionNo);
	}

	@Override
	public QuestionComment selectQuestionComment(int questionNo) {
		return session.selectOne("admin.selectQuestionComment", questionNo);
	}

	@Override
	public int insertQuestionComment(Map<String, Object> param) {
		return session.insert("admin.insertQuestionComment", param);
	}

	@Override
	public int updateQuestionAnswer(int questionNo) {
		return session.update("admin.updateQuestionAnswer", questionNo);
	}

	@Override
	public int deleteQuestionComment(int commentNo) {
		return session.delete("admin.deleteQuestionComment", commentNo);
	}

	@Override
	public int updateQuestionAnswerToN(int questionNo) {
		return session.update("admin.updateQuestionAnswerToN", questionNo);
	}

	@Override
	public int adminManageTodayReviewCount() {
		return session.selectOne("admin.adminManageTodayReviewCount");
	}

	@Override
	public int adminManageTodayQuestionCount() {
		return session.selectOne("admin.adminManageTodayQuestionCount");
	}

	@Override
	public int insertSaveNotify(Map<String, Object> param) {
		return session.insert("admin.insertSaveNotify", param);
	}

	@Override
	public List<Notice> searchNotice(Map<String, Object> param) {
		int offset = (int) param.get("start");
		int limit = (int) param.get("end");
		log.debug("offset, limit = {}", offset, limit);
		log.debug("param = {}", param);
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
	return session.selectList("admin.searchNotice", param, rowBounds);
	}

	@Override
	public int searchNoticeCount(Map<String, Object> param) {
		return session.selectOne("admin.searchNoticeCount", param);
	}

	@Override
	public List<Question> searchQuestion(Map<String, Object> param) {
		int offset = (int) param.get("start");
		int limit = (int) param.get("end");
		log.debug("offset, limit = {}", offset, limit);
		log.debug("param = {}", param);
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
	return session.selectList("admin.searchQuestion", param, rowBounds);
	}

	@Override
	public int searchQuestionCount(Map<String, Object> param) {
		return session.selectOne("admin.searchQuestionCount", param);
	}

	@Override
	public int insertRouletteEvent(Map<String, Object> param) {
		return session.insert("admin.insertRouletteEvent", param);
	}

	@Override
	public RouletteEvent selectRouletteEvent(String id) {
		return session.selectOne("admin.selectRouletteEvent", id);
	}

	@Override
	public int selectRouletteEventParticipateCnt(String id) {
		return session.selectOne("admin.selectRouletteEventParticipateCnt", id);
	}

	@Override
	public int updateRouletteEvent(Map<String, Object> param) {
		return session.update("admin.updateRouletteEvent", param);
	}

	@Override
	public List<Question> adminSelectNewQuestion(int offset, int limit) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("admin.adminSelectNewQuestion", null, rowBounds);
	}

	@Override
	public int countTotalNewQuestionContent() {
		return session.selectOne("admin.countTotalNewQuestionContent");
	}

	@Override
	public List<Question> searchNewQuestion(Map<String, Object> param) {
		int offset = (int) param.get("start");
		int limit = (int) param.get("end");
		log.debug("offset, limit = {}", offset, limit);
		log.debug("param = {}", param);
		RowBounds rowBounds = new RowBounds(offset, limit); 
		
	return session.selectList("admin.searchNewQuestion", param, rowBounds);
	}

	@Override
	public int searchNewQuestionCount(Map<String, Object> param) {
		return session.selectOne("admin.searchNewQuestionCount", param);
	}

	@Override
	public List<Question> adminManageRecentTenQuestionList() {
		return session.selectList("admin.adminManageRecentTenQuestionList");
	}

}