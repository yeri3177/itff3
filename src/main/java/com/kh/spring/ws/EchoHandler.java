package com.kh.spring.ws;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class EchoHandler extends TextWebSocketHandler {

	/**
	 * ThreadSafe한 ArrayList 
	 * - 동기화지원 
	 */
	List<WebSocketSession> sessionList = new CopyOnWriteArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		log.debug("[[EchoHandler] 현재 세션 수 {}] {} 연결!", sessionList.size(), session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String sessionId = session.getId();
		String payload = message.getPayload();   // 실제내용
		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(sessionId + " : " + payload));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.add(session);
		log.debug("[[EchoHandler] 현재 세션 수 {}] {} 연결 해제!", sessionList.size(), session.getId());
	}

}
