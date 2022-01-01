<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/chat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminChat.css">

<!DOCTYPE html>

<style>
table.table th, table.table td {text-align: center;}
</style>

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

	<table id="chatList" class="table">
	  <thead>
	    <tr>
	      <th scope="col">회원아이디</th>
	      <th scope="col">메세지</th>
	      <th scope="col">안읽은 메세지</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach items="${list}" var="chatLog">
		  	<tr id="${chatLog.chatId}" data-chat-id="${chatLog.chatId}" data-member-id="admin">
		  		<td>${chatLog.memberId}</td>
		  		<td class="msg">${chatLog.msg}</td>
		  		<td>
		  			<span class="unread-count badge badge-danger ${chatLog.unreadCount eq 0 ? 'd-none' : ''}">${chatLog.unreadCount}</span>
		  		</td>
		  	</tr>
	  	</c:forEach>
	  </tbody>
	</table>
	
		<!-- chat modal -->
		<div class="modal fade" id="chat" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document"
				style="max-width: 500px;">
				<div class="modal-content" style="text-align: left;">
				   	<div class="modal-body" id="modal_ajax1">
				    		  
					</div>

					</div>
				</div>
			</div>

<script>

// websocket 연결(SockJS)
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);

// StompClient객체 생성
const stompClient = Stomp.over(ws);

// connect
stompClient.connect({}, (frame) => {
	
	// 구독신청 및 핸들러 등록
	stompClient.subscribe("/chat/admin", (message) => {
		console.log("message : ", message);
		
		// type속성으로  MESSAGE(chatLog), LAST_CHECK을 구분한다.
		const obj = JSON.parse(message.body);
		console.log(obj);
		
		const {chatId, memberId, msg, type} = obj;
		
		const $tr = $(`#\${chatId}`);
		const $unreadCountSpan = $tr.find("span.unread-count");
		
		switch(type){
		
			case "LAST_CHECK" : 
				$unreadCountSpan.text(0).addClass("d-none");
				break;
				
			case "MESSAGE" : 
				const $msgTd = $tr.children(".msg");
				$msgTd.text(msg); // td.msg 갱신
				// 1.관리자메세지 : 처리없음
				// 2.사용자메세지 : 안읽음메세지 +1 
				
				if(memberId != 'admin'){
					const unreadCountVal = Number($unreadCountSpan.text()) + 1;
					$unreadCountSpan.text(unreadCountVal).removeClass("d-none");
				}
				
				$tr.prependTo($("#chatList tbody")); // 첫번째 자식요소로 추가(이동)
				
				break;
		}
		
	});	
});

$("tr[id]").click((e) => {
	const $tr = $(e.target).parent("tr");
	const chatId = $tr.attr("id");
	const memberId = $tr.data("memberId"); // getter camelcasing으로 참조하기
	console.log(chatId, memberId);
	
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/"+chatId+"/"+memberId+"/chat.do",
			method: "get",
			contentType: "application/json",
			dateType: "text",
			success: function(data) {
				$("#modal_ajax1").html(data);
			},
			complete: function() {
				console.log("complete")
			}
		});

	$('#chat').modal() 

});

</script>

<script>

const $messages = $('#messages');
$messages.scrollTop($messages[0].scrollHeight);

</script>

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>