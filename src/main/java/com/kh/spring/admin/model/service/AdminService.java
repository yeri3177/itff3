package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.admin.model.vo.GoodsOrderDetailJoin;
import com.kh.spring.admin.model.vo.GoodsPaymentJoin;
import com.kh.spring.admin.model.vo.PointHistory;
import com.kh.spring.event.model.vo.RouletteEvent;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.GoodsOption;
import com.kh.spring.goods.model.vo.GoodsOrder;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.goods.model.vo.Payment;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MovieJoin;
import com.kh.spring.movie.model.vo.MovieReservation;
import com.kh.spring.movie.model.vo.Theater;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.question.model.vo.Question;
import com.kh.spring.question.model.vo.QuestionComment;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

public interface AdminService {

	List<Goods> selectGoodsList(int offset, int limit);

	int insertGoods(Goods goods);

	List<Member> selectMemberList(int offset, int limit);

	int selectMemberTotalCount();

	int deleteGoods(int pId);

	Goods selectOneGoods(int pId);

	int updateGoods(Goods goods);

	Member selectOneMember(String id);

	List<PointHistory> selectMemberPointHistoryList(String id);

	int updateMember(Member member);

	List<Member> searchMember(Map<String, Object> param);

	int searchMemberCount(Map<String, Object> param);

	List<Goods> searchGoods(Map<String, Object> param);

	int searchGoodsCount(Map<String, Object> param);

	int insertPointHistory(Map<String, Object> param);

	int updateMemberPoint(Map<String, Object> param);

	List<Movie> selectMovieList();

	Movie selectOneMovie(String movieId);

	List<Theater> selectTheaterList();

	List<MovieJoin> selectOneTheater(int theaterId);

	List<MovieJoin> adminOneMovieSchedule(String movieId);

	List<MovieJoin> adminOneMovieScheduleDate(Map<String, Object> param);

	List<Notice> adminSelectNoticeList(int offset, int limit);

	int countTotalNoticeContent();

	int insertNotice(Notice notice);

	Notice selectOneNoticeCollection(int no);

	List<Member> selectNoticeOneloginMember(int no);

	Attachment selectOneAttachment(int no);

	List<GoodsJoin> selectOneGoodsDetail(int pId);

	OptionDetail selectOneGoodsOption(int optionId);

	int updateGoodsOption(OptionDetail optionDetail);

	int insertGoodsOption(Map<String, Object> param);

	int insertOptionDetail(Map<String, Object> param);

	int selectOptionId();

	int deleteGoodsOption(int optionId);

	int deleteNoticeAttachment(int attachNo);

	int updateNotice(Notice notice);

	List<Attachment> selectAttachmentByNoticeNo(int noticeNo);

	int deleteNotice(int noticeNo);
	
	List<Notice> searchNotice(Map<String, Object> param);

	int searchNoticeCount(Map<String, Object> param);

	int adminManageRegisterAweekAgoCount();

	int adminManageTodayScreeningCount();

	List<Review> adminManageRecentTenReviewList();

	List<Question> adminSelectQuestionList(int offset, int limit);

	int countTotalQuestionContent();

	Question selectQuestionCollection(int questionNo);

	QuestionComment selectQuestionComment(int questionNo);

	int insertQuestionComment(Map<String, Object> param);

	int updateQuestionAnswer(int questionNo);

	int deleteQuestionComment(int commentNo);

	int updateQuestionAnswerToN(int questionNo);

	int adminManageTodayReviewCount();

	int adminManageTodayQuestionCount();

	int insertSaveNotify(Map<String, Object> param);

	List<Question> searchQuestion(Map<String, Object> param);

	int searchQuestionCount(Map<String, Object> param);

	int insertRouletteEvent(Map<String, Object> param);

	RouletteEvent selectRouletteEvent(String id);

	int selectRouletteEventParticipateCnt(String id);

	int updateRouletteEvent(Map<String, Object> param);

	List<Question> adminSelectNewQuestion(int offset, int limit);

	int countTotalNewQuestionContent();

	List<Question> searchNewQuestion(Map<String, Object> param);

	int searchNewQuestionCount(Map<String, Object> param);

	List<Question> adminManageRecentTenQuestionList();

	List<Review> adminSelectReviewList(int offset, int limit);

	int countTotalReviewContent();

	Review selectOneReviewCollection(int reviewNo);

	List<Member> selectReviewOneloginMember(int reviewNo);

	List<Attachment> selectAttachmentByReviewNo(int reviewNo);

	int deleteReview(int reviewNo);

	int deleteReviewComment(int reviewNo);

	int deleteReviewLike(int reviewNo);

	List<Board> adminSelectSharingList(int offset, int limit);

	int countTotalSharingContent();

	Board selectOneSharingCollection(int no);

	List<Member> selectSharingOneloginMember(int no);

	List<Attachment> selectAttachmentBySharingNo(int no);

	int deleteSharing(int no);

	int adminMemberCut(String id);

	int adminMemberUnblock(String id);

	List<Review> searchReview(Map<String, Object> param);

	int searchReviewCount(Map<String, Object> param);

	List<Board> searchSharing(Map<String, Object> param);

	int searchSharingCount(Map<String, Object> param);

	List<Member> adminManageRecentTenRegisterList();

	int deleteGoodsLike(int pId);

	List<GoodsOption> selectOneGoodsOptionId(int pId);

	List<GoodsPaymentJoin> selectGoodsOrderList(int offset, int limit);

	int selectGoodsOrderTotalCount();

	List<GoodsOrderDetailJoin> selectOneGoodsOrderDetail(String orderNo);

	String selectOneGoodsOrderMember(String orderNo);

	GoodsPaymentJoin selectOnePayment(Map<String, Object> param);

	List<GoodsPaymentJoin> selectRecentTenGoodsList();

	GoodsOrder selectOneGoodsOrder(String orderNo);

	int adminManageTodayOrderCount();

	int adminManageNoAnswerCount();

	List<GoodsPaymentJoin> searchGoodsOrder(Map<String, Object> param);

	int searchGoodsOrderCount(Map<String, Object> param);

	List<GoodsPaymentJoin> searchGoodsOrderDate(Map<String, Object> param);

	int searchGoodsOrderDateCount(Map<String, Object> param);

	List<MovieReservation> selectMovieReservationList(int offset, int limit);

	int selectMovieReservationTotalCount();

	MovieReservation selectOneMovieReservation(String movieReservationId);

	List<MovieJoin> selectOneMovieReservationSeat(String movieReservationId);

	List<MovieReservation> selectTodayMovieReservationList();

	int adminManageTodayMovieReservationCount();

	
}