package com.kh.spring.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.chat.model.dao.ChatDao;
import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.chat.model.vo.ChatMember;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Override
	public ChatMember findChatMemberByMemberId(String memberId) {
		return chatDao.findChatMemberByMemberId(memberId);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertChatMembers(List<ChatMember> chatMembers) {
		int result = 0;
		for(ChatMember chatMember : chatMembers) {
			result = chatDao.insertChatMember(chatMember);
		}
		return result;
	}

	@Override
	public int insertChatLog(ChatLog chatLog) {
		return chatDao.insertChatLog(chatLog);
	}

	@Override
	public List<ChatLog> findChatLogByChatId(String chatId) {
		return chatDao.findChatLogByChatId(chatId);
	}
	
	@Override
	public List<ChatLog> findChatLog() {
		return chatDao.findChatLog();
	}

	@Override
	public List<ChatLog> findRecentChatLog() {
		return chatDao.findRecentChatLog();
	}
	
	@Override
	public int updateLastCheck(Map<String, Object> fromMessage) {
		return chatDao.updateLastCheck(fromMessage);
	}
	
	
}
