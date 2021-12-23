package com.kh.spring.review.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.review.model.service.ReviewService;
import com.kh.spring.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/review")
@Slf4j
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/reviewList.do")
	public void reviewList(
			Model model,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request) {
		
		log.debug("cPage = {}", cPage);

		int limit = 10;
		int offset = (cPage - 1) * limit;
	
		// 1. 전체 게시물 목록 가져오기(첨부파일 갯수 포함)
		List<Review> list = reviewService.selectReviewList(offset, limit);
		log.debug("ReviewList = {}", list);
		model.addAttribute("list", list);
		
		// 2. 총 게시물 수 가져오기
		int totalContent = reviewService.selectReviewTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI();   // /spring/board/boardList.do
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
	}
}
