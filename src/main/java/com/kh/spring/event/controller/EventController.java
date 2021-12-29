package com.kh.spring.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/eventMenu.do")
	public void eventMenu() {}

	@GetMapping("/eventRoulette.do")
	public void eventRoulette(@RequestParam String id, Model model) {
		log.debug("id = {}", id);
		
		Member member = adminService.selectOneMember(id);
		log.debug("member = {}", member);
		
		model.addAttribute("member", member);
	}

}
