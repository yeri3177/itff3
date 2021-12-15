package com.kh.spring.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ChatLog;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat.do")
	public String chat(Model model) {
		
		List<ChatLog> list = chatService.findRecentChatLog();
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		return "admin/chat";
	}
	
	
	@GetMapping("/{chatId}/{memberId}/chat.do")
	public String chat(@PathVariable String chatId, @PathVariable String memberId, Model model) {
		List<ChatLog> list = chatService.findChatLogByChatId(chatId);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		model.addAttribute("memberId", memberId);   // 이 줄과 아랫줄을 주석처리해도 문제없이 작동한다고 함. 선생님도 왜 그런지 모르겠다고 하심. pathvariable뭔가 하는게 아닌가 라고
		model.addAttribute("chatId", chatId);
		
		return "admin/popup";
	}
}
