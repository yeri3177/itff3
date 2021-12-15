<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>관리자채팅 : ${memberId}</title>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<!-- bootstrap js: jquery load 이후에 작성할것.-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	
	<!-- sock.js 라이브러리 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- stomp.js 추가 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<!-- IE 지원용 : babel-standalone babel-polyfill -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js" integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body class="m-2">
	<div class="input-group mb-3">
	  <input type="text" id="message" class="form-control" placeholder="Message...">
	  <div class="input-group-append mr-2" style="padding: 0px;">
	    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
	  </div>
	</div>
	<div>
		<ul class="list-group list-group-flush" id="data">
			<c:forEach items="${list}" var="chatLog">
				<li class="list-group-item">${chatLog.memberId} : ${chatLog.msg}</li>
			</c:forEach>
		</ul>
	</div>
	
	<script>
	// 1. websocket 연결(SockJS)
	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	
	// 2. Stomp Client 객체 생성(websocket)
	const stompClient = Stomp.over(ws);
	
	// 3. 연결 요청 ({}는 헤더, frame은 콜백함수)
	stompClient.connect({}, (frame) => {
		console.log("Stomp Clinet Connected : ", frame);
		
		// 4. 구독 요청 및 핸들러 등록. 위의 connect 안에 써야한다.
		stompClient.subscribe("/chat/${chatId}", (message) => {
			console.log("message : ", message);
			const obj = JSON.parse(message.body);
			console.log(obj);
			const {memberId, msg} = obj;
			$(data).append(`<li class="list-group-item">\${memberId} : \${msg}</li>`);
		});
	});
	
	
	// 전송 버튼
	$(sendBtn).click((e) => {
		const msgVal = $(message).val();
		if(!msgVal) return;   // 유효성 검사. 아무것도 입력하지 않았으면 제출안됨
		
		const obj = {
				chatId : "${chatId}",
				memberId : "${loginMember.id}",
				msg : msgVal,
				logTime : Date.now()
		};

		// publishUrl, headers, msg(json)
		stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj));
		$(message).val('');   // #message 초기화
	});
	
	// 엔터키 쳐도 전송되게 하기
	$(message).keyup((e) => {
		if(e.keyCode == 13) {
			$(sendBtn).trigger('click');
		}
	});
	</script>
</body>
</html>

