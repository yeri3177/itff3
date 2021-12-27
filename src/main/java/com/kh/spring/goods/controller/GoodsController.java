package com.kh.spring.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.goods.model.service.GoodsService;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.OptionDetail;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 상품 목록 페이지
	 */
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
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); // /spring/board/boardList.do
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		
		return "goods/goodsList";
	}
	
	/**
	 * 상품 상세 페이지
	 */
	@GetMapping("/goodsDetail.do")
	public void goodsDetail(@RequestParam int pid, Model model, HttpServletRequest request) {
		// 상품 아이디 확인 
		log.debug("pid = {}", pid);
		
		// pid -> GoodsJoin (Goods+GoodsOptioin+OptionDetail)
		List<GoodsJoin> list = goodsService.selectOneGoodsDetail(pid);
		log.debug("list = {}", list);
		
		List<OptionDetail> optionDetail = new ArrayList<>();
		
		for(int i=0; i < list.size(); i++ ) {
			optionDetail.add(list.get(i).getOptionDetail());
		}
		
		Goods goods = list.get(0).getGoods();
		
		log.debug("optionDetail = {}", optionDetail);
		log.debug("goods = {}", goods);
		
		model.addAttribute("goods", goods);
		model.addAttribute("optionDetail", optionDetail);
		request.setAttribute("optionDetail", optionDetail);
		
		// [기종 -> 색상] 최초 옵션리스트
		List<OptionDetail> colorList = goodsService.selectColorByFirstType(pid);
		request.setAttribute("colorList", colorList);
		
		// [색상 -> 사이즈] 최초 옵션리스트
		List<OptionDetail> sizeList = goodsService.selectSizeByFirstColor(pid);
		request.setAttribute("sizeList", sizeList);

	}
	
	/**
	 * [기종] 선택 -> [색상] 옵션리스트 뿌리기
	 */
	@PostMapping("/selectColorByType.do")
	public String selectColorByType(@RequestParam String goodsId, @RequestParam String optionType, Model model) {
		log.debug("goodsId = {}", goodsId);
		log.debug("optionType = {}", optionType);
		
		Map<String, Object> map = new HashMap<>();
		map.put("goodsId", goodsId);
		map.put("optionType", optionType);
		
		List<OptionDetail> searchColorList = goodsService.selectColorByType(map);
		log.debug("searchColorList = {}", searchColorList);
		
		model.addAttribute("searchColorList", searchColorList);
	
		return "goods/optionColorDiv";
	}
	
	/**
	 * [색상] 선택 -> [사이즈] 옵션리스트 뿌리기
	 */
	@PostMapping("/selectSizeByColor.do")
	public String selectSizeByColor(@RequestParam String goodsId, @RequestParam String optionColor, Model model) {
		log.debug("goodsId = {}", goodsId);
		log.debug("optionColor = {}", optionColor);
		
		Map<String, Object> map = new HashMap<>();
		map.put("goodsId", goodsId);
		map.put("optionColor", optionColor);
		
		List<OptionDetail> searchSizeList = goodsService.selectSizeByColor(map);
		log.debug("searchSizeList = {}", searchSizeList);
		
		model.addAttribute("searchSizeList", searchSizeList);
	
		return "goods/optionSizeDiv";
	}
	
	/**
	 * 상품상세 이미지 찾기 
	 */
	@PostMapping("/selectOneImg.do")
	public String selectOneImg(@RequestParam String goodsId, @RequestParam String optionType, @RequestParam String optionColor, Model model) {
		log.debug("goodsId = {}", goodsId);
		log.debug("optionType = {}", optionType);
		log.debug("optionColor = {}", optionColor);
		//log.debug("optionSize = {}", optionSize);
		
		Map<String, Object> map = new HashMap<>();
		map.put("optionType", optionType);
		map.put("optionColor", optionColor);
		map.put("goodsId", goodsId);
		//map.put("optionSize", optionSize);
		
		List<OptionDetail> list = goodsService.selectOneImg(map);
		log.debug("프리뷰 이미지 찾기 = {}", list);
		
		model.addAttribute("list", list);
	
		return "goods/PreviewImgDiv";
	}
	
	/**
	 * 판매자정보 페이지 
	 */
	@GetMapping("/sellerInfo.do")
	public String sellerInfo() {
		
		return "goods/sellerInfo";
	}
	
	/**
	 * 묻고답하기 페이지 
	 */
	@GetMapping("/goodsQna.do")
	public String goodsQna() {
		
		return "goods/goodsQna";
	}

}
