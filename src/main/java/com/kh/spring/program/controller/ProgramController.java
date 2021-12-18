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
	public void ai() {}
	
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
	
	@GetMapping("/programSearch.do")
	public void programSearch() {}
	
	@GetMapping("/synopsis/matrix.do")
	public void matrix() {}
	
	@GetMapping("/synopsis/aiSynopsis.do")
	public void aiSynopsis() {}
	
}
