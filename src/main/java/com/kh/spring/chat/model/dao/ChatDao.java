package com.kh.spring.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.chat.model.vo.ChatMember;

@Mapper
public interface ChatDao {

	ChatMember findChatMemberByMemberId(String memberId);

	int insertChatMember(ChatMember chatMember);

	int insertChatLog(ChatLog chatLog);

	List<ChatLog> findChatLogByChatId(String chatId);

	List<ChatLog> findRecentChatLog();
	
	List<ChatLog> findChatLog();

	int updateLastCheck(Map<String, Object> fromMessage);
	
}
