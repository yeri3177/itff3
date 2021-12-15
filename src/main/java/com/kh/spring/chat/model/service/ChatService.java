package com.kh.spring.chat.model.service;

import java.util.List;

import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.chat.model.vo.ChatMember;

public interface ChatService {

	ChatMember findChatMemberByMemberId(String memberId);

	int insertChatMembers(List<ChatMember> chatMembers);

	int insertChatLog(ChatLog chatLog);

	List<ChatLog> findChatLogByChatId(String chatId);

	List<ChatLog> findRecentChatLog();

}
