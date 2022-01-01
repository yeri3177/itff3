package com.kh.spring.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
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
import com.kh.spring.admin.model.vo.SaveNotify;
import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.goods.model.service.GoodsService;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.GoodsOption;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MovieJoin;
import com.kh.spring.movie.model.vo.MovieSchedule;
import com.kh.spring.movie.model.vo.Seat;
import com.kh.spring.movie.model.vo.Theater;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.question.model.vo.Question;
import com.kh.spring.question.model.vo.QuestionComment;
import com.kh.spring.review.model.vo.Review;
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
	public List<Goods> selectRecentTenGoodsList(Model model) {
		List<Goods> list = adminService.selectRecentTenGoodsList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		return list;
	}

	/**
	 * [메인화면: 일주일 가입]
	 */
	
	@GetMapping("/adminManageRegisterAweekAgoCount.do")
	public void adminManageRegisterAweekAgoCount(Model model) {
		int count = adminService.adminManageRegisterAweekAgoCount();
		log.debug("count = {}", count);
		
		model.addAttribute("count", count);
	}
	
	/**
	 * [메인화면: 오늘 상영]
	 */
	
	@GetMapping("/adminManageTodayScreeningCount.do")
	public void adminManageTodayScreeningCount(Model model) {
		int count = adminService.adminManageTodayScreeningCount();
		log.debug("count = {}", count);
		
		model.addAttribute("count", count);
	}

	/**
	 * [메인화면: 최근 리뷰 10개]
	 */
	
	@GetMapping("/adminManageRecentTenQuestionList.do")
	public List<Question> adminManageRecentTenQuestionList(Model model) {
		List<Question> list = adminService.adminManageRecentTenQuestionList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		return list;
	}

	/**
	 * [메인화면: 최근 리뷰 10개]
	 */
	
	@GetMapping("/adminManageRecentTenReviewList.do")
	public List<Review> adminManageRecentTenReviewList(Model model) {
		List<Review> list = adminService.adminManageRecentTenReviewList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		return list;
	}
	
	/**
	 * [메인화면: 오늘 리뷰 갯수]
	 */
	
	@GetMapping("/adminManageTodayReviewCount.do")
	public void adminManageTodayReviewCount(Model model) {
		int count = adminService.adminManageTodayReviewCount();
		log.debug("count = {}", count);
		
		model.addAttribute("count", count);
	}

	/**
	 * [메인화면: 오늘 문의 갯수]
	 */
	
	@GetMapping("/adminManageTodayQuestionCount.do")
	public void adminManageTodayQuestionCount(Model model) {
		int count = adminService.adminManageTodayQuestionCount();
		log.debug("count = {}", count);
		
		model.addAttribute("count", count);
	}
	
	/**
	 * [일정]
	 */
	
	@GetMapping("/calendar.do")
	public void calendar() {}
	
	/**
	 * [통계]
	 */
	
	@GetMapping("/chart.do")
	public void chart() {}
	
	/**
	 * [알람]
	 */

	@GetMapping("/saveNotify.do")
	public void saveNotify(@RequestParam String id, Model model) {
		Member member = adminService.selectOneMember(id);
		log.debug("member = {}", member);
		
		model.addAttribute("member", member);
	}
	
	@PostMapping("/saveNotify.do")
	@ResponseBody
	public void saveNotify(@RequestParam String target, @RequestParam String content, @RequestParam String type, @RequestParam String url) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("target", target);
		param.put("content", content);
		param.put("type", type);
		param.put("url", url);
		log.debug("param = {}", param);
		
		adminService.insertSaveNotify(param);
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
	 * [작품정보]
	 */
	
	@GetMapping("/adminMovieInfo.do")
	public Movie adminMovieInfo(@RequestParam("movieId") String movieId, Model model) {
		log.debug("movieId = {}", movieId);

		Movie movie = adminService.selectOneMovie(movieId);
		log.debug("movie = {}", movie);
		
		model.addAttribute("movie", movie);
		
		return movie;
	}
	
	/**
	 * [상영관 정보] 
	 */
	
	@GetMapping("/adminTheaterInfo.do")
	public void adminTheaterInfo(Model model) {
		List<Theater> list = adminService.selectTheaterList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
	}

	/**
	 * [상영관 상세] 
	 */
	
	@GetMapping("/adminTheaterDetail.do")
	public void adminTheaterDetail(@RequestParam("theaterId") int theaterId, Model model) {
		
		List<MovieJoin> list = adminService.selectOneTheater(theaterId);
		log.debug("list = {}", list);
		
		List<Seat> seats = new ArrayList<Seat>();
		
		for(int i=0; i < list.size(); i++ ) {
			Seat seat = new Seat();
			
			String seatNo = list.get(i).getSeat().getSeatNo();
			int isBooked = list.get(i).getSeat().getIsBooked();
			
			seat.setSeatNo(seatNo);
			seat.setIsBooked(isBooked);
			
			seats.add(seat);
//			log.debug("seats = {}", seats);
		}

		model.addAttribute("seats", seats);
		model.addAttribute("theaterId", theaterId);
	}
	
	/**
	 * [작품당 상영정보] 
	 */
	
	@GetMapping("/adminOneMovieSchedule.do")
	public void adminOneMovieSchedule(@RequestParam("movieId") String movieId, Model model) {
		
		Movie movie = adminService.selectOneMovie(movieId);
		List<MovieJoin> list = adminService.adminOneMovieSchedule(movieId);
		log.debug("list = {}", list);
		log.debug("movie = {}", movie);
		
		List<MovieSchedule> movieSchedule = new ArrayList<MovieSchedule>();
		HashSet<String> date = new HashSet<>();
		
		for(int i=0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();	
			
			String startDate = list.get(i).getMovieSchedule().getStartDate();
			
			movieSchedule.add(movieSchedules);
			date.add(startDate);
		}
		log.debug("date = {}", date);
		
		model.addAttribute("movie", movie);
		model.addAttribute("movieSchedule", movieSchedule);
		model.addAttribute("date", date);
		model.addAttribute("movieId", movieId);		
	}
	
	/**
	 * [작품당 상영시간표] 
	 */
	
	@GetMapping("/adminOneMovieScheduleDate.do")
	public void adminOneMovieScheduleDate(@RequestParam("movieId") String movieId, @RequestParam("startDate") String startDate,  Model model) {
		log.debug("movieId = {}", movieId);
		log.debug("startDate = {}", startDate);
		
		// map에 담아서 보내자
		Map<String, Object> param = new HashMap<>();
		param.put("movieId", movieId);
		param.put("startDate", startDate);

		log.debug("param = {}", param);
		
		List<MovieJoin> list = adminService.adminOneMovieScheduleDate(param);
		log.debug("list = {}", list);
		
		List<MovieSchedule> oneDateSchedule = new ArrayList<MovieSchedule>();
		
		for(int i=0; i < list.size(); i++ ) {
			MovieSchedule movieSchedules = new MovieSchedule();
			movieSchedules = list.get(i).getMovieSchedule();	
			
			oneDateSchedule.add(movieSchedules);
		}
		
		model.addAttribute("oneDateSchedule", oneDateSchedule);		
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
			
			// 첨부파일 list생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upload/goods");
			log.debug("saveDirectory = {}", saveDirectory);
			
			for(MultipartFile upFile : upFiles) {
	
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
		    		if(Oldgoods != null) {
		    			saveDirectory = application.getRealPath("/resources/upload/goods");
		    			String filename = Oldgoods.getPImg();
		    			File delFile = new File(saveDirectory, filename);
		    			boolean result = delFile.delete();
		    			log.debug("첨부파일{} 삭제 여부: {}", filename, result);
		    		}
					
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
	
	/**
	 * [상품별 옵션관리 조회]
	 */
	
	@GetMapping("/adminGoodsOptionList.do")
	public String adminGoodsOptionList(
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
		
		return "admin/adminGoodsOptionList";
	}
	
	/**
	 * [굿즈 옵션 상세]
	 */
	
	@GetMapping("/adminGoodsOptionDetail.do")
	public void adminGoodsOptionDetail(@RequestParam("pId") int pId, Model model) {
		log.debug("pId = {}", pId);
		
		Goods goods = adminService.selectOneGoods(pId);
		List<GoodsJoin> list = adminService.selectOneGoodsDetail(pId);
		log.debug("list = {}", list);
		
		List<OptionDetail> optionDetail = new ArrayList<>();
		
		for(int i=0; i < list.size(); i++ ) {
			OptionDetail optionDetails = new OptionDetail();
			optionDetails = list.get(i).getOptionDetail();	
			
			optionDetail.add(optionDetails);
		}
		
		model.addAttribute("goods", goods);
		model.addAttribute("optionDetail", optionDetail);
	}
	
	/**
	 * [상품별 굿즈 옵션 추가]
	 */
	
	@GetMapping("/adminGoodsOptionInsert.do")
	public void adminGoodsOptionInsert(@RequestParam("pId") int pId, Model model) {
		log.debug("pId = {}", pId);
		
		Goods goods = adminService.selectOneGoods(pId);
		log.debug("goods = {}", goods);
		
		int optionId = adminService.selectOptionId();
		log.debug("optionId = {}", optionId);
		
		model.addAttribute("goods", goods);
		model.addAttribute("optionId", optionId);
	}
	
	@PostMapping("/adminGoodsOptionInsert.do")
	public String adminGoodsOptionInsert(
			OptionDetail optionDetail,
			@RequestParam(value="upFile") MultipartFile[] upFiles, 
			RedirectAttributes redirectAttr,
			@RequestParam("pId") int pId,
			@RequestParam("optionId") int optionId
			) throws IllegalStateException, IOException {
		
		try {
			log.debug("optionDetail = {}", optionDetail);
			
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
				optionDetail.setAttachments(attachments);

			Map<String, Object> param = new HashMap<>();
			param.put("optionDetail", optionDetail);
			param.put("pId", pId);
			param.put("optionId", optionId);
			
			log.debug("param = {}", param);

			int result = adminService.insertOptionDetail(param);
			result = adminService.insertGoodsOption(param);
			
			String msg = result > 0 ? "옵션 등록 성공" : "다시 시도해주세요.";
			
			redirectAttr.addFlashAttribute("msg", msg);
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
			
			throw e; // spring container에게 던짐.
		}
		return "redirect:/admin/adminGoodsList.do";
	}
	
	/**
	 * [굿즈 옵션 수정]
	 */
	
	@GetMapping("/adminGoodsOptionUpdate.do")
	public void adminGoodsOptionUpdate(@RequestParam("optionId") int optionId, Model model) {
		log.debug("optionId = {}", optionId);
		
		OptionDetail optionDetail = adminService.selectOneGoodsOption(optionId);
		log.debug("optionDetail = {}", optionDetail);
		
		model.addAttribute("optionDetail", optionDetail);
	}
	
	@PostMapping("/adminGoodsOptionUpdate.do")
	public String adminGoodsOptionUpdate(
			OptionDetail optionDetail,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles, 
			RedirectAttributes redirectAttr,
			@RequestParam("optionId") int optionId
			) throws IllegalStateException, IOException {
		
		try {
			log.debug("optionId = {}", optionId);
			log.debug("optionDetail = {}", optionDetail);
			
			// 첨부파일 list생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upload/goods");
			log.debug("saveDirectory = {}", saveDirectory);
			
			for(MultipartFile upFile : upFiles) {
				
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					// 기존 파일 삭제
					OptionDetail oldOptionDetail = adminService.selectOneGoodsOption(optionId);
					
					if(oldOptionDetail != null) {
						saveDirectory = application.getRealPath("/resources/upload/goods");
						String filename = oldOptionDetail.getOptionImg();
						File delFile = new File(saveDirectory, filename);
						boolean result = delFile.delete();
						log.debug("첨부파일{} 삭제 여부: {}", filename, result);
					}
					
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
				optionDetail.setAttachments(attachments);
			
			int result = adminService.updateGoodsOption(optionDetail);
			
			String msg = result > 0 ? "옵션 수정 성공" : "다시 시도해주세요.";
			
			redirectAttr.addFlashAttribute("msg", msg);
			
		}catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
			
			throw e; // spring container에게 던짐.
		}
		return "redirect:/admin/adminGoodsList.do";
	}
	
	/**
	 * [굿즈 옵션 삭제]
	 */
	
	@GetMapping("/adminGoodsOptionDelete.do")
	public void adminGoodsOptionDelete(@RequestParam("optionId") int optionId, Model model) {
		log.debug("optionId = {}", optionId);
		
		OptionDetail optionDetail = adminService.selectOneGoodsOption(optionId);
		log.debug("optionDetail = {}", optionDetail);
		
		model.addAttribute("optionDetail", optionDetail);
	}
	
	@PostMapping("/adminGoodsOptionDelete.do")
	public String adminGoodsOptionDelete(@RequestParam int optionId, RedirectAttributes redirectAttr) {
		log.debug("optionId = {}", optionId);
		
    	try {
    		OptionDetail optionDetail = adminService.selectOneGoodsOption(optionId);
    		
    		if(optionDetail != null) {
    			String saveDirectory = application.getRealPath("/resources/upload/goods");
    			String filename = optionDetail.getOptionImg();
    			File delFile = new File(saveDirectory, filename);
    			boolean result = delFile.delete();
    			log.debug("첨부파일{} 삭제 여부: {}", filename, result);
    		}
    		
			int result = adminService.deleteGoodsOption(optionId);
			redirectAttr.addFlashAttribute("msg", "옵션 삭제 성공");
			
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

///////////////////////////////////////////////////////////////////////////////
	
	/**
	 * [공지사항 목록] 
	 */
	
	@GetMapping("/adminNoticeList.do")
	public void adminNoticeList(
			Model model,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request
			) {
		
		try {	
			log.debug("cPage = {}", cPage); // defaultValue = "1" 로 해둬서 cPage 값이 없으면 1이 나온다.
			
			int limit = 10;
			int offset = (cPage - 1) * limit;
			
			// 전체 게시물 목록
			List<Notice> list = adminService.adminSelectNoticeList(offset, limit);
			log.debug("list = {}", list);
			
			// 전체 게시물 수
			int totalContent = adminService.countTotalNoticeContent();
			log.debug("totalContent = {}", totalContent);
						
			// pagebar
			String url = request.getRequestURI(); 
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			log.debug("pagebar = {}", pagebar);
			
			model.addAttribute("list", list);
			model.addAttribute("totalContent", totalContent);
			model.addAttribute("pagebar", pagebar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * [공지사항 작성] 
	 */
	
	@GetMapping("/adminNoticeForm.do")
	public void adminNoticeForm() {}
	
	@PostMapping("/adminNoticeEnroll.do")
	public String adminNoticeEnroll(
			// 한 게시물에 여러 첨부파일이라 [] 형식
	         @RequestParam(value = "upFile", required = false) MultipartFile[] upFiles,
	         @ModelAttribute Notice notice, 
	         RedirectAttributes redirectAttr
			 ) throws Exception {
		
		try {
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			log.debug("saveDirectory = {}", saveDirectory);
			
			// 첨부파일 List 생성
			List<Attachment> attachments = new ArrayList<>();
			
			for(MultipartFile upFile : upFiles) {
				
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
					// 새이름 부여해서 관리하기
					String originalFilename = upFile.getOriginalFilename();
			        String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
					
					File dest = new File(saveDirectory, renamedFilename);
					log.debug("dest  = {}", dest);
					upFile.transferTo(dest);
					
					// 파일별로 attachment 테이블에 저장되어야 함.
		            // 2. db에 attachment 레코드 등록
		            Attachment attach = new Attachment();
		            attach.setRenamedFilename(renamedFilename);
		            attach.setOriginalFilename(originalFilename);
		            
		            attachments.add(attach);
					
				}
			}
			
			if(!attachments.isEmpty()) {
				notice.setAttachments(attachments);
			}
			int result = adminService.insertNotice(notice);
			
			String msg = result > 0 ? "등록 성공" : "등록 실패";
			redirectAttr.addFlashAttribute("msg", msg);
			
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw e;
		}
		
		return "redirect:/admin/adminNoticeList.do";
	}
	
	/**
	 * [공지사항 상세] 
	 */
	
	@GetMapping("/adminNoticeDetail.do")
	public void adminNoticeDetail(@RequestParam int noticeNo, Model model) {
		log.debug("noticeNo = {}", noticeNo);
		
		Notice notice = adminService.selectOneNoticeCollection(noticeNo);
		log.debug("notice = {}", notice);
		
		model.addAttribute("notice", notice);
		
		List<Member> list = adminService.selectOneloginMember(noticeNo);
		log.debug("list = {}", list);
		
	}
	
	@GetMapping (
			value = "/fileDownload.do",
			produces = MediaType.APPLICATION_OCTET_STREAM_VALUE
	)
	@ResponseBody
	public Resource fileDownload(@RequestParam int no, HttpServletResponse response) {
		
		// resource 객체 생성
		Resource resource = null;
		
		try {
			// db attachment 행 조회하기
			Attachment attach = adminService.selectOneAttachment(no);
			log.debug("attach = {}", attach);
			
			// 실제 다운로드 할 파일경로 가져오기
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			log.debug("saveDirectory = {}", saveDirectory);
			
			File downFile = new File(saveDirectory, attach.getRenamedFilename());
			
			resource = resourceLoader.getResource("file:" + downFile);
			log.debug("file : {}", downFile);
			
			// 헤더값 설정
			String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1");
			response.addHeader("Content-Disposition", "attachment; filename=" + filename);
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return resource;
		
	}
	
	/**
	 * [공지사항 수정] 
	 */
	
	@GetMapping("/adminNoticeUpdate.do")
	public void adminNoticeUpdate(@RequestParam int noticeNo, Model model) {
		log.debug("noticeNo = {}", noticeNo);
		
		Notice notice = adminService.selectOneNoticeCollection(noticeNo);
		log.debug("notice = {}", notice);
		
		model.addAttribute("notice", notice);
	}
	
	@PostMapping("/adminNoticeUpdate.do")
	public String adminNoticeUpdate(
			 @RequestParam(value = "upFile", required = false) MultipartFile[] upFiless,
	         @ModelAttribute Notice notice,
	         @RequestParam int delFile,
	         RedirectAttributes redirectAttr
			) {
		
		try {
			int result = 0;
			
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			log.debug("saveDirectory = {}",saveDirectory);
			
			List<Attachment> attachments = new ArrayList<>();
			
			for(MultipartFile upFile : upFiless) {
				
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
			        log.debug("upFile.name = {}", upFile.getOriginalFilename());
			        log.debug("upFile.size = {}", upFile.getSize());
					
			        // 새 이름 부여해서 관리하기
			        String originalFilename = upFile.getOriginalFilename();
			        String renamedFilename = HiSpringUtils.getRenamedFilename(originalFilename);
			        
			        File dest = new File(saveDirectory, renamedFilename);
			        log.debug("dest = {}", dest);
			        upFile.transferTo(dest);
			        
			        // 파일별로 attachment 테이블에 저장되어야 함.
			        // 2. db에 attachment 레코드 등록
			        Attachment attach = new Attachment();
			        attach.setRenamedFilename(renamedFilename);
			        attach.setOriginalFilename(originalFilename);
			        
			        attachments.add(attach);
				}
			}		
			
			log.debug("delFile = {}", delFile);
			// 첨부파일이 변경되었거나 삭제 체크박스가 체크되면 기존 첨부파일 삭제
			
			if(delFile != 0) {
				int attachNo = delFile;
				Attachment attach = adminService.selectOneAttachment(attachNo);
				
				// 서버컴퓨터에서 파일삭제
				File targetFile = new File(saveDirectory, attach.getRenamedFilename());
				targetFile.delete();
				
				// db 레코드 삭제
				result = adminService.deleteNoticeAttachment(attachNo);
				String yn = result > 0 ? "첨부파일 삭제 완료" : "첨부파일 삭제 실패";
				log.debug("yn = {}", yn);
				
			}
			
			// 게시물 수정 + 새 첨부파일 등록
			if(!attachments.isEmpty())
				notice.setAttachments(attachments);
			
			result = adminService.updateNotice(notice);
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
			
		return "redirect:/admin/adminNoticeList.do";
	}
	
	/**
	 * [공지사항 삭제]
	 */
	
	@GetMapping("/adminNoticeDelete.do")
	public void adminNoticeDelete(@RequestParam int noticeNo, Model model) {
		
		log.debug("noticeNo = {}", noticeNo);
		
		Notice notice = adminService.selectOneNoticeCollection(noticeNo);
		log.debug("notice = {}", notice);
		
		model.addAttribute("notice", notice);
	}
	
	@PostMapping("/adminNoticeDelete.do")
	public String noticeDelete(@RequestParam int noticeNo) {
		
		log.debug("noticeNo = {}", noticeNo);
		
		// 여기서 no 는 notice_board의 글번호
		List<Attachment> attach = adminService.selectAttachmentByNoticeNo(noticeNo);
		log.debug("attach = {}", attach);
		
		// 파일을 서버에서도 삭제
		if(attach != null && attach.size() != 0) {
			String saveDirectory = application.getRealPath("/resources/upload/notice");
			File targetFile = new File(saveDirectory, attach.get(0).getRenamedFilename());
			boolean isDelete = targetFile.delete();
			
			log.debug("isDelete = {}", isDelete);
		}
		
		
		int result = adminService.deleteNotice(noticeNo);
		String msg = result > 0 ? "삭제 완료" : "삭제 실패";
		log.debug(msg);
			
		return "redirect:/admin/adminNoticeList.do";
	}
	
	/**
	 * [공지사항 검색]
	 */
	
	@GetMapping("/adminNoticeFinder.do")
	public String adminNoticeFinder(
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
		List<Notice> list = adminService.searchNotice(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchNoticeCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminNoticeList";
	}
	
///////////////////////////////////////////////////////////////////////////////
	
	/**
	* [신규 문의] 
	*/
	
	@GetMapping("/adminNewQuestion.do")
	public void adminNewQuestion(
				Model model,
				@RequestParam(defaultValue = "1") int cPage,
				HttpServletRequest request
				) {
	
		try {
			log.debug("cPage = {}", cPage); 

			int limit = 10;
			int offset = (cPage - 1) * limit;

			// 전체 게시물 목록
			List<Question> list = adminService.adminSelectNewQuestion(offset, limit);
			log.debug("list = {}", list);

			// 전체 게시물 수
			int totalContent = adminService.countTotalNewQuestionContent();
			log.debug("totalContent = {}", totalContent);

			// pagebar
			String url = request.getRequestURI();
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			log.debug("pagebar = {}", pagebar);

			model.addAttribute("list", list);
			model.addAttribute("totalContent", totalContent);
			model.addAttribute("pagebar", pagebar);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * [신규 문의 검색]
	 */
	
	@GetMapping("/adminNewQuestionFinder.do")
	public String adminNewQuestionFinder(
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
		List<Question> list = adminService.searchNewQuestion(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchNewQuestionCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminNewQuestion";
	}
	
	
	/**
	* [문의사항 목록] 
	*/
	
	@GetMapping("/adminQuestionList.do")
	public void adminQuestionList(
				Model model,
				@RequestParam(defaultValue = "1") int cPage,
				HttpServletRequest request
				) {
	
		try {
			log.debug("cPage = {}", cPage); 

			int limit = 10;
			int offset = (cPage - 1) * limit;

			// 전체 게시물 목록
			List<Question> list = adminService.adminSelectQuestionList(offset, limit);
			log.debug("list = {}", list);

			// 전체 게시물 수
			int totalContent = adminService.countTotalQuestionContent();
			log.debug("totalContent = {}", totalContent);

			// pagebar
			String url = request.getRequestURI();
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			log.debug("pagebar = {}", pagebar);

			model.addAttribute("list", list);
			model.addAttribute("totalContent", totalContent);
			model.addAttribute("pagebar", pagebar);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * [문의사항 상세]
	 */
	
	@GetMapping("/adminQuestionDetail.do")
	public void adminQuestionDetail(@RequestParam int questionNo, Model model) {
		log.debug("questionNo = {}", questionNo);
		
		Question question = adminService.selectQuestionCollection(questionNo);
		log.debug("question = {}", question);
		
		// 글번호에 달린 댓글 가져오기
		QuestionComment qc = adminService.selectQuestionComment(questionNo);
		log.debug("qc = {}", qc);
		
		model.addAttribute("question", question);
		model.addAttribute("qc", qc);
	}
	
	/**
	 * [문의사항 댓글 작성]
	 */
	
	@PostMapping("/adminQuestionCommentEnroll.do")
	public String adminQuestionCommentEnroll(
			@RequestParam String content,
			@RequestParam String writer,
			@RequestParam(value = "questionNo", required = false) int questionNo,
			RedirectAttributes redirectAttr
			) {
		
		log.debug("content = {}", content);
		log.debug("writer = {}", writer);
		log.debug("questionNo = {}", questionNo);
		
		// map에 담기
		Map<String, Object> param = new HashMap<>();
		param.put("content", content);
		param.put("writer", writer);
		param.put("questionNo", questionNo);
		
		int result = adminService.insertQuestionComment(param);
		
		if (result > 0) {
			// 댓글이 달리면 question_board answer N -> Y로 바꾸기		
			int result2 = adminService.updateQuestionAnswer(questionNo);
			String msg = result2 > 0 ? "답변 여부: Y" : "답변 여부: N";
			log.debug(msg);
		}
			
		return "redirect:/admin/adminQuestionList.do";
	}
	
	/*
	 * [댓글 삭제]
	 */
	
	@GetMapping("/adminQuestionCommentDelete.do")
	public String adminQuestionCommentDelete(@RequestParam int commentNo, @RequestParam(value = "questionNo", required = false) int questionNo) {
		
		log.debug("commentNo = {}", commentNo);
		log.debug("questionNo = {}", questionNo);
		
		int result = adminService.deleteQuestionComment(commentNo);
		
		// 답변 삭제하면 question_board 의 answer -> N으로 바뀜
		int result2 = adminService.updateQuestionAnswerToN(questionNo);
		
		
		return "redirect:/admin/adminQuestionList.do";
	}
	
	/**
	 * [문의사항 검색]
	 */
	
	@GetMapping("/adminQuestionFinder.do")
	public String adminQuestionFinder(
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
		List<Question> list = adminService.searchQuestion(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchQuestionCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminQuestionList";
	}
	
}