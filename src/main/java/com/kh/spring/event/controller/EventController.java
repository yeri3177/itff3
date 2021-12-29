package com.kh.spring.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/event")
public class EventController {
	
	@GetMapping("/eventMenu.do")
	public void eventMenu() {}

	@GetMapping("/eventRoulette.do")
	public void eventRoulette() {}

}
