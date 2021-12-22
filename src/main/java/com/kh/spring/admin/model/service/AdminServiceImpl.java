package com.kh.spring.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.admin.exception.AdminException;
import com.kh.spring.admin.model.dao.AdminDao;
import com.kh.spring.admin.model.vo.PointHistory;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.member.model.vo.Member;
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


}
