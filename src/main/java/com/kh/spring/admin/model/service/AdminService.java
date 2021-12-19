package com.kh.spring.admin.model.service;

import java.util.List;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.sharing.model.vo.Attachment;

public interface AdminService {

	List<Goods> selectGoodsList();

	int insertGoods(Goods goods);

}
