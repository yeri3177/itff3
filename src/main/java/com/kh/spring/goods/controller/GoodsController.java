package com.kh.spring.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.goods.model.service.GoodsService;
import com.kh.spring.goods.model.vo.Goods;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodService;
	
	@GetMapping("/goodsList.do")
	public String goodsList(Model model) {
	
		List<Goods> list = goodService.selectGoodsList();
		model.addAttribute("list", list);
		
		log.debug("list = {}", list);
		
		return "goods/goodsList";
	}

}
