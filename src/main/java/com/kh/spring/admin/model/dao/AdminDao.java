package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.admin.model.vo.PointHistory;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MovieJoin;
import com.kh.spring.movie.model.vo.MovieSchedule;
import com.kh.spring.movie.model.vo.Seat;
import com.kh.spring.movie.model.vo.Theater;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.sharing.model.vo.Attachment;

public interface AdminDao {

	List<Goods> selectGoodsList(int offset, int limit);

	int insertGoods(Goods goods);

	int insertAttachment(Attachment attach);

	List<Member> selectMemberList(int offset, int limit);

	int selectMemberTotalCount();

	int deleteGoods(int pId);

	Goods selectOneGoods(int pId);

	int updateGoods(Goods goods);

	List<Goods> selectRecentTenGoodsList();

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

	int countTotalContent();

	int insertNotice(Notice notice);

	Notice selectOneNoticeCollection(int no);

	List<Member> selectOneloginMember(int no);

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

	int adminManageRegisterAweekAgoCount();

	int adminManageTodayScreeningCount();

}
