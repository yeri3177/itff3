package com.kh.spring.memo.controller;

import java.security.InvalidParameterException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.memo.model.service.MemoService;
import com.kh.spring.memo.model.vo.Memo;

import lombok.extern.slf4j.Slf4j;


/**
 * AOP는 어떻게 mvc의 실행메소드 사이에 끼어들어서 실행되는가?
 * - AOP는 의존주입한 Proxy 객체를 사용
 * - spring container는 동적으로 대상클래스를 상속/구현하는 객체(Proxy)를 생성해서 의존주입한다.
 *  
 * - 1. 인터페이스 구현객체 : jdk 동적 proxy객체
 * - 2. 인터페이스 구현하지 않은 객체 : CGLIB(Code Generator library)의 proxy객체
 * 
 *
 */
@Controller
@Slf4j
@RequestMapping("/memo")
public class MemoController {

	@Autowired
	private MemoService memoService;
	
	
	/*
	 * 11-26 숙제 : 메모 작성과 메모 리스트 불러와서 보이게 하기
	 *  1. PostMapping insertMemo를 생성
	 *  2. memo-mapper 생성
	 *  3. sql에서 조회하니까 db에 들어간 거 확인됨
	 *  4. 메모페이지로 리다이렉트
	 *  4. 메모페이지로 갈때 전체 메모 불러오도록 함. GetMapping memo를 수정
	 *  5. selectMemoList를 생성
	 *  5. log.debug로 메모목록을 가져왔나 확인
	 *  6. model.addAttribute로 메모목록을 저장
	 *  7. return 뭐시기 써 줄 필요 없이 그냥 둬도 메모페이지로 갔다. 전에 return String 안주면 메소드명으로 알아서 jsp명을 찾아준다고 들었는데 그거인거같다.
	 *  8. memo.jsp에서 c:forEach를 이용해서 메모목록을 출력. 등록일자는 fmt:formatDate에 넣어줌
	 *  9. 메모페이지 갔을때 바로 목록 나오고, 메모 작성시 메시지 뜨고 방금 작성한 메시지가 제일 위에 나오는거 확인.
	 * 
	 */
	
	/**
	 * select * from memo order by no desc
	 * 
	 * 컨트롤러 쓸 때 미리 sql쿼리를 생각두는 게 좋다. 그러면 컨트롤러에 뭘 써야 할지 정리가 된다.
	 */
	@GetMapping("/memo.do")
	public void memo(Model model) {
		log.debug("{}", "/memo.do 요청!");
		log.debug("{} {}", memoService, memoService.getClass());
		
		// 1. 업무로직
		List<Memo> list = memoService.selectMemoList();
		log.debug("MemoList = {}", list);
		model.addAttribute("list", list);
	}
	
	@PostMapping("/insertMemo.do")
	public String insertMemo(Memo memo, RedirectAttributes redirectAttr) {
		log.debug("memo = {}", memo);
		
		try {
			// 1. 업무로직
			int result = memoService.insertMemo(memo);
			
			// 2. 리다이렉트
			redirectAttr.addFlashAttribute("msg", "메모 작성 성공");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/memo/memo.do";
	}
	
	
	@PostMapping("/deleteMemo.do")
	public String deleteMemo(@RequestParam int no, @RequestParam String password, RedirectAttributes redirectAttr) {
		
		try {
			int result = memoService.deleteMemo(no, password);
			redirectAttr.addFlashAttribute("msg", "메모 삭제 성공!");
			
		} catch (InvalidParameterException e) {
			log.error(e.getMessage(), e);
			redirectAttr.addFlashAttribute("msg", e.getMessage());
			
		} catch (Exception e) {
			log.error("메모 삭제 오류!", e);
			throw e;
		} 
		
		return "redirect:/memo/memo.do";
	}
	
}
