package com.kh.spring.guide.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/guide")
public class GuideController {
	
	@GetMapping("/openCloseGuide.do")
	public void openCloseGuide() {}
	
	@GetMapping("/ticketGuide.do")
	public void ticketGuide() {}
	
	@GetMapping("/theaterGuide.do")
	public void theaterGuide() {}

}
