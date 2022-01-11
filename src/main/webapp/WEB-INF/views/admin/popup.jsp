<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>관리자 채팅 : ${memberId}</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/chat.css">

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- sock.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- stomp.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 : babel-standalone babel-polyfill -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js" integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	
</head>
<body class="chat_body">
<div class="title_wrap">
		<div data-v-994dabf8="" data-v-275f838a="" class="layout ma-0"
			id="message-main-toolbar">
			<nav data-v-994dabf8="" class="v-toolbar theme--light"
				data-booted="true"
				style="margin-top: 0px; padding-right: 0px; padding-left: 0px; transform: translateY(0px); background-color: rgb(255, 255, 255); background-image: none;">
				<div class="v-toolbar__content" style="height: 56px;">
					<div data-v-994dabf8="" class="layout align-center justify-center">

						<div data-v-994dabf8="">
							<div data-v-994dabf8="" class="text-xs-center toolbar-title"
								style="color: rgb(75, 75, 75); font-family: 'Noto Sans KR';">
								<div data-v-994dabf8="" class="online"></div>
								실시간 채팅 문의
							</div>
							<div data-v-994dabf8="" class="text-xs-center toolbar-comment"
								style="color: rgb(0, 0, 0);"></div>
						</div>
					</div>
					<i data-v-994dabf8="" aria-hidden="true"
						class="v-icon stroke v-icon--link v-icon--right fa fa-times theme--light"></i>
				</div>
			</nav>
			<div data-v-994dabf8="" class="v-dialog__container"
				style="display: block;"></div>
		</div>
</div>
 
<div>
		<div class="chat_container" id="messages">
		<ul class="list-group list-group-flush" id="data">
		<c:forEach items="${list}" var="chatLog">
		
		<c:if test="${chatLog.memberId eq 'admin' }">
			<div class="message-data" id="align-right">
				<span class="message-data-name" id="${chatLog.memberId eq 'admin' ? 'name_admin' : 'name_user'}">
					${chatLog.memberId eq 'admin' ? 'ITFF' : chatLog.memberId}
				</span>
	        </div>
		</c:if>
		
		<c:if test="${chatLog.memberId ne 'admin' }">
			<div class="message-data" id="align-left" >
				<span class="message-data-name" id="${chatLog.memberId eq 'admin' ? 'name_admin' : 'name_user'}">
					${chatLog.memberId eq 'admin' ? 'ITFF' : chatLog.memberId}
				</span>
			</div>
		</c:if>
		
				<li class="list-group-item" id="${chatLog.memberId eq 'admin' ? 'admin' : 'user'}">${chatLog.msg}</li>
		</c:forEach>

		</ul>
	</div>
</div>
<footer>
<div class="input_wrap">
	<div class="input-group mb-3">
	  <input type="text" id="message" class="form-control" placeholder="메세지를 입력하세요.">
	  <div class="input-group-append" style="padding: 0px;">
	    <button id="sendBtn" class="btn btn-outline-secondary" type="button">전송</button>
	  </div>
	</div>
</div>
</footer>
</body>

<script>

// // websocket 연결(SockJS)
// const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);

// // StompClient객체 생성
// const stompClient = Stomp.over(ws);

// // connect
// stompClient.connect({}, (frame) => {
	
// 	// 구독신청 및 핸들러 등록
// 	stompClient.subscribe("/chat/${chatId}", (message) => {
// 		console.log("[popup] message: ", message);
// 		console.log("[popup] message.headers: ", message.headers)
		
// 		const {memberId, msg} = JSON.parse(message.body);
		
// 		//$(data).append(`<div class="message-data align-left"><span class="message-data-name" id=\${memberId == "admin" ? "name_admin" : "name_user"}>\${memberId}</span></div>`);
		
// // 		if(message.headers.destination != '/chat/admin') {
			
// 		$(data).append(
// 				`
// 				<div class="message-data" id=\${memberId == "admin" ? "align-right" : "align-left"}>
// 				<span class="message-data-name" id=\${memberId == "admin" ? "name_admin" : "name_user"}>
// 				\${memberId == "admin" ? "ITFF" : memberId}
// 				</span>
// 				</div>
// 				<li class="list-group-item" id=\${memberId == "admin" ? "admin" : "user"}>
// 				\${msg}
// 				</li>
// 				`
// 				);
// // 		}
// 	});	

// 	// 팝업생성, stompClient가 연결되면 chat_member.last_check컬럼을 update한다.
// 	// 위치주의 : connect된 이후 호출되어야한다.
// 	lastCheck();
// });

/**
 * 팝업창이 활성화(focus)되면 chat_member.last_check컬럼을 update한다.
 */
// $(window).focus((e) => {
// 	console.log("WINDOW FOCUS");
// 	lastCheck();
// });

// #sendBtn 클릭시 적절한 주소를 msg publish!
$(sendBtn).click((e) => {
	const msgVal = $(message).val();
	if(!msgVal) return; // 유효성검사
	
	const obj = {
		chatId: "${chatId}",
		memberId: "${memberId}",
		msg: msgVal,
		logTime: Date.now(),
		type: "MESSAGE"
	};
	// publishUrl, headers, msg(json)
	stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj));
	
	$(message).val('').focus; // 초기화		
});

	// 엔터키 쳐도 전송되게 하기
   $(message).keyup((e) => {
       if(e.keyCode == 13) {
           $(sendBtn).trigger('click');
       }
   });

/**
 * 관리자 채팅방 마지막 확인시각을 메세지로 발행 -> db chat_member.last_check update
 */
const lastCheck = () => {
	
	const data = {
			chatId : "${chatId}",
			memberId : "${memberId}",
			lastCheck : Date.now(),
			type : "LAST_CHECK"
	};
	
	stompClient.send("/app/lastCheck", {}, JSON.stringify(data));
};

</script>
 
<script>

$(document).ready(function() {
	$("#messages").scrollTop($("#messages")[0].scrollHeight);
});

</script>

</html>

