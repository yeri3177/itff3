package com.kh.spring.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.goods.model.vo.Goods;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminManageController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/adminManage.do")
	public void adminManage() {}

	/**
	 * [상영 영화 목록] 
	 */
	
//	@GetMapping("/adminMovieList.do")
//	public void adminMovieList(Model model) {
//		List<Movie> list = adminService.selectMovieList();
//		log.debug("list = {}", list);
//		model.addAttribute("list", list);
//	}
	
	/**
	 * [굿즈 목록]
	 */
	
	@GetMapping("/adminGoodsList.do")
	public void adminGoodsList(Model model) {
		List<Goods> list = adminService.selectGoodsList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
	}
	
	

}
