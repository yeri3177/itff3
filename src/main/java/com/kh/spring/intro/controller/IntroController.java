package com.kh.spring.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/intro")
public class IntroController {
	
	@GetMapping("/outline.do")
	public void outline() {}
	
	@GetMapping("/greeting.do")
	public void greeting() {}
	
	@GetMapping("/program.do")
	public void program() {}


}
