package com.kh.spring.event.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.event.model.vo.RouletteEvent;
import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/eventMenu.do")
	public void eventMenu() {}

	@GetMapping("/eventRoulette.do")
	public void eventRoulette(@RequestParam String id, Model model) {
		log.debug("id = {}", id);
		
		Member member = adminService.selectOneMember(id);
		RouletteEvent roulette = adminService.selectRouletteEvent(id);
		
		log.debug("member = {}", member);
		log.debug("roulette = {}", roulette);
		
		model.addAttribute("member", member);
		model.addAttribute("roulette", roulette);				
	}
	
	/**
	 * [이벤트 룰렛: 포인트 지급]
	 */
	
	@PostMapping("/eventRoulette.do")
	public String eventRoulette(
			@RequestParam String id, 
			@RequestParam int point, 
			@RequestParam int change, 
			Model model, 
			RedirectAttributes redirectAttr,
			Authentication oldAuthentication
			){
		
		String reason = "룰렛 이벤트 포인트 당첨";
		
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
		param.put("oldChange", change);
		param.put("change", newChange);
		param.put("point", newPoint);
		
		log.debug("param = {}", param);
		
		// 이력 조회
		int result = 0;
		int cnt = adminService.selectRouletteEventParticipateCnt(id);
		log.debug("cnt = {}", cnt);
		
		if (cnt == 0) {
			// 실행한 적 없으면 추가
			result = adminService.insertRouletteEvent(param);
		}
		else {
			// 실행한 적 있으면 수정
			result = adminService.updateRouletteEvent(param);
		}
		
		int result2 = adminService.updateMemberPoint(param);
		int result3 = adminService.insertPointHistory(param);
		
		// 포인트 내역
		Member principal = (Member) oldAuthentication.getPrincipal();
		principal.setPoint(newPoint);
		
		redirectAttr.addFlashAttribute("msg", "포인트 지급 성공");
		
		return "redirect:/event/eventMenu.do";
	}
	
	@GetMapping("/eventOffline")
	public void eventOffline() {}

}
