package com.kh.spring.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Calendar;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.member.model.vo.MemberMovieReservation;
import com.kh.spring.member.model.vo.Point;
import com.kh.spring.movie.model.vo.MovieReservation;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Board;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String id);

	int updateMember(Member member);

	List<Member> selectMemberList(String gender);

	List<Member> selectMemberList();

	List<Member> selectMemberList(Map<String, Object> param);

	Member selectOneEmail(String email);

	Member selectOneNickname(String nickname);

	List<Board> selectBoardListByMemberId(int offset, int limit, String id);

	int selectBoardTotalCount(String id);

	int insertProfileImage(Map<String, Object> param);

	List<Review> selectReviewListByMemberId(int offset, int limit, String id);

	int selectReviewTotalCount(String id);

	List<Point> selectPointListByMemberId(int offset, int limit, String id);

	int selectPointTotalCount(String id);

	int insertPointHistory(Map<String, Object> param);

	List<Point> selectPointListByDate(int offset, int limit, Map<String, Object> param);

	int selectPointTotalCountByDate(Map<String, Object> param);

	Member findMemberId(Map<String, Object> param);

	Member findMemberByIdAndEmail(Map<String, Object> param);

	int updateMemberPassword(Map<String, Object> param2);

	int selectCountDailyCalendarByRegDate(Map<String, Object> param);

	List<Calendar> selectListCalendarCheckByMemberId(String id);

	String selectMemCheck(String id);

	int dailyCheckInsert(Map<String, Object> param);

	int updateMemberPointByIdAndNewPoint(Map<String, Object> param);

	List<MemberMovieReservation> selectMemberMovieReservationByMemberId(int offset, int limit, String id);

	int selectMemberMovieReservationCount(String id);

	int deleteReservationByMovieReservationId(String movieReservationId);



}
