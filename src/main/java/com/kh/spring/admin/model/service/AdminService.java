package com.kh.spring.admin.model.service;

import java.util.List;

import com.kh.spring.goods.model.vo.Goods;

public interface AdminService {

	List<Goods> selectGoodsList();

}
