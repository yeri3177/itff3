<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />	
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="관리자Chat" name="title"/>
</jsp:include>
<style>
	table.table th, table.table td {text-align: center;}
</style>
<table id="chatList" class="table">
  <thead>
    <tr>
      <th scope="col">회원아이디</th>
      <th scope="col">메세지</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list}" var="chatLog" varStatus="vs">
  		<tr id="${chatLog.chatId}" data-chat-id="${chatLog.chatId}" data-member-id="${chatLog.memberId}">
  			<td>${chatLog.memberId}</td>
  			<td class="msg">${chatLog.msg}</td>
  		</tr>
  	</c:forEach>
  </tbody>
</table>
<script>
// 1. websocket 연결(SockJS)
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);

// 2. Stomp Client 객체 생성(websocket)
const stompClient = Stomp.over(ws);

// 3. 연결 요청 ({}는 헤더, frame은 콜백함수)
stompClient.connect({}, (frame) => {
	console.log("Stomp Clinet Connected : ", frame);
	
	// 4. 구독 요청 및 핸들러 등록. 위의 connect 안에 써야한다.
	stompClient.subscribe("/chat/admin", (message) => {
		console.log("message : ", message);
		const obj = JSON.parse(message.body);
		console.log(obj);
		const {chatId, memberId, msg} = obj;
		
		const $tr = $(`#\${chatId}`);
		console.log($tr);
		const $msgTd = $tr.children(".msg");
		console.log($msgTd);
		$msgTd.text(msg);   // td.msg 갱신
		
		$tr.prependTo($("#chatList tbody"));   // 첫번째 자식요소로 추가(기존에 있는 요소로 append prepend같은거 하면 이동되는 효과)
	});
});


$("tr[id]")
.click((e) => {
	const $tr = $(e.target).parent("tr");
	const chatId = $tr.attr("id");
	const memberId = $tr.data("memberId");   // getter camelcasing으로 참조하기
	console.log(chatId, memberId);
	
	// 팝업요청
	const url = `${pageContext.request.contextPath}/admin/\${chatId}/\${memberId}/chat.do`;
	const name = chatId;   // 팝업창 Window 객체의 name
	const spec = "width=500px, height=500px";
	open(url, name, spec);
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>