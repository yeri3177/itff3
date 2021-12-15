<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Websocket" name="title"/>
</jsp:include>

	<c:if test="${loginMember.id eq 'admin'}">
		<!-- 관리자용 공지 modal -->
		<div class="modal fade" id="adminNoticeModal" tabindex="-1" role="dialog" aria-labelledby="#adminNoticeModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="adminNoticeModalLabel">Notice</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
		            <label for="send-to-name" class="col-form-label">받는이 :</label>
		            <input type="text" class="form-control" id="send-to-name">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="col-form-label">메세지 :</label>
		            <textarea class="form-control" id="message-text"></textarea>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="adminNoticeSendBtn">전송</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div>
			<button 
				type="button" 
				class="btn btn-outline-primary"
				data-toggle="modal" data-target="#adminNoticeModal">공지</button>
		</div>
		<script>
		$(adminNoticeSendBtn).click((e) => {
			const to = $("#send-to-name").val() ? $("#send-to-name").val() : 'all';
			const obj = {
				from : "${loginMember.id}",
				to : to,
				msg : $("#message-text").val(),
				time : Date.now(),
				type : "NOTICE"
			};
			
			const url = `/app/admin/notice/\${obj.to}`;
			console.log(url, obj);
			
			stompClient.send(url, {}, JSON.stringify(obj));
			
			// modal 해제
			$(adminNoticeModal)
				.modal('hide')
				.find('form')[0].reset();   // [0] 실제 js dom 객체를 반환
			
		});
		</script>
		
	</c:if>
	
	<div class="input-group mb-3">
		<select id="destination" class="form-select mr-1">
			<option value="/topic">/topic</option>
			<option value="/app/a">/app/a</option>
			<option value="/app/b">/app/b</option>
			<option value="/app/c">/app/c</option>
			<option value="/app/x">/app/x</option>
		</select>
	    <input type="text" id="message" class="form-control" placeholder="Message">
	    <div class="input-group-append" style="padding: 0px;">
	        <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
	    </div>
    </div>
    <div>
        <ul class="list-group list-group-flush" id="data"></ul>
    </div>
	<script type="text/babel">
	// 1. Stomp Client 객체 생성(websocket)
	const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
	const stompClient = Stomp.over(ws);

	const messageHandler = (message) => {	
		console.log("message from /topic", message);
		// {headers:{destination:"/app/a"}, body: "안녕", ...}
		const {headers: {destination}, body} = message;
		$(data).append(`<li class="list-group-item">\${destination} : \${body}</li>`);
	};

	// 2. 구독(subscribe)
    // 뭐 이렇게 생겼나 싶은데 딱히 설명이 없음. 그냥 이렇게 써야하는듯
	stompClient.connect({}, (frame) => {   
		console.log("Stomp Connected : ", frame);

		// 구독 & 핸들러 등록
		stompClient.subscribe("/topic", messageHandler);
		stompClient.subscribe("/foo/a", messageHandler);
		stompClient.subscribe("/foo/b", messageHandler);
		stompClient.subscribe("/foo/c", messageHandler);

		stompClient.subscribe("/notice/all", (message) => {
			console.log("전체공지 : ", message);
			const {body} = message;
			console.log(body);
			const {msg} = JSON.parse(body);
			console.log(msg);
			alert(`전체공지
---------------------------------
\${msg}
---------------------------------`);
		});
		stompClient.subscribe("/notice/${loginMember.id}", (message) => {
			console.log("개인공지 : ", message);
			const {body} = message;
			const {to, msg} = JSON.parse(body);
			alert(`\${to}님 개인공지
---------------------------------
\${msg}
---------------------------------`);
		});
	});

	
	$(sendBtn).click((e) => {
		const $message = $(message);

		const dest = $("#destination option:selected").val();
		console.log(dest);   // /app/a, /app/b, //topic
		stompClient.send(dest, {}, $message.val());
		$message.val(''); // 초기화
	});
	
    $(message).keyup((e) => {
    	if(e.keyCode == 13) {   // 13은 엔터키
   			$(sendBtn).trigger('click');   // click 핸들러 호출!(글쓰고 엔터키 치는것도 전송 버튼 클릭하는것과 같은 효과 나오게 한 것)
    	}
	});
	
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>