package com.kh.spring.footer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.guide.controller.GuideController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/footer")
public class FooterController {

	@GetMapping("/termsOfUse.do")
	public void termsOfUse() {}
	
}
