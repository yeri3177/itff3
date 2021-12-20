package com.kh.spring.admin.model.service;

import java.util.List;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.sharing.model.vo.Attachment;

public interface AdminService {

	List<Goods> selectGoodsList(int offset, int limit);

	int insertGoods(Goods goods);

	List<Member> selectMemberList(int offset, int limit);

	int selectMemberTotalCount();

	int deleteGoods(int pId);

	Goods selectOneGoods(int pId);

	int updateGoods(Goods goods);

}
