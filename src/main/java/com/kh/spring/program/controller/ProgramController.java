package com.kh.spring.program.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/program")
@Slf4j
public class ProgramController {

	@GetMapping("/openClose.do")
	public void openClose() {}
	
}
