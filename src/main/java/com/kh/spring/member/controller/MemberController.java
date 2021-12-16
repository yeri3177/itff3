package com.kh.spring.member.controller;

import java.beans.PropertyEditor;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
@SessionAttributes({"loginMember"})    // session에 저장될 model data 지정. 이렇게 해두면 model에 저장한 게 기존의 request가 아니라 session에 저장된다.
public class MemberController {

//	public static Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/memberEnroll.do")
	public void memberEnroll() {}
	
	/**
	 * $2a$10$fCtImVF/BtnbGsnSjM0as.tWXVpmobXNp.1msTI.laJTRy5n3vti2
	 * - $2a$ 알고리즘
	 * - 10$ 알고리즘 옵션
	 * - 22자리 randomsalt 
	 * - 31자리 암호화처리된 비밀번호
	 * 
	 * @param member
	 * @param redirectAttr
	 * @return
	 */
	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		log.debug("member = {}", member);
		
		try {
			// 0. 비밀번호 암호화 처리
			log.info("{}", passwordEncoder);
			String rawPassword = member.getPassword();
			String encryptedPassword = passwordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			log.info("{} -> {}", rawPassword, encryptedPassword);
			
			// 1. 업무로직
			int result = memberService.insertMember(member);
			
			// 2. 리다이렉트 & 사용자피드백 전달
			redirectAttr.addFlashAttribute("msg", "회원가입성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/";
	}
	
	
	/**
	 * viewName : String을 리턴하지 않은 경우,
	 *            ViewNameTranslator 빈에 의해 요청url에서 viewName을 유추한다.
	 *            
	 *  /member/memberLogin.do -> /WEB-INF/views/member/memberLogin.jsp
	 */
	@GetMapping("/memberLogin.do")
	public void memberLogin() {}
	
	
//	@PostMapping("/memberLogin.do")
//	public String memberLogin(
//							@RequestParam String id, 
//							@RequestParam String password, 
//							RedirectAttributes redirectAttr,
//							Model model,
//							HttpSession session) {
//		
//		// 1. 업무로직 - 사용자데이터 가져오기
//		Member member = memberService.selectOneMember(id);
//		log.debug("member = {}", member);
//
//		String location = "/";
//		
//		// 2. db정보 비교하기(로그인 성공여부 판단)
//		if(member != null && passwordEncoder.matches(password, member.getPassword())) {
//			// 로그인 성공 : loginMember객체를 세션에 저장해서 로그인상태 유지
//			model.addAttribute("loginMember", member);
//			
//			// redirect주소 세션에서 가져오기
//			String redirect = (String) session.getAttribute("redirect");
//			log.debug("redirect = {}", redirect);
//			if(redirect != null) {
//				location = redirect;
//				session.removeAttribute("redirect");
//			}
//		}
//		else {
//			// 로그인 실패
//			redirectAttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 다릅니다.");
//		}
//				
//		return "redirect:" + location;
//	}
	
	
	/**
	 * @SessionAttribute를 통해 로그인상태를 관리하고 있다.
	 * -> sessionStatus객체를 통해 사용완료처리(setComplete)
	 * 
	 */
//	@GetMapping("/memberLogout.do")
//	public String memberLogout(SessionStatus sessionStatus) {
//			sessionStatus.setComplete();
//		
//		return "redirect:/";
//	}
	

	@GetMapping("memberDetail.do")
	public void memberDetail(Authentication authentication) {
		
		// 1. SecurityContextHolder 로부터 가져오기
//		SecurityContext securityContext = SecurityContextHolder.getContext();
//		Authentication authentication = securityContext.getAuthentication();
//		log.debug("authentication = {}", authentication);
		
		// 2. HandlerMapping 으로부터 가져오기
		log.debug("authentication = {}", authentication);
		
		Member member = (Member) authentication.getPrincipal();
		log.debug("[principal] member = {}", member);
		
		Object credentials = authentication.getCredentials();
		log.debug("[credentials] credentials = {}", credentials);
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		log.debug("[authorities] authorities = {}", authorities);
		
	}
	
	
	// memberUpdate 선생님 풀이
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(
			@ModelAttribute Member member,
			@ModelAttribute("loginMember") Member loginMember,
			RedirectAttributes redirectAttr){
		try { 
			log.debug("member = {}", member);
			log.debug("loginMember = {}", loginMember);
			
			//1.비지니스로직 실행
			int result = memberService.updateMember(member);
			
			//2.처리결과에 따라 view단 분기처리
			if(result > 0){
				// 수정성공시 session의 loginMember 갱신
				// 매개변수에 @ModelAttribute("loginMember") 추가해서 새정보를 반영할 수 있다. 
			}
			
			redirectAttr.addFlashAttribute("msg", "회원 정보를 수정했습니다.");
		} catch(Exception e) {
			log.error("회원 정보 수정 실패", e);
			throw e;   // spring container에게 예외상황 알림
		}
		
		return "redirect:/member/memberDetail.do";
	}
	
	
	// 멤버업데이트 내가한거(라고 하기엔 딴사람거 보고 한거)
//	@PostMapping("/memberUpdate.do")
//	public String memberUpdate(Member member, RedirectAttributes redirectAttr, Model model) {
//		
//		log.debug("MemberUpdate member = {}", member);
//		int result = memberService.updateMember(member);
//		
//		redirectAttr.addFlashAttribute("msg", result > 0 ? "회원정보 수정 완료!" : "수정 실패");
//		
//		model.addAttribute("loginMember", member);
//		
//		return "redirect:/member/memberDetail.do";
//	}
	
	
	/**
	 * jsonView 빈을 이용해서 json응답메시지를 출력
	 * - model에 data 작성
	 * - view단으로 jsonView 지정
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/checkIdDuplicate.do")
	public String idCheckDuplicate1(@RequestParam String id, Model model) {
		log.debug("id = {}", id);
		Member member = memberService.selectOneMember(id);
		model.addAttribute("available", member == null);
		model.addAttribute("num", 12345);
		model.addAttribute("member", member);
		
		return "jsonView";
	}
	
	
	/**
	 * @ResponseBody
	 * - 리턴된 자바객체를 응답메시지 body에 직접 출력
	 * - MessageConverter 빈이 자바객체를 json문자열로 변환처리
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@GetMapping("/checkIdDuplicate2.do")
	public Map<String, Object> idCheckDuplicate2(@RequestParam String id) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = memberService.selectOneMember(id);
		map.put("available", member == null);
		map.put("abc", 123);
		map.put("today", new Date());
		
		return map;
	}
	
		
	/**
	 * 
	 * @InitBinder : 사용자요청을 커맨드객체에 바인딩시 Validator객체, 특정타입별 editor객체 설정
	 * 
	 * 회원가입할때 입력값 받아서 멤버객체 만들고 toString하면 Mon Jul 22 00:00:00 KST 2002 이런식으로 나오는데, 이 문자열을 받아서 yyyy-MM-dd 형태의 java.util.Date로 만들어줌
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 형식객체, 빈값 허용 여부("" -> null)(값을 안 보내면 "" 이렇게 올텐데, 이런 경우 null로 해줌)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, editor);
	}
}
