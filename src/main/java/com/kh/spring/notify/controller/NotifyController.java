package com.kh.spring.notify.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.notify.model.service.NotifyService;
import com.kh.spring.notify.model.vo.SaveNotify;

import lombok.extern.slf4j.Slf4j;



@Controller
@RequestMapping("/notify")
@Slf4j
public class NotifyController {

	@Autowired
	private NotifyService notifyService;

	@Autowired
	private AdminService adminService;

	/**
	 * [메인화면: 알람수]
	 */
	
	@GetMapping("/notifyCount.do")
	public void notifyCount(@RequestParam String id, Model model) {
		int count = notifyService.notifyCount(id);
		
		model.addAttribute("count", count);
	}
	
	/**
	 * [알림 조회]
	 */

	@RequestMapping("/notify.do")
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
	
	// 읽음상태 변경 
	@RequestMapping("/readNotify.do")
	@ResponseBody
	public void readNotify(@RequestParam String n_id, @RequestParam String m_id, HttpServletRequest request) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("n_id", n_id);
		param.put("m_id", m_id);
		
		notifyService.updateNotifyChecked(param);
	}
	
	// 더보기 요청
	@RequestMapping(value = "/searchMoreNotify.do", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String searchMoreNotify(@RequestParam Map<String,String> param) throws Exception {
		Map<String, String> searchParam = new HashMap<String, String>();	// search 파라미터 생성
		searchParam.put("startIndex", param.get("startIndex"));	
		searchParam.put("endIndex", param.get("endIndex"));
		searchParam.put("m_id", param.get("m_id"));
		
		// startIndex ~ endIndex 범위에 해당하는 list 조회 
		List<SaveNotify> addList = notifyService.searchOldNotifyList(searchParam);
		
		for(SaveNotify vo : addList) {	// 날짜 포맷 변경
			vo.setTime(HiSpringUtils.formatTimeString(vo.getTime(), notifyService));
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(addList);
		
		return jsonStr;
	}
		
	/**
	 * [알람 추가]
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
		
		notifyService.insertSaveNotify(param);
	}
	
}

