package com.kh.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	
	/**
	 * ResponseEntity
	 * 응답처리를 커스터마이징
	 *  - 헤더값 작성
	 *  - 응답 코드
	 *  - 메시지 바디 작성
	 *
	 * @ResponseBody 생략가능(이 기능이 포함되어 있기 때문)
	 * 
	 *  1. ResponseEntity 생성자 호출
	 *  
	 */
	@GetMapping("/selectOneMember.do")
	public ResponseEntity<Member> selectOne(@RequestParam String id) {
		try {
			Member member = memberService.selectOneMember(id);
			log.debug("member = {}", member);
			
			// 1. 생성자
			HttpHeaders header = new HttpHeaders();
			header.add("khacademy", "m-class");
			
			if(member != null)
				return new ResponseEntity<Member>(member, header, HttpStatus.OK);
			else
				return new ResponseEntity<Member>(HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return new ResponseEntity<Member>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	/**
	 * 2. ResponseEntity를 builder패턴 생성하기
	 *  - builder패턴 : static메소드를 연속적으로 호출해서 field값을 설정하는 객체생성법
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/one/{id}")
	public ResponseEntity<?> member(@PathVariable String id) {
		try {
			log.debug("id = {}", id);
			
			Member member = memberService.selectOneMember(id);	
			
			HttpHeaders header = new HttpHeaders();
			header.add("khacademy", "m-class");
			
			if(member != null)
				return ResponseEntity.ok().headers(header).body(member);
			else
				return ResponseEntity.notFound().build();
		} catch (Exception e) {
//			return ResponseEntity.interServerError().build();   // 5.3.8
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	
//  내가한거. @RequestParam(defaultValue = "") 했는데 이것보다 required = false가 낫다는거같아서 이걸로 했다. 이렇게 쓰고 매퍼 if test에 gender 말고 value 쓰면 제대로 작동한다. 이유는 모르겠다.	
//	@GetMapping("/memberList.do")
//	public ResponseEntity<?> memberList(@RequestParam(defaultValue = "") String gender){
//		try {
//			log.debug("gender = {}", gender);
//			
//
//			List<Member> list = memberService.selectMemberList(gender);
//			
//			log.debug("list = {}", list);
//			
//			HttpHeaders header = new HttpHeaders();
//			header.add("spring", "test");
//			
//			if(list != null)
//				return new ResponseEntity<List<Member>>(list, header, HttpStatus.OK);
//			else
//				return new ResponseEntity<List<Member>>(HttpStatus.NOT_FOUND);
//		} catch (Exception e) {
//			log.debug(e.getMessage(), e);
//			return new ResponseEntity<Member>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//		
//	}
	
//	선생님 풀이. param이 추가되어도 대응할 수 있도록 하기 위해서 map을 쓰셨다고 함. 그리고 이렇게 하니까 mapper에서 쿼리를 처음 생각했던대로 쓰니까 제대로 작동함.
	@GetMapping("/memberList.do")
	public ResponseEntity<?> memberList(@RequestParam(required = false) String gender){
		Map<String, Object> param = new HashMap<>();
		param.put("gender", gender);
		if(gender != null && !("M".equals(gender) || "F".equals(gender)))
			return ResponseEntity
					.badRequest()
					.body("wrong gender value : " + gender);

		List<Member> list = memberService.selectMemberList(param); 
		log.debug("list = {}", list);
		return ResponseEntity.ok(list);
	}
	
	
}


