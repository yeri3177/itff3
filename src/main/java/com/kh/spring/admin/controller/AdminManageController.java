package com.kh.spring.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.admin.model.vo.PointHistory;
import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.goods.model.service.GoodsService;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.sharing.model.vo.Attachment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminManageController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private ChatService chatService;

	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/adminManage.do")
	public void adminManage() {}

///////////////////////////////////////////////////////////////////////////////
	
	/**
	 * [메인화면: 최근 상품 10개]
	 */
	
	@GetMapping("/selectRecentTenGoodsList.do")
	public List<Goods> selectRecentTenGoodsList(@ModelAttribute("Goods") Goods param, Model model) {
		List<Goods> list = adminService.selectRecentTenGoodsList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		return list;
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	/**
	 * [회원 목록]
	 */
	
	@GetMapping("/adminMemberList.do")
	public String adminMemberList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1. 
		List<Member> list = adminService.selectMemberList(offset, limit);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContent = adminService.selectMemberTotalCount();
		log.debug("totalContent = {}", totalContent);
		
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminMemberList";
	}
	
	/**
	 * [회원 목록 검색]
	 */
	
	@GetMapping("/adminMemberFinder.do")
	public String adminMemberFinder(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String searchType,
			@RequestParam String searchKeyword,		
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1. 
		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		String newSearchKeyword = "%" + searchKeyword + "%";
		param.put("searchKeyword", newSearchKeyword);
		param.put("start", offset);
		param.put("end", limit);
		log.debug("param1 = {}", param);
		
		// 1. 
		List<Member> list = adminService.searchMember(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchMemberCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminMemberList";
	}
	
	
	/**
	 * [회원 상세]
	 */
	
	@GetMapping("/adminMemberDetail.do")
	public Member adminMemberDetail(@RequestParam(value = "id", required = false) String id, Model model) {
		log.debug("id = {}", id);

		Member member = adminService.selectOneMember(id);
		log.debug("member = {}", member);
		
		List<PointHistory> list = adminService.selectMemberPointHistoryList(id);
		log.debug("list = {}", list);
		
		model.addAttribute("member", member);
		model.addAttribute("list", list);
		
		return member;
	}

	/**
	 * [회원 정보 수정]
	 */
	
	@GetMapping("/adminMemberUpdate.do")
	public Member adminMemberUpdate(@RequestParam(value = "id", required = false) String id, Model model) {
		log.debug("id = {}", id);
		
		Member member = adminService.selectOneMember(id);
		log.debug("member = {}", member);
		
		model.addAttribute("member", member);
		
		return member;
	}
	
	@PostMapping("/adminMemberUpdate.do")
	public String memberUpdate(@ModelAttribute Member member, Model model, RedirectAttributes redirectAttr){
		
		log.debug("member = {}", member);
		
		// 1. DB 정보 갱신(생략)
		int result = adminService.updateMember(member);
		
		
		redirectAttr.addFlashAttribute("msg", "회원 정보를 수정했습니다.");
		
		return "redirect:/admin/adminMemberList.do";
	}
	
	/**
	 * [포인트 지급]
	 */
	
	@GetMapping("/adminMemberPoint.do")
	public Member adminMemberPoint(@RequestParam(value = "id", required = false) String id, Model model) {
		log.debug("id = {}", id);
		
		Member member = adminService.selectOneMember(id);
		log.debug("member = {}", member);
		
		model.addAttribute("member", member);
		
		return member;
	}
	
	@PostMapping("/adminMemberPoint.do")
	public String memberPoint(@RequestParam String id, @RequestParam int point, @RequestParam int change, @RequestParam String reason, Model model, RedirectAttributes redirectAttr){
		
		log.debug("id = {}", id);
		log.debug("reason = {}", reason); // 지급사유
		log.debug("change = {}", change); // +-
		log.debug("point = {}", point); // 계산하고 된 포인트
		
		// change는 관리자가 입력하는 것 앞에 "+"가 붙어야 한다.
		String newChange = "+"+change;
		log.debug("newChange = {}", newChange);
		
		// 회원 포인트
		// 회원의 포인트는 변동 + 기존 포인트로 다시 업데이트 되어야 한다.
		int newPoint = change + point;
		log.debug("newPoint = {}", newPoint);
		
		
		// map에 담아서 보내자
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("reason", reason);
		param.put("change", newChange);
		param.put("point", newPoint);
		log.debug("param = {}", param);
		
		// 포인트 내역
		int result1 = adminService.updateMemberPoint(param);
		int result2 = adminService.insertPointHistory(param);
		
		redirectAttr.addFlashAttribute("msg", "포인트 지급 성공");
		
		return "redirect:/admin/adminMemberList.do";
	}
	
///////////////////////////////////////////////////////////////////////////////

	/**
	 * [상영 영화 목록] 
	 */
	
	@GetMapping("/adminMovieList.do")
	public void adminMovieList(Model model) {
		List<Movie> list = adminService.selectMovieList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
	}
	
	/**
	 * [굿즈 상세]
	 */
	
	@GetMapping("/adminMovieInfo.do")
	public Movie adminMovieInfo(@RequestParam("movieId") String movieId, Model model) {
		log.debug("movieId = {}", movieId);

		Movie movie = adminService.selectOneMovie(movieId);
		log.debug("movie = {}", movie);
		
		model.addAttribute("movie", movie);
		
		return movie;
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	/**
	 * [굿즈 목록]
	 */
	
	@GetMapping("/adminGoodsList.do")
	public String adminGoodsList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1.
		List<Goods> list = adminService.selectGoodsList(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContent = goodsService.selectGoodsTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminGoodsList";
	}
	
	/**
	 * [굿즈 목록 검색]
	 */
	
	@GetMapping("/adminGoodsFinder.do")
	public String adminGoodsFinder(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String searchType,
			@RequestParam String searchKeyword,		
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1. 
		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		String newSearchKeyword = "%" + searchKeyword + "%";
		param.put("searchKeyword", newSearchKeyword);
		param.put("start", offset);
		param.put("end", limit);
		log.debug("param1 = {}", param);
		
		// 1. 
		List<Goods> list = adminService.searchGoods(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchGoodsCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminGoodsList";
	}
	
	/**
	 * [굿즈 추가]
	 */
	
	@GetMapping("/adminGoodsInsert.do")
	public void adminGoodsInsert() {}

	@RequestMapping(value="/adminGoodsInsert.do",method = {RequestMethod.POST})
	public String adminGoodsInsert(
			Goods goods,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
			RedirectAttributes redirectAttr
		) throws IllegalStateException, IOException {
		
		try {
			log.debug("goods = {}", goods);
			
			// 첨부파일 list생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upload/goods");
			log.debug("saveDirectory = {}", saveDirectory);
			
			for(MultipartFile upFile : upFiles) {
	
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
					String originalFilename = upFile.getOriginalFilename();
	
					// 1. 서버컴퓨터에 저장
					File dest = new File(saveDirectory, originalFilename);
					log.debug("dest = {}", dest);
					upFile.transferTo(dest);
					
					// 2. DB에 attachment 레코드 등록
					Attachment attach = new Attachment();
					attach.setRenamedFilename(originalFilename);
					attach.setOriginalFilename(originalFilename);
					attachments.add(attach);
				}
			}
			
			// 업무로직
			if(!attachments.isEmpty())
				goods.setAttachments(attachments);
			
			int result = adminService.insertGoods(goods);
			
			String msg = result > 0 ? "상품 등록 성공" : "다시 시도해주세요.";
			
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
			
			throw e; // spring container에게 던짐.
		}
		return "redirect:/admin/adminGoodsList.do";
	}
	
	/**
	 * [굿즈 상세]
	 */
	
	@GetMapping("/adminGoodsDetail.do")
	public Goods adminGoodsDetail(@RequestParam("pId") int pId, Model model) {
		log.debug("pId = {}", pId);

		Goods goods = adminService.selectOneGoods(pId);
		log.debug("goods = {}", goods);
		
		model.addAttribute("goods", goods);
		
		return goods;
	}
	
	/**
	 * [굿즈 수정]
	 */
	
	@GetMapping("/adminGoodsUpdate.do")
	public Goods adminGoodsUpdate(@RequestParam("pId") int pId, Model model) {
		log.debug("pId = {}", pId);
		
		Goods goods = adminService.selectOneGoods(pId);
		log.debug("goods = {}", goods);
		
		model.addAttribute("goods", goods);
		
		return goods;
	}
		
	@PostMapping("/adminGoodsUpdate.do")
	public String adminGoodsUpdate(
			Goods goods,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
			RedirectAttributes redirectAttr,
			@RequestParam("pId") int pId
		) throws IllegalStateException, IOException {
		
		try {
			log.debug("pId = {}", pId);
			log.debug("goods = {}", goods);
			
			// 기존 파일 삭제
    		Goods Oldgoods = adminService.selectOneGoods(pId);
    		
    		if(Oldgoods != null) {
    			String saveDirectory = application.getRealPath("/resources/upload/goods");
    			String filename = Oldgoods.getPImg();
    			File delFile = new File(saveDirectory, filename);
    			boolean result = delFile.delete();
    			log.debug("첨부파일{} 삭제 여부: {}", filename, result);
    		}
			
			// 첨부파일 list생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upload/goods");
			log.debug("saveDirectory = {}", saveDirectory);
			
			for(MultipartFile upFile : upFiles) {
	
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
					String originalFilename = upFile.getOriginalFilename();
	
					// 1. 서버컴퓨터에 저장
					File dest = new File(saveDirectory, originalFilename);
					log.debug("dest = {}", dest);
					upFile.transferTo(dest);
					
					// 2. DB에 attachment 레코드 등록
					Attachment attach = new Attachment();
					attach.setRenamedFilename(originalFilename);
					attach.setOriginalFilename(originalFilename);
					attachments.add(attach);
				}
			}
			
			// 업무로직
			if(!attachments.isEmpty())
				goods.setAttachments(attachments);
			
			int result = adminService.updateGoods(goods);
			
			String msg = result > 0 ? "상품 수정 성공" : "다시 시도해주세요.";
			
			redirectAttr.addFlashAttribute("msg", msg);
		
		}catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
			
			throw e; // spring container에게 던짐.
		}
		return "redirect:/admin/adminGoodsList.do";
	}
	
	/**
	 * [굿즈 삭제]
	 */
	
	@GetMapping("/adminGoodsDelete.do")
	public Goods adminGoodsDelete(@RequestParam("pId") int pId, Model model) {
		log.debug("pId = {}", pId);

		Goods goods = adminService.selectOneGoods(pId);
		log.debug("goods = {}", goods);
		
		model.addAttribute("goods", goods);
		
		return goods;
	}
	
	@PostMapping("/adminGoodsDelete.do")
	public String adminGoodsDelete(@RequestParam int pId, RedirectAttributes redirectAttr) {
		log.debug("pId = {}", pId);
		
    	try {
    		Goods goods = adminService.selectOneGoods(pId);
    		
    		if(goods != null) {
    			String saveDirectory = application.getRealPath("/resources/upload/goods");
    			String filename = goods.getPImg();
    			File delFile = new File(saveDirectory, filename);
    			boolean result = delFile.delete();
    			log.debug("첨부파일{} 삭제 여부: {}", filename, result);
    		}
    		
			int result = adminService.deleteGoods(pId);
			redirectAttr.addFlashAttribute("msg", "상품 삭제 성공");
			
    	} catch (InvalidParameterException e) {
    		log.error(e.getMessage(), e);
    		redirectAttr.addFlashAttribute("msg", e.getMessage());
    		
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
		
		
		return "redirect:/admin/adminGoodsList.do";
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	/**
	 * [채팅]
	 */
	
	@GetMapping("/chat.do")
	public String chat(Model model) {
		
		List<ChatLog> list = chatService.findChatLog();
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		return "admin/chat";
	}
	
	@GetMapping("/{chatId}/{memberId}/chat.do")
	public String chat(@PathVariable String chatId, @PathVariable String memberId, Model model) {
		
		List<ChatLog> list = chatService.findChatLogByChatId(chatId);
		log.debug("list = {}", list);
		log.debug("memberId = {}", memberId);
	
		model.addAttribute("list", list);
//		model.addAttribute("memberId", memberId);
//		model.addAttribute("chatId", chatId);
		
		return "admin/popup";
	}
	
}
