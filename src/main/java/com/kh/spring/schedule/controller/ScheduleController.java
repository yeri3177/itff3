package com.kh.spring.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/schedule")
public class ScheduleController {
	
	@GetMapping("/day1.do")
	public void day1() {}

	@GetMapping("/day2.do")
	public void day2() {}
	
	@GetMapping("/day3.do")
	public void day3() {}
	
	@GetMapping("/day4.do")
	public void day4() {}
	
	@GetMapping("/day5.do")
	public void day5() {}
	
	@GetMapping("/day6.do")
	public void day6() {}
	
	@GetMapping("/day7.do")
	public void day7() {}
	
	@GetMapping("/day8.do")
	public void day8() {}

}
