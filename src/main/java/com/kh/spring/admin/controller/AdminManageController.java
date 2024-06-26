package com.kh.spring.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidParameterException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.admin.model.vo.GoodsOrderDetailJoin;
import com.kh.spring.admin.model.vo.GoodsPaymentJoin;
import com.kh.spring.admin.model.vo.PointHistory;
import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.goods.model.service.GoodsService;
import com.kh.spring.goods.model.vo.Goods;
import com.kh.spring.goods.model.vo.GoodsJoin;
import com.kh.spring.goods.model.vo.GoodsOption;
import com.kh.spring.goods.model.vo.GoodsOrder;
import com.kh.spring.goods.model.vo.OptionDetail;
import com.kh.spring.goods.model.vo.OrderDetail;
import com.kh.spring.goods.model.vo.Payment;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.movie.model.vo.Movie;
import com.kh.spring.movie.model.vo.MovieJoin;
import com.kh.spring.movie.model.vo.MovieReservation;
import com.kh.spring.movie.model.vo.MovieSchedule;
import com.kh.spring.movie.model.vo.Seat;
import com.kh.spring.movie.model.vo.Theater;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notify.model.service.NotifyService;
import com.kh.spring.notify.model.vo.SaveNotify;
import com.kh.spring.question.model.vo.Question;
import com.kh.spring.question.model.vo.QuestionComment;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminManageController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private NotifyService notifyService;

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
	 * [관리자 알림 조회]
	 */

	@RequestMapping("/adminNotify.do")
	public void notify(Authentication authentication, Model model) throws Exception{
		
		// 2. HandlerMapping 으로부터 가져오기
		log.debug("authentication = {}", authentication);
		
		Member member = (Member) authentication.getPrincipal();
		log.debug("[principal] member = {}", member);
		
		Object credentials = authentication.getCredentials();
		log.debug("[credentials] credentials = {}", credentials);
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		log.debug("[authorities] authorities = {}", authorities);
		
		Member member2 = (Member) authentication.getPrincipal();
		String id = member2.getId();
		log.debug("id = {}", id);
			
		// id가 존재할 때 
		if(id != null && !"".equals(id)){
			
			// 새로운 알람 조회
			List<SaveNotify> newList = notifyService.searchNewNotifyList(id);
			
			for(SaveNotify vo : newList) {	// 날짜 포맷 변경
				vo.setTime(HiSpringUtils.formatTimeString(vo.getTime(), notifyService));
			}
			
			// 이전 알람 조회
//			Map<String, String> searchParam = new HashMap<String, String>();
			
			// 정보 전달
//			mav.addObject("pagination", pagination);
			model.addAttribute("newList", newList);
//			mav.addObject("oldList", oldList);
			model.addAttribute("oldListCnt", notifyService.selectOldNotifyCnt(id));
		}
	}
	
	/**
	 * [메인화면: 오늘 예매]
	 */
	
	@GetMapping("/selectTodayMovieReservationList.do")
	public void selectTodayMovieReservationList(Model model) {
		List<MovieReservation> list = adminService.selectTodayMovieReservationList();
		
		model.addAttribute("list", list);
	}

	/**
	 * [메인화면: 오늘 주문]
	 */
	
	@GetMapping("/selectRecentTenGoodsList.do")
	public void selectRecentTenGoodsList(Model model) {
		List<GoodsPaymentJoin> list = adminService.selectRecentTenGoodsList();
		
		model.addAttribute("list", list);
	}

	/**
	 * [메인화면: 오늘 예매 수]
	 */
	
	@GetMapping("/adminManageTodayMovieReservationCount.do")
	public void adminManageTodayMovieReservationCount(Model model) {
		int count = adminService.adminManageTodayMovieReservationCount();
		log.debug("count = {}", count);
		
		model.addAttribute("count", count);
	}

	/**
	 * [메인화면: 오늘 주문 수]
	 */
	
	@GetMapping("/adminManageTodayOrderCount.do")
	public void adminManageTodayOrderCount(Model model) {
		int count = adminService.adminManageTodayOrderCount();
		log.debug("count = {}", count);
		
		model.addAttribute("count", count);
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
	 * [메인화면: 최근 회원가입 10명]
	 */
	
	@GetMapping("/adminManageRecentTenRegisterList.do")
	public List<Member> adminManageRecentTenRegisterList(Model model) {
		List<Member> list = adminService.adminManageRecentTenRegisterList();
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		return list;
	}

	/**
	 * [메인화면: 최근 미답변 문의 10개]
	 */
	
	@GetMapping("/adminManageNoAnswerCount.do")
	public void adminManageNoAnswerCount(Model model) {
		int count = adminService.adminManageNoAnswerCount();
		
		model.addAttribute("count", count);
	}

	/**
	 * [메인화면: 최근 미답변 문의 10개]
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
//		log.debug("pagebar = {}", pagebar);
		
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
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
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
	
	/**
	 * [회원 차단]
	 */
	
	@GetMapping("/adminMemberCut.do")
	public Member adminMemberCut(@RequestParam(value = "id", required = false) String id, Model model) {
		log.debug("id = {}", id);
		
		Member member = adminService.selectOneMember(id);
		log.debug("member = {}", member);
		
		model.addAttribute("member", member);
		
		return member;
	}
	
	@PostMapping("/adminMemberCut.do")
	public String adminMemberCut(@RequestParam(value = "id", required = false) String id, RedirectAttributes redirectAttr) {
		log.debug("id = {}", id);
		
    	try { 		
			int result = adminService.adminMemberCut(id);
			redirectAttr.addFlashAttribute("msg", "회원 차단 성공");
			
    	} catch (InvalidParameterException e) {
    		log.error(e.getMessage(), e);
    		redirectAttr.addFlashAttribute("msg", e.getMessage());
    		
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
			
		return "redirect:/admin/adminMemberList.do";
	}
	
	
	/**
	 * [회원 차단 해제]
	 */
	
	@GetMapping("/adminMemberUnblock.do")
	public Member adminMemberUnblock(@RequestParam(value = "id", required = false) String id, Model model) {
		log.debug("id = {}", id);
		
		Member member = adminService.selectOneMember(id);
		log.debug("member = {}", member);
		
		model.addAttribute("member", member);
		
		return member;
	}
	
	@PostMapping("/adminMemberUnblock.do")
	public String adminMemberUnblock(@RequestParam(value = "id", required = false) String id, RedirectAttributes redirectAttr) {
		log.debug("id = {}", id);
		
		try { 		
			int result = adminService.adminMemberUnblock(id);
			redirectAttr.addFlashAttribute("msg", "회원 차단 해제 성공");
			
		} catch (InvalidParameterException e) {
			log.error(e.getMessage(), e);
			redirectAttr.addFlashAttribute("msg", e.getMessage());
			
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
		
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
	
	/**
	 * [예매내역 조회]
	 */
	
	@GetMapping("/adminMovieReservationList.do")
	public String adminMovieReservationList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1.
		List<MovieReservation> list = adminService.selectMovieReservationList(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContent = adminService.selectMovieReservationTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminMovieReservationList";
	}
	
	/**
	 * [예매 상세]
	 */
	
	@GetMapping("/adminMovieReservationDetail.do")
	public void adminMovieReservationDetail(@RequestParam("movieReservationId") String movieReservationId, @RequestParam("movieId") String movieId, Model model) {
		log.debug("movieReservationId = {}", movieReservationId);
		log.debug("movieId = {}", movieId);
		
		// 예매 정보
		MovieReservation movieReservation = adminService.selectOneMovieReservation(movieReservationId);
		log.debug("movieReservation = {}", movieReservation);
		
		// 예매 좌석 모양 뿌리기
		List<MovieJoin> list = adminService.selectOneMovieReservationSeat(movieReservationId);
		log.debug("list = {}", list);
		
		List<Seat> seats = new ArrayList<Seat>();
		
		for(int i=0; i < list.size(); i++ ) {
			Seat seat = new Seat();
			
			String seatNo = list.get(i).getSeat().getSeatNo();
			int isBooked = list.get(i).getSeat().getIsBooked();
			
			seat.setSeatNo(seatNo);
			seat.setIsBooked(isBooked);
			
			seats.add(seat);
		}
		
		// 좌석 리스트 담기
		List<String> seatList = Arrays.asList((movieReservation.getSelectedSeat()).split(", "));
		log.debug("seatList = {}", seatList);
		
		// 예매 영화
		Movie movie = adminService.selectOneMovie(movieId);
		log.debug("movie = {}", movie);
		
		model.addAttribute("movieReservation", movieReservation);
		model.addAttribute("seatList", seatList);
		model.addAttribute("seats", seats);
		model.addAttribute("movie", movie);
		model.addAttribute("movieReservationId", movieReservationId);
	}
	
	/**
	 * [예매 내역 검색]
	 */
	
	@GetMapping("/adminmovieReservationFinder.do")
	public String adminmovieReservationFinder(
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
		List<MovieReservation> list = adminService.searchMovieReservation(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchMovieReservationCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "admin/adminMovieReservationList";
	}
	
	/**
	 * [예매 내역 날짜 검색]
	 */
	
	@GetMapping("/adminMovieReservationDateFinder.do")
	public String adminMovieReservationDateFinder(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String searchType,
			@RequestParam String startDate,
			@RequestParam String endDate,		
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1. 
		Map<String, Object> param = new HashMap<>();
		param.put("searchType", searchType);
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("start", offset);
		param.put("end", limit);
		log.debug("param1 = {}", param);
		
		// 1. 
		List<MovieReservation> list = adminService.searchMovieReservationDate(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchMovieReservationDateCount(param);
		log.debug("totalContents = {}", totalContents);
		
		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI()+"?searchType="+searchType+"&startDate="+startDate+"&endDate="+endDate;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "admin/adminMovieReservationList";
	}
	
	/**
	 * [예매 취소]
	 */
	
	@GetMapping("/adminMovieReservationDelete.do")
	public void adminMovieReservationDelete(@RequestParam("movieReservationId") String movieReservationId, Model model) {
		log.debug("movieReservationId = {}", movieReservationId);
		
		MovieReservation movieReservation = adminService.selectOneMovieReservation(movieReservationId);
		log.debug("movieReservation = {}", movieReservation);
		
		model.addAttribute("movieReservation", movieReservation);
	}
	
	@PostMapping("/adminMovieReservationDelete.do")
	public String adminMovieReservationDelete(@RequestParam String movieReservationId, RedirectAttributes redirectAttr) {
		log.debug("movieReservationId = {}", movieReservationId);
		
    	try {
			int result = adminService.deleteMovieReservation(movieReservationId);
			redirectAttr.addFlashAttribute("msg", "예매 취소");
			
    	} catch (InvalidParameterException e) {
    		log.error(e.getMessage(), e);
    		redirectAttr.addFlashAttribute("msg", e.getMessage());
    		
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
			
		return "redirect:/admin/adminMovieReservationList.do";
	}
	
	
	/**
	 * [예매현황 조회]
	 */
	
	@GetMapping("/adminMovieReservationStatusList.do")
	public String adminMovieReservationStatusList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1.
		List<MovieJoin> list = adminService.selectMovieReservationStatusList(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 날짜
		List<MovieSchedule> schedule = adminService.selectMovieScheduleDate(); 
		log.debug("schedule = {}", schedule);
		model.addAttribute("schedule", schedule);
		
		// 2. totalContent
		int totalContent = adminService.selectMovieReservationStatusTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminMovieReservationStatusList";
	}
		
	/**
	 * [예매현황 검색]
	 */
	
	@GetMapping("/adminMovieReserStatusSearchDate.do")
	public String adminMovieReserStatusSearchDate(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String startDate,		
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		Map<String, Object> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("start", offset);
		param.put("end", limit);
		log.debug("param = {}", param);
		
		// 1. 
		List<MovieReservation> list = adminService.adminMovieReserStatusSearchDate(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 날짜
		List<MovieSchedule> schedule = adminService.selectMovieScheduleDate(); 
		log.debug("schedule = {}", schedule);
		model.addAttribute("schedule", schedule);
		
		// 2. totalContent
		int totalContents = adminService.adminMovieReserStatusSearchDateCount(param);
		log.debug("totalContents = {}", totalContents);
		
		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI()+"?startDate="+startDate;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminMovieReservationStatusList";
	}
	
	/**
	 * [예매 현황 상세]
	 */
	
	@GetMapping("/adminMovieReservationStatusDetail.do")
	public void adminMovieReservationStatusDetail(@RequestParam String movieScheduleId, Model model) {
		log.debug("movieScheduleId = {}", movieScheduleId);
		
		// 예매 정보
		List<Seat> list = adminService.selectOneSeat(movieScheduleId);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
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
//		log.debug("pagebar = {}", pagebar);
		
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
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
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

    		adminService.deleteGoodsLike(pId);
    		adminService.deleteGoods(pId);
			
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
//		log.debug("pagebar = {}", pagebar);
		
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

	/**
	 * [굿즈 주문 목록]
	 */
	
	@GetMapping("/adminGoodsOrderList.do")
	public String adminGoodsOrderList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1.
		List<GoodsPaymentJoin> list = adminService.selectGoodsOrderList(offset, limit);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContent = adminService.selectGoodsOrderTotalCount();
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		return "admin/adminGoodsOrderList";
	}
	
	/**
	 * [굿즈 주문 상세]
	 */
	
	@GetMapping("/adminGoodsOrderDetail.do")
	public void adminGoodsOrderDetail(@RequestParam("orderNo") String orderNo, Model model) {
		log.debug("orderNo = {}", orderNo);
		
		List<GoodsOrderDetailJoin> list = adminService.selectOneGoodsOrderDetail(orderNo);
		log.debug("list = {}", list);
		
		// 주문번호에 맞는 memberId 불러오기
		String memberId = adminService.selectOneGoodsOrderMember(orderNo);
		log.debug("memberId = {}", memberId);
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("orderNo", orderNo);
		
		GoodsPaymentJoin payment = adminService.selectOnePayment(param);
		log.debug("payment = {}", payment);
		
		model.addAttribute("list", list);
//		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("payment", payment);
		model.addAttribute("orderNo", orderNo);
	}	
	
	/**
	 * [굿즈 주문 목록 검색]
	 */
	
	@GetMapping("/adminGoodsOrderFinder.do")
	public String adminGoodsOrderFinder(
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
		List<GoodsPaymentJoin> list = adminService.searchGoodsOrder(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchGoodsOrderCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "admin/adminGoodsOrderList";
	}
	
	/**
	 * [굿즈 주문 목록 날짜 검색]
	 */
	
	@GetMapping("/adminGoodsOrderDateFinder.do")
	public String adminGoodsOrderDateFinder(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String startDate,
			@RequestParam String endDate,		
			Model model,
			HttpServletRequest request
			) {
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1. 
		Map<String, Object> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("start", offset);
		param.put("end", limit);
		log.debug("param1 = {}", param);
		
		// 2. 
		List<GoodsPaymentJoin> list = adminService.searchGoodsOrderDate(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 3. totalContent
		int totalContents = adminService.searchGoodsOrderDateCount(param);
		log.debug("totalContents = {}", totalContents);
		
		model.addAttribute("totalContents", totalContents);
		
		// 4. pagebar
		String url = request.getRequestURI()+"?startDate="+startDate+"&endDate="+endDate;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return "admin/adminGoodsOrderList";
	}
	
	
	/**
	 * [주문 취소]
	 */
	
	@GetMapping("/adminGoodsOrderStatusUpdate.do")
	public void adminGoodsOrderDelete(@RequestParam("orderNo") String orderNo, Model model) {
		log.debug("orderNo = {}", orderNo);
		
		Payment payment = adminService.selectOnePayment2(orderNo);

		log.debug("payment = {}", payment);
		
		model.addAttribute("payment", payment);
	}
	
	@PostMapping("/adminGoodsOrderStatusUpdate.do")
	public String adminGoodsOrderDelete(@RequestParam("paymentNo") int paymentNo, @RequestParam("orderNo") String orderNo, @RequestParam String status, RedirectAttributes redirectAttr) {
		log.debug("paymentNo = {}", paymentNo);
		log.debug("paymentNo = {}", orderNo);
		log.debug("status = {}", status);
		
		Map<String, Object> param = new HashMap<>();
		param.put("orderNo", orderNo);
		param.put("status", status);
		log.debug("param = {}", param);
		
    	try {
    		int result1 = adminService.adminGoodsOrderStatusUpdate(param);
			
    	} catch (InvalidParameterException e) {
    		log.error(e.getMessage(), e);
    		redirectAttr.addFlashAttribute("msg", e.getMessage());
    		
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
			
		return "redirect:/admin/adminGoodsOrderList.do";
	}

	/**
	 * [상품 상태 개별 변경]
	 */
	
	@PostMapping("/updateGoodsOrderDetailStatus.do")
	public String updateGoodsOrderDetailStatus(@RequestParam("orderDetailNo") String orderDetailNo, @RequestParam("status") String status, RedirectAttributes redirectAttr) {
		log.debug("paymentNo = {}", orderDetailNo);
		log.debug("status = {}", status);
		
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("orderDetailNo", orderDetailNo);
			param.put("status", status);
			log.debug("param = {}", param);
			
			int result = adminService.updateGoodsOrderDetailStatus(param);
			
		} catch (InvalidParameterException e) {
			log.error(e.getMessage(), e);
			
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
		
		return "redirect:/admin/adminGoodsOrderList.do";
	}
	
	/**
	 * [취소 상품 상태 개별 변경]
	 */
	
	@PostMapping("/updateGoodsCancelOrderDetailStatus.do")
	public String updateGoodsCancelOrderDetailStatus(@RequestParam("orderDetailNo") String orderDetailNo, @RequestParam("status") String status, @RequestParam int tPrice, @RequestParam int pPrice, @RequestParam int paymentNo, RedirectAttributes redirectAttr) {
		log.debug("paymentNo = {}", orderDetailNo);
		log.debug("status = {}", status);
		log.debug("tPrice = {}", tPrice);
		log.debug("pPrice = {}", pPrice);
		log.debug("paymentNo = {}", paymentNo);
		
		try {
			// status가 환불완료라면 t에서 p를 뺀 가격을 payment의 total_price로 업데이트 시킨다.
			if("환불완료".equals(status)) {
				int newTotalPrice = tPrice - pPrice;
				log.debug("newTotalPrice = {}", newTotalPrice);
				
				Map<String, Object> param = new HashMap<>();
				param.put("paymentNo", paymentNo);
				param.put("newTotalPrice", newTotalPrice);
				log.debug("param = {}", param);
				
				int result = adminService.updateNewTotalPrice(param);
			}
			
			Map<String, Object> param = new HashMap<>();
			param.put("orderDetailNo", orderDetailNo);
			param.put("status", status);
			log.debug("param = {}", param);
			
			int result = adminService.updateGoodsCancelOrderDetailStatus(param);
			
		} catch (InvalidParameterException e) {
			log.error(e.getMessage(), e);
			
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
		
		return "redirect:/admin/adminGoodsOrderCancelList.do";
	}
	
	/**
	 * [주문자 정보 수정]
	 */
	
	@GetMapping("/adminPaymentInfoUpdate.do")
	public void adminPaymentInfoUpdate(@RequestParam("paymentNo") int paymentNo, Model model) {
		log.debug("paymentNo = {}", paymentNo);
		
		Payment payment = adminService.selectOnePayment3(paymentNo);

		log.debug("payment = {}", payment);
		
		model.addAttribute("payment", payment);
	}
	
	@PostMapping("/adminPaymentInfoUpdate.do")
	public String adminPaymentInfoUpdate(@RequestParam String paymentNo, @RequestParam String receiver, @RequestParam String phone, @RequestParam String address, @RequestParam String detailAddress, @RequestParam String postCode, @RequestParam String orderComment, RedirectAttributes redirectAttr) {
		log.debug("paymentNo = {}", paymentNo);
		
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("paymentNo", paymentNo);
			param.put("receiver", receiver);
			param.put("phone", phone);
			param.put("address", address);
			param.put("detailAddress", detailAddress);
			param.put("postCode", postCode);
			param.put("orderComment", orderComment);
			log.debug("param = {}", param);
			
			int result = adminService.adminPaymentInfoUpdate(param);
			
		} catch (InvalidParameterException e) {
			log.error(e.getMessage(), e);
			
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
		
		return "redirect:/admin/adminGoodsOrderList.do";
	}
	
	/**
	 * [굿즈 주문 취소 목록]
	 */
	
	@GetMapping("/adminGoodsOrderCancelList.do")
	public String adminGoodsOrderCancelList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model,
			HttpServletRequest request
			) {
		
		try {
			log.debug("cPage = {}", cPage);
			
			int limit = 10;
			int offset = (cPage - 1) * limit;
			
			// 1.
			List<GoodsPaymentJoin> list = adminService.selectGoodsOrderCancelList(offset, limit);
			log.debug("list = {}", list);
			model.addAttribute("list", list);
			
			// 2. totalContent
			int totalContent = adminService.selectGoodsOrderCancelTotalCount();
			log.debug("totalContent = {}", totalContent);
			model.addAttribute("totalContent", totalContent);
			
			// 3. pagebar
			String url = request.getRequestURI(); 
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
			//		log.debug("pagebar = {}", pagebar);
			
			model.addAttribute("pagebar", pagebar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/adminGoodsOrderCancelList";
	}
	
	
	/**
	 * [굿즈 취소 주문 상세]
	 */
	
	@GetMapping("/adminGoodsOrderCancelDetail.do")
	public void adminGoodsOrderCancelDetail(@RequestParam("orderNo") String orderNo, Model model) {
		log.debug("orderNo = {}", orderNo);
		
		List<GoodsOrderDetailJoin> list = adminService.selectOneGoodsOrderDetail(orderNo);
		log.debug("list = {}", list);
		
		// 주문번호에 맞는 memberId 불러오기
		String memberId = adminService.selectOneGoodsOrderMember(orderNo);
		log.debug("memberId = {}", memberId);
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("orderNo", orderNo);
		
		GoodsPaymentJoin payment = adminService.selectOnePayment(param);
		log.debug("payment = {}", payment);
		
		model.addAttribute("list", list);
//		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("payment", payment);
		model.addAttribute("orderNo", orderNo);
	}
	
	/**
	 * [굿즈 운송장 등록]
	 */
	
	@GetMapping("/adminGoodsOrderWaybill.do")
	public void adminGoodsOrderWaybill(@RequestParam int orderDetailNo, Model model) {
		log.debug("orderDetailNo = {}", orderDetailNo);
		
		model.addAttribute("orderDetailNo", orderDetailNo);
	}

	@PostMapping("/adminGoodsOrderWaybill.do")
	public String adminGoodsOrderWaybill(@RequestParam int orderDetailNo, RedirectAttributes redirectAttr) {
		log.debug("orderDetailNo = {}", orderDetailNo);
		
		try {
			int result = adminService.adminDeliveryUpdate(orderDetailNo);
			
		} catch (InvalidParameterException e) {
			log.error(e.getMessage(), e);
			
		} catch (Exception e) {
			log.error("다시 시도해주세요.", e);
			throw e;
		}
		
		return "redirect:/admin/adminGoodsOrderList.do";
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
	 * [리뷰 목록] 
	 */
	
	@GetMapping("/adminReviewList.do")
	public void adminReviewList(
			Model model,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request
			) {
		
		try {	
			log.debug("cPage = {}", cPage); // defaultValue = "1" 로 해둬서 cPage 값이 없으면 1이 나온다.
			
			int limit = 10;
			int offset = (cPage - 1) * limit;
			
			// 전체 게시물 목록
			List<Review> list = adminService.adminSelectReviewList(offset, limit);
			log.debug("list = {}", list);
			
			// 전체 게시물 수
			int totalContent = adminService.countTotalReviewContent();
			log.debug("totalContent = {}", totalContent);
						
			// pagebar
			String url = request.getRequestURI(); 
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
//			log.debug("pagebar = {}", pagebar);
			
			model.addAttribute("list", list);
			model.addAttribute("totalContent", totalContent);
			model.addAttribute("pagebar", pagebar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * [리뷰 상세] 
	 */
	
	@GetMapping("/adminReviewDetail.do")
	public void adminReviewDetail(@RequestParam int reviewNo, Model model) {
		log.debug("reviewNo = {}", reviewNo);
		
		Review review = adminService.selectOneReviewCollection(reviewNo);
		log.debug("review = {}", review);
				
		List<Member> list = adminService.selectReviewOneloginMember(reviewNo);
		log.debug("list = {}", list);
		
		model.addAttribute("review", review);
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
			String saveDirectory = application.getRealPath("/resources/upload/board");
			log.debug("saveDirectory = {}", saveDirectory);
			
			File downFile = new File(saveDirectory, attach.getRenamedFilename());
			
			resource = resourceLoader.getResource("file:" + downFile);
			log.debug("downFile = {}", downFile);
			
			// 헤더값 설정
			String filename = new String(attach.getOriginalFilename().getBytes("utf-8"), "iso-8859-1");
			response.addHeader("Content-Disposition", "attachment; filename=" + filename);
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return resource;
		
	}
	
	/**
	 * [리뷰 삭제]
	 */
	
	@GetMapping("/adminReviewDelete.do")
	public void adminReviewDelete(@RequestParam int reviewNo, Model model) {
		
		log.debug("reviewNo = {}", reviewNo);
		
		Review review = adminService.selectOneReviewCollection(reviewNo);
		log.debug("review = {}", review);
		
		model.addAttribute("review", review);
	}
	
	@PostMapping("/adminReviewDelete.do")
	public String reviewDelete(@RequestParam int reviewNo) {
		
		log.debug("reviewNo = {}", reviewNo);
		
		// 여기서 no 는 notice_board의 글번호
		List<Attachment> attach = adminService.selectAttachmentByReviewNo(reviewNo);
		log.debug("attach = {}", attach);
		
		// 파일을 서버에서도 삭제
		if(attach != null && attach.size() != 0) {
			String saveDirectory = application.getRealPath("/resources/upload/board");
			File targetFile = new File(saveDirectory, attach.get(0).getRenamedFilename());
			boolean isDelete = targetFile.delete();
			
			log.debug("isDelete = {}", isDelete);
		}
		
		int result = 0;
		
		result = adminService.deleteReviewLike(reviewNo);
		result = adminService.deleteReviewComment(reviewNo);
		result = adminService.deleteReview(reviewNo);
		String msg = result > 0 ? "삭제 완료" : "삭제 실패";
		log.debug(msg);
			
		return "redirect:/admin/adminReviewList.do";
	}
	
	/**
	 * [리뷰 검색]
	 */
	
	@GetMapping("/adminReviewFinder.do")
	public String adminReviewFinder(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String searchType,
			@RequestParam String searchKeyword,		
			Model model,
			HttpServletRequest request,
			HttpSession session
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
		List<Review> list = adminService.searchReview(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchReviewCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword; 
		log.debug("url = {}", url);
		
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "admin/adminReviewList";
	}

///////////////////////////////////////////////////////////////////////////////

	/**
	 * [티켓나눔터 목록] 
	 */
	
	@GetMapping("/adminSharingList.do")
	public void adminSharingList(
			Model model,
			@RequestParam(defaultValue = "1") int cPage,
			HttpServletRequest request
			) {
		
		try {	
			log.debug("cPage = {}", cPage); // defaultValue = "1" 로 해둬서 cPage 값이 없으면 1이 나온다.
			
			int limit = 10;
			int offset = (cPage - 1) * limit;
			
			// 전체 게시물 목록
			List<Board> list = adminService.adminSelectSharingList(offset, limit);
			log.debug("list = {}", list);
			
			// 전체 게시물 수
			int totalContent = adminService.countTotalSharingContent();
			log.debug("totalContent = {}", totalContent);
						
			// pagebar
			String url = request.getRequestURI(); 
			String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
//			log.debug("pagebar = {}", pagebar);
			
			model.addAttribute("list", list);
			model.addAttribute("totalContent", totalContent);
			model.addAttribute("pagebar", pagebar);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * [티켓나눔터 상세] 
	 */
	
	@GetMapping("/adminSharingDetail.do")
	public void adminShaingDetail(@RequestParam int no, Model model) {
		log.debug("no = {}", no);
		
		Board sharing = adminService.selectOneSharingCollection(no);
		log.debug("sharing = {}", sharing);
				
		List<Member> list = adminService.selectSharingOneloginMember(no);
		log.debug("list = {}", list);
		
		model.addAttribute("sharing", sharing);
	}
	
	
	/**
	 * [티켓나눔터 삭제]
	 */
	
	@GetMapping("/adminSharingDelete.do")
	public void adminSharingDelete(@RequestParam int no, Model model) {
		
		log.debug("no = {}", no);
		
		Board sharing = adminService.selectOneSharingCollection(no);
		log.debug("sharing = {}", sharing);
		
		model.addAttribute("sharing", sharing);
	}
	
	@PostMapping("/adminSharingDelete.do")
	public String SharingDelete(@RequestParam int no) {
		
		log.debug("no = {}", no);
		
		// 여기서 no 는 notice_board의 글번호
		List<Attachment> attach = adminService.selectAttachmentBySharingNo(no);
		log.debug("attach = {}", attach);
		
		// 파일을 서버에서도 삭제
		if(attach != null && attach.size() != 0) {
			String saveDirectory = application.getRealPath("/resources/upload/board");
			File targetFile = new File(saveDirectory, attach.get(0).getRenamedFilename());
			boolean isDelete = targetFile.delete();
			
			log.debug("isDelete = {}", isDelete);
		}
		
		int result = 0;

//		result = adminService.deleteSharingComment(reviewNo);
		result = adminService.deleteSharing(no);
		String msg = result > 0 ? "삭제 완료" : "삭제 실패";
		log.debug(msg);
			
		return "redirect:/admin/adminSharingList.do";
	}
	


	/**
	 * [티켓나눔터 검색]
	 */
	
	@GetMapping("/adminSharingFinder.do")
	public String adminSharingFinder(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam(value="searchType", required=false) String searchType,
			@RequestParam(value="searchKeyword", required=false) String searchKeyword,		
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
		List<Board> list = adminService.searchSharing(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. totalContent
		int totalContents = adminService.searchSharingCount(param);
		log.debug("totalContents = {}", totalContents);

		model.addAttribute("totalContents", totalContents);
		
		// 3. pagebar
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "admin/adminSharingList";
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
//			log.debug("pagebar = {}", pagebar);
			
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
		
		List<Member> list = adminService.selectNoticeOneloginMember(noticeNo);
		log.debug("list = {}", list);

		model.addAttribute("notice", notice);
		
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
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword; 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
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
//			log.debug("pagebar = {}", pagebar);

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
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
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
//			log.debug("pagebar = {}", pagebar);

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
		String url = request.getRequestURI()+"?searchType="+searchType+"&searchKeyword="+searchKeyword;
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContents, url);
//		log.debug("pagebar = {}", pagebar);
		
		model.addAttribute("pagebar", pagebar);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "admin/adminQuestionList";
	}
	
}
