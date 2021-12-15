package com.kh.spring.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.chat.model.vo.ChatLog;
import com.kh.spring.chat.model.vo.ChatMember;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public ChatMember findChatMemberByMemberId(String memberId) {
		return session.selectOne("chat.findChatMemberByMemberId", memberId);
	}

	@Override
	public int insertChatMember(ChatMember chatMember) {
		return session.insert("chat.insertChatMember", chatMember);
	}

	@Override
	public int insertChatLog(ChatLog chatLog) {
		return session.insert("chat.insertChatLog", chatLog);
	}

	@Override
	public List<ChatLog> findChatLogByChatId(String chatId) {
		return session.selectList("chat.findChatLogByChatId", chatId);
	}

	@Override
	public List<ChatLog> findRecentChatLog() {
		return session.selectList("chat.findRecentChatLog");
	}

	
}
