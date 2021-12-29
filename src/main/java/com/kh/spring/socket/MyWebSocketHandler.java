package com.kh.spring.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
	public class MyWebSocketHandler extends TextWebSocketHandler{
	
	// 로그인 중 사용자
	List<WebSocketSession> sessions = new ArrayList<>();
	
	// 1대1
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	List<WebSocketSession> sessionList = new CopyOnWriteArrayList<>();
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		sessionList.add(session);
		log.debug("[현재 세션 수: {}] {} 연결!", sessionList.size(), session.getPrincipal().getName());
		
		String senderId = session.getPrincipal().getName();
		
		if(senderId != null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 됨");
			
			users.put(senderId, session);
			sessions.add(session);
		}

	}
	
	// 클라이언트가 Data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("Info: handleTextMessage 통과");
		
		String senderId = session.getPrincipal().getName();
		
		//모든 유저에게 보낸다 - 브로드 캐스팅
//		log(senderId+":"+ message.getPayload());
//		
//		for (WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(message.getPayload()));
//		}
		
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		
		if(msg != null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			
			if(strs != null && strs.length == 4) {
//				String cmd = strs[0];	// 삭제 필요할 시 삭제
				String type = strs[0];
				String target = strs[1]; 
				String content = strs[2];
				String url = strs[3];
				
				WebSocketSession targetSession = users.get(target);  // 타겟세션 조회
				
				log.debug("========= targetSession {} ", targetSession);
				
				// 실시간 접속시
				// 어드민 메시지 받을 때 (분기처리 필요할 경우)
//				if("adminMsg".equals(cmd) && targetSession!=null) {
				
				// 개별 메세지
				if(targetSession != null) {
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
					targetSession.sendMessage(tmpMsg);
				}
				
				// 전체 메세지
				if ("all".equals(target)) {
					log(senderId+":"+ message.getPayload());
					
					for (WebSocketSession sess : sessions) {
						TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
						sess.sendMessage(tmpMsg);
					}
				}
			}
		}
		
	}
		
	// 연결 해제될 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = session.getPrincipal().getName();
		
		if(senderId != null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 종료됨");
			users.remove(senderId);
			sessions.remove(session);
		}
	}

	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	
	// 로그 메시지
	private void log(String logmsg) {
		log.debug(new Date() + " : " + logmsg);
	}
	
}
