package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.admin.exception.AdminException;
import com.kh.spring.admin.model.dao.AdminDao;
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
import com.kh.spring.sharing.model.exception.BoardException;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public List<Goods> selectGoodsList(int offset, int limit) {
		return adminDao.selectGoodsList(offset, limit); 
	}

	@Override
	@Transactional(
			propagation = Propagation.REQUIRED, 
			isolation = Isolation.READ_COMMITTED, 
			rollbackFor = Exception.class 
	)
	
	public int insertGoods(Goods goods) {
		log.debug("goods = {}", goods);
		
		int result = 0;
		
		try {
			// goods insert
			result = adminDao.insertGoods(goods);
			log.debug("goods.getPId = {}", goods.getPId());
			
			// attachment insert
			List<Attachment> attachments = goods.getAttachments();
			
			if(attachments != null) {
				for(Attachment attach : attachments) {
//					attach.setAttachNo(goods.getPId()); // fk컬럼값 세팅(필수)
					result = adminDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			// 사용자정의예외(RuntimeException)로 전환 던짐
			throw new AdminException("상품/첨부파일 등록 오류", e);
		}
		return result;
	}

	@Override
	public int deleteGoods(int pId) {
		return adminDao.deleteGoods(pId);
	}

	@Override
	public List<Member> selectMemberList(int offset, int limit) {
		return adminDao.selectMemberList(offset, limit); 
	}

	@Override
	public int selectMemberTotalCount() {
		return adminDao.selectMemberTotalCount();
	}

	@Override
	public Goods selectOneGoods(int pId) {
		return adminDao.selectOneGoods(pId);
	}

	@Override
	@Transactional(
			propagation = Propagation.REQUIRED, 
			isolation = Isolation.READ_COMMITTED, 
			rollbackFor = Exception.class 
	)
	public int updateGoods(Goods goods) {
		int result = 0;
		
		try {
			// goods insert
			result = adminDao.updateGoods(goods);
			log.debug("goods.getPId = {}", goods.getPId());
			
			// attachment insert
			List<Attachment> attachments = goods.getAttachments();
			
			if(attachments != null) {
				for(Attachment attach : attachments) {
//					attach.setAttachNo(goods.getPId()); // fk컬럼값 세팅(필수)
					result = adminDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			// 사용자정의예외(RuntimeException)로 전환 던짐
			throw new AdminException("상품/첨부파일 등록 오류", e);
		}
		return result;
	}

	@Override
	public List<Goods> selectRecentTenGoodsList() {
		return adminDao.selectRecentTenGoodsList(); 
	}

	@Override
	public Member selectOneMember(String id) {
		return adminDao.selectOneMember(id);
	}

	@Override
	public List<PointHistory> selectMemberPointHistoryList(String id) {
		return adminDao.selectMemberPointHistoryList(id);
	}

	@Override
	public int updateMember(Member member) {
		return adminDao.updateMember(member);
	}

	@Override
	public List<Member> searchMember(Map<String, Object> param) {
		return adminDao.searchMember(param);
	}

	@Override
	public int searchMemberCount(Map<String, Object> param) {
		return adminDao.searchMemberCount(param);
	}

	@Override
	public List<Goods> searchGoods(Map<String, Object> param) {
		return adminDao.searchGoods(param);
	}

	@Override
	public int searchGoodsCount(Map<String, Object> param) {
		return adminDao.searchGoodsCount(param);
	}

	@Override
	public int insertPointHistory(Map<String, Object> param) {
		return adminDao.insertPointHistory(param);
	}

	@Override
	public int updateMemberPoint(Map<String, Object> param) {
		return adminDao.updateMemberPoint(param);
	}

	@Override
	public List<Movie> selectMovieList() {
		return adminDao.selectMovieList();
	}

	@Override
	public Movie selectOneMovie(String movieId) {
		return adminDao.selectOneMovie(movieId);
	}

	@Override
	public List<Theater> selectTheaterList() {
		return adminDao.selectTheaterList();
	}

	@Override
	public List<MovieJoin> selectOneTheater(int theaterId) {
		return adminDao.selectOneTheater(theaterId);
	}

	@Override
	public List<MovieJoin> adminOneMovieSchedule(String movieId) {
		return adminDao.adminOneMovieSchedule(movieId);
	}

	@Override
	public List<MovieJoin> adminOneMovieScheduleDate(Map<String, Object> param) {
		return adminDao.adminOneMovieScheduleDate(param);
	}

	@Override
	public List<Notice> adminSelectNoticeList(int offset, int limit) {
		return adminDao.adminSelectNoticeList(offset, limit);
	}

	@Override
	public int countTotalContent() {
		return adminDao.countTotalContent();
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = 0;

		try {
			result = adminDao.insertNotice(notice);
			log.debug("새로 생성된 notice.noticeNo = {}", notice.getNoticeNo());
			
			// attachmenet insert 나눠서 처리
			List<Attachment> attachments = notice.getAttachments();
			if(attachments != null) {
				for(Attachment attach : attachments) {
					attach.setNoticeNo(notice.getNoticeNo());
					log.debug("attach? {}", attach);
					result = adminDao.insertAttachment(attach);
				}
			}
		} catch (Exception e) {
			throw new BoardException("공지사항 글/첨부파일 등록 오류", e);
		}
		
		
		return result;
	}

	@Override
	public Notice selectOneNoticeCollection(int no) {
		return adminDao.selectOneNoticeCollection(no);
	}

	@Override
	public List<Member> selectOneloginMember(int no) {
		return adminDao.selectOneloginMember(no);
	}

	@Override
	public Attachment selectOneAttachment(int no) {
		return adminDao.selectOneAttachment(no);
	}

	@Override
	public List<GoodsJoin> selectOneGoodsDetail(int pId) {
		return adminDao.selectOneGoodsDetail(pId);
	}

	@Override
	public OptionDetail selectOneGoodsOption(int optionId) {
		return adminDao.selectOneGoodsOption(optionId);
	}

	@Override
	public int updateGoodsOption(OptionDetail optionDetail) {
		return adminDao.updateGoodsOption(optionDetail);
	}

	@Override
	public int insertGoodsOption(Map<String, Object> param) {
		return adminDao.insertGoodsOption(param);
	}

	@Override
	public int insertOptionDetail(Map<String, Object> param) {
		return adminDao.insertOptionDetail(param);
	}

	@Override
	public int selectOptionId() {
		return adminDao.selectOptionId();
	}

	@Override
	public int deleteGoodsOption(int optionId) {
		return adminDao.deleteGoodsOption(optionId);
	}


}
