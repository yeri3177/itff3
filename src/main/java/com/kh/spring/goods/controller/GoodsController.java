package com.kh.spring.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.board.controller.BoardController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/goods")
public class GoodsController {
	
	@GetMapping("/goodsList.do")
	public String goodsList() {
	
		return "goods/goodsList";
	}

}
