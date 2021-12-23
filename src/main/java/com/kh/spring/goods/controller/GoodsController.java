package com.kh.spring.goods.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.goods.model.service.GoodsService;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.OptionDetail;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/goodsList.do")
	public String goodsList(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		// 현재 페이지 번호 
		log.debug("cPage = {}", cPage);
		
		// limit : 한페이지에 표시할 게시글 수 
		// offset : 건너뛰어야 할 게시글 수
		int limit = 8;
		int offset = (cPage - 1) * limit;
		
		// 1. 상품 리스트 
		List<Goods> list = goodsService.selectGoodsList(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. 전체게시물수 
		int totalContent = goodsService.selectGoodsTotalCount();
		//log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); // /spring/board/boardList.do
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		//log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		return "goods/goodsList";
	}
	
	@GetMapping("/goodsDetail.do")
	public void goodsDetail(@RequestParam int pid, Model model, HttpServletRequest request) {
		// 상품 아이디 확인 
		log.debug("pid = {}", pid);
		
		// 상품아이디 -> 굿즈 테이블의 레코드 조회 
		Goods goods = goodsService.selectOneGoods(pid);
		log.debug("goods = {}", goods);
		model.addAttribute("goods", goods);
		
		// 상품아이디 -> 굿즈-옵션 테이블의 옵션아이디 리스트 
		List<Integer> optionIdList = goodsService.selectOptionId(pid);
		log.debug("옵션 아이디 리스트 = {}", optionIdList);
		
		// 옵션아이디 리스트 -> 옵션상세 테이블 레코드 조회 
		List<OptionDetail> optionList = new ArrayList<>();
		for(Integer option : optionIdList) {
			optionList.add(goodsService.selectOptionList(option));
		}
		log.debug("optionList = {}", optionList);
		
		// 옵션 list 셋팅
		model.addAttribute("optionList", optionList);
		request.setAttribute("optionList", optionList);
	}
	
	
	@GetMapping("/sellerInfo.do")
	public String sellerInfo() {
		
		return "goods/sellerInfo";
	}
	
	@GetMapping("/goodsQna.do")
	public String goodsQna() {
		
		return "goods/goodsQna";
	}

}
