package com.kh.spring.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.demo.model.service.DemoService;
import com.kh.spring.demo.model.vo.Dev;

/**
# 컨트롤러클래스 메소드가 가질수 있는 파라미터

* HttpServletRequest
* HttpServletResponse
* HttpSession

* java.util.Locale : 요청에 대한 Locale
* InputStream/Reader : 요청에 대한 입력스트림
* OutputStream/Writer : 응답에 대한 출력스트림. ServletOutputStream, PrintWriter

사용자입력값처리
* Command객체 : http요청 파라미터를 커맨드객체에 저장한 VO객체
* CommandMap :  HandlerMethodArgumentResolver에 의해 처리된 사용자입력값을 가진 Map객체
* @Valid : 커맨드객체 유효성 검사객체
* Error, BindingResult : Command객체에 저장결과(Command객체 바로 다음위치시킬것.)
* @PathVariable : 요청url중 일부를 매개변수로 취할 수 있다.
* @RequestParam : 사용자입력값을 자바변수에 대입처리(필수여부 설정)
* @RequestHeader : 헤더값
* @CookieValue : 쿠키값
* @RequestBody : http message body에 작성된 json을 vo객체로 변환처리

뷰에 전달할 모델 데이터 설정
* ModelAndView
* ModelMap 
* Model

* @ModelAttribute : model속성에 대한 getter
* @SessionAttribute : session속성에 대한 getter
* SessionStatus: @SessionAttributes로 등록된 속성에 대하여 사용완료(complete)처리


기타
* MultipartFile : 업로드파일 처리 인터페이스. CommonsMultipartFile
* RedirectAttributes : DML처리후 요청주소 변경을 위한 redirect를 지원
* 
* 
* Model
* 	- view단에 데이터를 전달하기 위한 저장소. Map객체.
* 	- @SessionAttributes를 이용하여 session에 저장하는 것도 가능
* 	- viewName(jsp)정보를 관리한다.
* 
* 
* 	- ModelAndView : model(addObject) + viewName. ModelAndView객체 리턴
* 	- ModelMap : model(addAttribute) String을 리턴하면 viewName
* 	- Model : model(addAttribute) String을 리턴하면 viewName
* 
*/

@Controller
@RequestMapping("/demo")
public class DemoController {

	public static Logger log = LoggerFactory.getLogger(DemoController.class);
	
	@Autowired
	private DemoService demoService;
	
	/**
	 *	현재 컨트롤러의 모든 요청 전에 @ModelAttribute 메소드가 호출되고,
	 *	리턴된 값이 model에 저장된다.
	 * 
	 * @return
	 */
	@ModelAttribute("common")
	public Map<String, Object> common(){
		log.debug("@ModelAttribute(\"common\") 실행!");
		Map<String, Object> map = new HashMap<>();
		map.put("email", "admin@kh.or.kr");
		map.put("tel", "070-123-4567");
		return map;
	}
	
	
	/**
	 * GET /demo/devForm.do 요청시 처리할 핸들러 메소드
	 * method를 특정하지 않으면 모든 전송방식을 처리한다.
	 * 
	 * @return
	 */
	@RequestMapping(value = "/devForm.do")   // value= 없이 그냥 " " 이것만 적어도 된다.
	public String devForm() {
		log.debug("devForm 메소드 호출!");
		return "demo/devForm";   // /WEB-INF/views/  demo/devForm  .jsp  (포워드)
	}
	
	/**
	 * method를 지정하면 지정된 메소드만 처리가능
	 * @return
	 */
	@RequestMapping(value = "/dev1.do", method=RequestMethod.POST)
	public String dev1(HttpServletRequest request) {
		String name = request.getParameter("name");
		int career = Integer.valueOf(request.getParameter("career"));
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String[] langs = request.getParameterValues("lang");
//		log.debug(name);
//		log.debug("{}", career);
//		log.debug(email);
//		log.debug(gender);
//		log.debug(langs != null ? Arrays.toString(langs) : "");
		
		Dev dev = new Dev(0, name, career, email, gender, langs);
		log.debug("dev = {}", dev);
		
		request.setAttribute("dev", dev);
		return "demo/devResult";
	}
	
	
	/**
	 * @RequestParam
	 * 	  - value : 전송된 사용자입력값의 name속성과 변수명이 다른 경우 (생략하면 동일한 걸로 간주한다)
	 * 	  - required : true(기본값) false 하면 여기로 값이 전달되지 않아도 오류가 나지 않고 null로 처리된다.
	 * 	  - defaultValue : 값이 전송되지 않은 경우 처리될 기본값
	 *  
	 * @param name
	 * @param careeeer
	 * @param email
	 * @param gender
	 * @param lang
	 * @return
	 */
	@RequestMapping(value = "/dev2.do", method=RequestMethod.POST)
	public String dev2(
			@RequestParam String name,
			@RequestParam (value = "career") int careeeer,
			@RequestParam(defaultValue = "default@naver.com") String email,
			@RequestParam String gender,
			@RequestParam(required = false) String[] lang,
			Model model
	) {
		Dev dev = new Dev(0, name, careeeer, email, gender, lang);
		log.debug("dev = {}", dev);
		
		// Model은 view단에 전달할 데이터를 보관할 map 객체. request.setAttribute를 대체한다. 
		// model로 보내면 request 스코프로 처리된다.
		model.addAttribute("dev", dev);   
											
		return "demo/devResult";
	}
	
	
	/**
	 * Command객체(VO)
	 * 
	 * Command객체는 Model속성으로 자동등록된다.
	 * 
	 * 이 방법 너무 사기라서 다른 방법 다 필요없을듯
	 * 
	 * 매개변수 @ModelAttribute는 model에 등록된 data를 참조할 수 있다.
	 * 
	 * @param dev
	 * @return
	 */
	@RequestMapping(value = "/dev3.do", method = RequestMethod.POST)
	public String dev3(@ModelAttribute Dev dev) {
		log.debug("dev = {}", dev);
		
		return "demo/devResult";
	}
	
	/**
	 * RedirectAttributes
	 * 	- session에 속성을 기록해서 redirect후에 참조가능 (전에 msg 보내려고 session.setAttribute("msg", msg) 했던거
	 *	- 1회용  (메시지 안 지워도 됨)
	 * 
	 * @param dev
	 * @param redirectAttr
	 * @return
	 */
	@PostMapping("/insertDev.do")
	public String insertDev(Dev dev, RedirectAttributes redirectAttr) {
		
		// 1. 사용자입력값 처리 - 메소드 매개인자로 다 처리됐음 
		log.debug("dev = {}", dev);
		
		// 2. 업무로직
		int result = demoService.insertDev(dev);
		log.debug("result = {}", result);
		
		// 3. 응답처리
		String  msg = result > 0 ? "Dev 등록 성공" : "Dev 등록 실패";
		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/demo/devList.do";
	}
	
	
	@GetMapping("/devList.do")
	public String devList(Model model) {
		List<Dev> list = demoService.selectDevList();
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		return "demo/devList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
