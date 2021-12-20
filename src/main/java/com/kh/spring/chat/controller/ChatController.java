package com.kh.spring.chat.controller;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.chat.model.vo.ChatMember;
import com.kh.spring.common.HiSpringUtils;
import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/common")
@SessionAttributes({"loginMember"})
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat.do")
	public void chat(Authentication authentication, Model model) {
			
		// 2. HandlerMapping 으로부터 가져오기
		log.debug("authentication = {}", authentication);
		
		Member member = (Member) authentication.getPrincipal();
		log.debug("[principal] member = {}", member);
		
		Object credentials = authentication.getCredentials();
		log.debug("[credentials] credentials = {}", credentials);
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		log.debug("[authorities] authorities = {}", authorities);
		
		String chatId = null;		
		String memberId = member.getId();
				
		// 1. 채팅방 조회 : chat_member 테이블에 해당회원의 레코드가 있는가
		ChatMember chatMember = chatService.findChatMemberByMemberId(memberId);
		log.debug("chatMember = {}", chatMember);
		log.debug("memberId = {}", memberId);
		
		// 2. 첫 접속인 경우 : chat_member 테이블에 insert 작업
		if(chatMember == null) {
			chatId = HiSpringUtils.getRandomChatId();
			log.debug("chatId = {}", chatId);
			
			chatMember = new ChatMember(chatId, memberId, 0, "Y", null, null);
			ChatMember chatAdmin = new ChatMember(chatId, "admin", 0, "Y", null, null);
			chatService.insertChatMembers(Arrays.asList(chatMember, chatAdmin));
		}
		
		// 3. 접속한 적 있는 경우 : 채팅로그 조회
		else {
			chatId = chatMember.getChatId();
			List<ChatLog> list =  chatService.findChatLogByChatId(chatId);
			log.debug("memberId = {}", memberId);
			log.debug("list = {}", list);
			model.addAttribute("list", list);
		}
		
		model.addAttribute("chatId", chatId);
		model.addAttribute("memberId", memberId);
		}
	
}