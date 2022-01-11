<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ITFF Admin</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f83d8937bb78b8df31e1796445fc8213&libraries=services,clusterer"></script>

<!-- bootstrap js: jquery load 이후에 작성할 것.-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/chat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/userChat.css">

<!-- sock.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"
	integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- stomp.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"
	integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 babel-standalone -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"
	integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용: babel-polyfill -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js"
	integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">
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
								style="color: rgb(75, 75, 75);">
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
			
		<c:if test="${chatLog.memberId ne 'admin' }">
			<div class="message-data" id="align-right">
				<span class="message-data-name" id="${chatLog.memberId eq 'admin' ? 'name_admin' : 'name_user'}">
					${chatLog.memberId ne 'admin' ? chatLog.memberId : 'ITFF'}
				</span>
	        </div>
		</c:if>
		
		<c:if test="${chatLog.memberId eq 'admin' }">
			<div class="message-data" id="align-left" >
				<span class="message-data-name" id="${chatLog.memberId eq 'admin' ? 'name_admin' : 'name_user'}">
					${chatLog.memberId ne 'admin' ? chatLog.memberId : 'ITFF'}
				</span>
			</div>
		</c:if>
			
				<li class="list-group-item" id="${chatLog.memberId ne 'admin' ? 'admin' : 'user'}">${chatLog.msg}</li>
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

<input type="hidden" class="ws_id" value="${chatLog.memberId }" />

<script>
// /chat/chat_mk0L0UJ93P50409 구독
// 1. Stomp Client객체 생성(websocket)
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
const stompClient = Stomp.over(ws);

// 2. 연결 요청
stompClient.connect({}, (frame) => {
	console.log("Stomp Client Connect : ", frame);
	
	// 3.구독요청
	stompClient.subscribe("/chat/${chatId}", (message) => {
		console.log("message : ", message);
		
		const {memberId, msg} = JSON.parse(message.body);
		
		$(data).append(
				`
				<div class="message-data" id=\${memberId != "admin" ? "align-right" : "align-left"}>
				<span class="message-data-name" id=\${memberId != "admin" ? "name_admin" : "name_user"}>
				\${memberId != 'admin' ? memberId : 'ITFF'}
				</span>
				</div>
				<li class="list-group-item" id=\${memberId != "admin" ? "admin" : "user"}>
				\${msg}
				</li>
				`
				);
	});
	
});

$(sendBtn).click((e) => {
	const obj = {
		chatId : "${chatId}",
		memberId : "${memberId}",
		msg : $(message).val(),
		logTime : Date.now(),
		type: "MESSAGE"
	};
	console.log(obj);
	
	stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj));
	$(message).val(''); // #message 초기화
});

// 엔터키 쳐도 전송되게 하기
$(message).keyup((e) => {
    if(e.keyCode == 13) {
        $(sendBtn).trigger('click');
    }
});

</script>

<script>

$(document).ready(function() {
	$("#messages").scrollTop($("#messages")[0].scrollHeight);
});

</script>
<!-- 
<script>

// 채팅 보낸 처음 한 번만 실행되도록 하는 one 
$(sendBtn).one("click", function() {
	
let type = '채팅';
let target = 'admin';
let content = '[채팅] 새로운 채팅이 있습니다.'
let url = '${contextPath}/notify/saveNotify.do';
	    
console.log(type);
console.log(target);
console.log(content);
console.log(url);

// 전송한 정보를 db에 저장	
$.ajax({
    type: "post",
    url:"${pageContext.request.contextPath}/notify/saveNotify.do",
    dataType: "text",
    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    data: {
        target: target,
        content: content,
        type: type,
        url: url
    },
    beforeSend : function(xhr) {   
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    },
    success:    // db전송 성공시 실시간 알림 전송
        // 소켓에 전달되는 메시지
        // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
    	socket.send("ITFF,"+target+","+content+","+url)
//		console.log("관리자,"+target+","+content+","+url)

}, {once:true});

});

</script>
 -->