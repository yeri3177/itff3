package com.kh.spring.member.controller;

import java.beans.PropertyEditor;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.member.model.vo.Point;
import com.kh.spring.review.model.vo.Review;
import com.kh.spring.sharing.model.vo.Attachment;
import com.kh.spring.sharing.model.vo.Board;

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
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/memberEnroll.do")
	public void memberEnroll() {}
	

	
	/**
	 * 회원가입 폼 제출받는 메소드
	 * memberEnroll.jsp의 날짜 입력 폼이 string이라서 그대로 member로 받으려니까 오류가 났다. 그래서 requestparam 으로 날짜값을 받아서 여기서 Date로 만들었다.
	 * 주소 입력 폼도 두개라서 ,로 이어져 들어가길래 마찬가지로 requestparam으로 받아서 여기서 처리
	 */
	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, 
								@RequestParam String birthday1, 
								@RequestParam String birthday2, 
								@RequestParam String birthday3, 
								@RequestParam String phone1, 
								@RequestParam String phone2, 
								@RequestParam String phone3,
								Model model,
								RedirectAttributes redirectAttr) {
		
		// 생일 연월일 합쳐서 Date 타입으로 형변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = null;
		try {
			birthday = sdf.parse(birthday1 + "-" + birthday2 + "-" + birthday3);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.debug("birthday = {}", birthday);
		member.setBirthday(birthday);
		
		// 전화번호
		String phone = phone1 + phone2 + phone3;
		log.debug("phone = {}", phone);
		member.setPhone(phone);
		
		// 0. 비밀번호 암호화 처리
		log.info("{}", passwordEncoder);
		String rawPassword = member.getPassword();
		String encryptedPassword = passwordEncoder.encode(rawPassword);
		member.setPassword(encryptedPassword);
		log.info("{} -> {}", rawPassword, encryptedPassword);
		
		log.debug("member = {}", member);
				
		// 멤버 회원가입
		int result1 = memberService.insertMember(member);
		
		// 회원가입 축하 포인트 적립
		String id = member.getId();
		String reason = "회원가입 축하 포인트 지급";
		String change = "+1000";
		int point = 1000;
						
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("reason", reason);
		param.put("change", change);
		param.put("point", point);
		
		log.debug("param = {}", param);
				
		// 포인트 기록 넣기
		int result2 = memberService.insertPointHistory(param);
		
		return "member/memberEnrollComplete";
	}
		
	
	@PostMapping("/memberMailWaiting")
	public void memberMailWaiting(Model model, @RequestParam String memberEmail) {
		log.debug("memberEmail = {}", memberEmail);
		
		// 메일 전송

		// 인증키 생성
        String authKey = HiSpringUtils.getRandomChatId(); //난수가 저장될 변수
        
		String subject = "ITFF 회원가입 인증 메일입니다.";
        String content = authKey;
        String from = "gproject0000@gmail.com";
        String to = memberEmail;
		
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
//		        HiSpringUtils.mailSend(subject, content, from, to);
        
        model.addAttribute("authKey", authKey);
        
		// 3. 리다이렉트 & 사용자피드백 전달
        
        log.debug("authKey = {}", authKey);
//		      redirectAttr.addAttribute("authKey", authKey);
//				redirectAttr.addFlashAttribute("msg", "회원가입성공");
	}
	
	
	
	/**
	 * viewName : String을 리턴하지 않은 경우,
	 *            ViewNameTranslator 빈에 의해 요청url에서 viewName을 유추한다.
	 *            
	 *  /member/memberLogin.do -> /WEB-INF/views/member/memberLogin.jsp
	 */
	@GetMapping("/memberLogin.do")
	public void memberLogin() {}
	
	@GetMapping("/test.do")
	public void test() {}

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
	
	@GetMapping("/memberUpdate.do")
	public void memberUpdate() {}
	
	// memberUpdate 선생님 풀이
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(
			@ModelAttribute Member member,
			@RequestParam String birthday1, 
			@RequestParam String birthday2, 
			@RequestParam String birthday3, 
			@RequestParam String address1, 
			@RequestParam String address2, 
			@RequestParam String phone1, 
			@RequestParam String phone2, 
			@RequestParam String phone3,
			RedirectAttributes redirectAttr){
		try { 
			
			log.debug("=========== form --> controller ===========");
			log.debug("===========================================");
			log.debug("birthday1 = {}", birthday1);
			log.debug("birthday2 = {}", birthday2);
			log.debug("birthday3 = {}", birthday3);
			log.debug("===========================================");
			log.debug("address1 = {}", address1);
			log.debug("address2 = {}", address2);
			log.debug("===========================================");
			log.debug("phone1 = {}", phone1);
			log.debug("phone2 = {}", phone2);
			log.debug("phone3 = {}", phone3);
			log.debug("===========================================");
			
			log.debug("member = {}", member);
			
			// 생일 연월일 합쳐서 Date 타입으로 형변환
			if(!birthday1.isEmpty()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date birthday = null;
				try {
					birthday = sdf.parse(birthday1 + "-" + birthday2 + "-" + birthday3);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				log.debug("birthday = {}", birthday);
				member.setBirthday(birthday);
			}
			
			// 주소
			if(!address1.isEmpty()) {
				String address = address1 + " " + address2;
				log.debug("address = {}", address);
				member.setAddress(address);				
			}
			
			// 전화번호
			if(!phone1.isEmpty()) {
				String phone = phone1 + phone2 + phone3;
				log.debug("phone = {}", phone);
				member.setPhone(phone);				
			}
			
			// 0. 비밀번호 암호화 처리
			if(member.getPassword() != null) {
				log.info("{}", passwordEncoder);
				String rawPassword = member.getPassword();
				String encryptedPassword = passwordEncoder.encode(rawPassword);
				member.setPassword(encryptedPassword);
				log.info("{} -> {}", rawPassword, encryptedPassword);				
			}

			
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
	
	@GetMapping("/memberPoint.do")
	public void memberPoint(
			@RequestParam(defaultValue = "1") int cPage, // cPage가 넘어오지 않으면 에러나기때문에 기본값을 주어야 한다.
			Model model,
			HttpServletRequest request,
			Authentication authentication
	) {
		
		//접속된 아이디 가져오기
		Member member = (Member) authentication.getPrincipal();
		String id = member.getId();
		log.debug("id = {}", id);
		
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit; 
		
		// 1.전체 게시글 목록 가져오기
		List<Point> list = memberService.selectPointListByMemberId(offset, limit, id);
		log.debug("PointList = {}", list);
		model.addAttribute("list", list);
		
		int totalPoint = list.get(0).getPoint();
		model.addAttribute("totalPoint", totalPoint);
		
		// 2. 아이디별 포인트 총 게시물 수 가져오기
		int totalContent = memberService.selectPointTotalCount(id);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI(); 
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
	}
	
	@GetMapping("/memberWrittenBoardList.do")
	public String memberWrittenBoard(
			@RequestParam(defaultValue = "1") int cPage, // cPage가 넘어오지 않으면 에러나기때문에 기본값을 주어야 한다.
			Model model,
			HttpServletRequest request,
			Authentication authentication
	) {
		
		//접속된 아이디 가져오기
		Member member = (Member) authentication.getPrincipal();
		String id = member.getId();
		log.debug("id = {}", id);
		log.debug("cPage = {}", cPage);
		
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		// 1.전체 게시글 목록 가져오기(첨부파일 갯수 포함)
		List<Board> list = memberService.selectBoardListByMemberId(offset, limit, id);
		log.debug("BoardList = {}", list);
		model.addAttribute("list", list);
		
		// 2. 아이디별 총 게시물 수 가져오기
		int totalContent = memberService.selectBoardTotalCount(id);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		
		// 3. pagebar
		String url = request.getRequestURI(); // /spring/sharing/boardList.do
		String pagebar = HiSpringUtils.getPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		
		return "/member/memberWrittenBoardList";
	}
	
	@GetMapping("/memberWrittenReviewList.do")
	public String memberWrittenReviewList(
			@RequestParam(defaultValue = "1") int cPage,
			Model model,
			HttpServletRequest request,
			Authentication authentication) {
		
		//선택된 라디오 값 가져오기
		String searchBoard = request.getParameter("searchBoard");
		log.debug("searchBoard = {}", searchBoard);
		model.addAttribute("searchBoard", searchBoard);
		
		//접속된 아이디 가져오기
		Member member = (Member) authentication.getPrincipal();
		String id = member.getId();
		
		log.debug("id = {}", id);
		
		log.debug("cPage = {}", cPage);

		int limit = 20;
		int offset = (cPage - 1) * limit;
	
		// 1. 전체 게시물 목록 가져오기(첨부파일 갯수 포함)
		List<Review> list = memberService.selectReviewListByMemberId(offset, limit, id);
		log.debug("ReviewList = {}", list);
		model.addAttribute("list", list);
		
		// 2. 접속된 아이디 별 총 게시물 수 가져오기
		int totalContent = memberService.selectReviewTotalCount(id);
		log.debug("totalContent = {}", totalContent);
		model.addAttribute("totalContent", totalContent);
		
		// 3. pagebar
		String url = request.getRequestURI();   // /spring/board/boardList.do
		String pagebar = HiSpringUtils.getReviewPagebar(cPage, limit, totalContent, url);
		log.debug("pagebar = {}", pagebar);
		model.addAttribute("pagebar", pagebar);
		
		return "/member/memberWrittenReviewList";
		
	}
	
	@GetMapping("/memberProfile.do")
	public String memberProfile(
			Model model,
			HttpServletRequest request,
			Authentication Authentication
	) {
		 
		Member member = (Member)Authentication.getPrincipal();
		String image = member.getImage();
		
		model.addAttribute("image", image);
		
		return "/member/memberProfile";
	}
	
	@RequestMapping(value = "/changeImage.do", method = {RequestMethod.POST})
	public String changeImg(
			Member member,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
			Model model,
			Authentication oldAuthentication
	) {
		// 아이디
//		member = (Member)authentication.getPrincipal();
//		String id = member.getId();
		log.debug("member = {}", member);
		
		try {
			
			// 첨부파일 list생성
			List<Attachment> attachments = new ArrayList<>();
			
			// application객체(ServletContext)
			String saveDirectory = application.getRealPath("/resources/upload/member");
			log.debug("saveDirectory = {}", saveDirectory);
			
			member = (Member)oldAuthentication.getPrincipal();
			String id = member.getId();
			String originalFilename = "";
			
			for(MultipartFile upFile : upFiles) {
	
				if(!upFile.isEmpty() && upFile.getSize() != 0) {
					
					log.debug("upFile = {}", upFile);
					log.debug("upFile.name = {}", upFile.getOriginalFilename());
					log.debug("upFile.size = {}", upFile.getSize());
					
					originalFilename = upFile.getOriginalFilename();
	
					// 1. 서버컴퓨터에 저장
					File dest = new File(saveDirectory, originalFilename);
					log.debug("dest = {}", dest);
					upFile.transferTo(dest);
					
				}
			}
			
			log.debug("originalFilename = {}", originalFilename);
			
			Map<String, Object> param = new HashMap<>();
			param.put("originalFilename", originalFilename);
			param.put("id", id);
			
			
			int result = memberService.insertProfileImage(param);
			
			Member principal = (Member) oldAuthentication.getPrincipal();
			principal.setImage(originalFilename);
			
		} catch (Exception e) {
			log.error(e.getMessage(), e); // 로깅
		}		
		
		return "redirect:/member/memberProfile.do";
	}
	
	@RequestMapping(value = "/deleteImage.do", method = {RequestMethod.POST})
	public String deleteImg(
			Member member,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
			Model model,
			Authentication oldAuthentication
	) {
		
		member = (Member)oldAuthentication.getPrincipal();
		String originalFilename = "기본 프로필 이미지.png";
		String id = member.getId();
		
		Map<String, Object> param = new HashMap<>();
		param.put("originalFilename", originalFilename);
		param.put("id", id);
		
		int result = memberService.insertProfileImage(param);
		
		Member principal = (Member) oldAuthentication.getPrincipal();
		principal.setImage(originalFilename);
		
		return "redirect:/member/memberProfile.do";
	}
	
	@GetMapping("/dailyCheck.do")
	public void dailyCheck() {}
	
	@ResponseBody
	@PostMapping("/dailyCheckInsert.do")
	public void dailyCheckInsert(
			Authentication authentication
	) {
		
		Member member = (Member) authentication.getPrincipal();
		String id = member.getId();
		
		log.debug("id = {}", id);
		
		int result = memberService.dailyCheckInsert(id);
		
//		Map<String, Object> map = new HashMap<>();
//		
//		Member member = memberService.selectOneMember(id);
//		map.put("available", member == null);
//		map.put("abc", 123);
//		map.put("today", new Date());
		
//		return map;
	}

	
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
	
	@ResponseBody
	@GetMapping("/checkNicknameDuplicate.do")
	public Map<String, Object> nicknameCheckDuplicate(@RequestParam String nickname) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = memberService.selectOneNickname(nickname);
		map.put("available", member == null);
		map.put("abc", 123);
		map.put("today", new Date());
		
		return map;
	}
	
	@ResponseBody
	@GetMapping("/checkEmailDuplicate.do")
	public Map<String, Object> emailCheckDuplicate(@RequestParam String email) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = memberService.selectOneEmail(email);
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
	
	@GetMapping("/memberEnrollComplete.do")
	public void memberEnrollComplete() {}
}
