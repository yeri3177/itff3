package com.kh.spring.admin.model.dao;

import java.util.List;

import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.sharing.model.vo.Attachment;

public interface AdminDao {

	List<Goods> selectGoodsList();

	int insertGoods(Goods goods);

	int insertAttachment(Attachment attach);

}
