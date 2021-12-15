<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="관리자와 Chat" name="title"/>
</jsp:include>
<div class="input-group mb-3">
  <input type="text" id="message" class="form-control" placeholder="Message...">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>
<div>
	<ul class="list-group list-group-flush" id="data">
		<!-- 이전 채팅로그 불러와서 출력. list가 비었으면 forEach가 작동하지 않으므로 c if는 적어도 되고 안 적어도 된다.  -->
		<c:if test="${not empty list}">   
			<c:forEach items="${list}" var="chatLog" varStatus="vs">
				<li class="list-group-item">${chatLog.memberId} : ${chatLog.msg}</li>
			</c:forEach>
		</c:if>
	</ul>
</div>

<script>
//  /chat/chat_c39pc6AsVI40I5o 구독
// 1. Stomp Client 객체 생성(websocket)
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
const stompClient = Stomp.over(ws);

// 2. 연결 요청
stompClient.connect({}, (frame) => {   
	console.log("Stomp Client Connected : ", frame);

	// 3. 구독 요청
	stompClient.subscribe("/chat/${chatId}", (message) => {
		console.log("message : ", message);
		const obj = JSON.parse(message.body);
		console.log(obj);
		const {memberId, msg} = obj;
		$(data).append(`<li class="list-group-item">\${memberId} : \${msg}</li>`);
	});
});


$(sendBtn).click((e) => {
	if(!$(message).val()) return;   // 유효성 검사. 아무것도 입력하지 않았으면 제출안됨
	
	const obj = {
		chatId : "${chatId}",
		memberId : "${loginMember.id}",
		msg : $(message).val(),
		logTime : Date.now()
	};
	console.log(obj);
	stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj));
	$(message).val('');  // #message 초기화
});


// 엔터키 쳐도 전송되도록 하기
$(message).keyup((e) => {
	if(e.keyCode == 13) {   // 13은 엔터키
		$(sendBtn).trigger('click');   // click 핸들러 호출!(글쓰고 엔터키 치는것도 전송 버튼 클릭하는것과 같은 효과 나오게 한 것)
	}
});


<%-- 
이전 채팅로그 불러오는걸 로드시 실행되는 함수로 하려고 했는데 chatLog에 memberId 없다고만 나온다. 그래서 위에 스크립트 밖에 쓰니까 된다.
$(document).ready(function() {
	<c:if test="${not empty list}">
		console.log(${list});
		<c:forEach items="{list}" var="chatLog" varStatus="vs">
			$(data).append(`<li class="list-group-item">${chatLog.memberId} : ${chatLog.msg}</li>`);
		</c:forEach>
	</c:if>
}); 
--%>

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
