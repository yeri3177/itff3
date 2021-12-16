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
	
	@GetMapping("/ai.do")
	public void Ai() {}
	
	@GetMapping("/security.do")
	public void security() {}
	
	@GetMapping("/deepRunning.do")
	public void deepRunning() {}
	
	@GetMapping("/bigData.do")
	public void bigData() {}
	
	@GetMapping("/flatform.do")
	public void flatform() {}
	
	@GetMapping("/debugging.do")
	public void debugging() {}
	
	@GetMapping("/programSearch")
	public void programSearch() {}
}
