<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/quickMenu.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<div>
<span class="btn_tica">
			
	<a data-toggle="modal" data-target="#chat" onclick="chat_btn();" class="wviewT">
	<img src="https://i.imgur.com/DmuXppF.png" title="챗봇" class="quick_img">
	</a>
	
	<a href="${pageContext.request.contextPath }/movie/booking.do" class="wviewT">
	<img src="https://i.imgur.com/nM5ACcZ.png" title="티켓 예매 바로가기" class="quick_img">
	</a>
	
	<a href="${pageContext.request.contextPath }/member/memberMovieReservation.do" class="wviewT">
	<img src="https://i.imgur.com/QhnGPsj.png" title="예매내역 확인하기" class="quick_img">
	</a>

</span>
<span>
	<a href="#" class="btn_top" onclick="scroll_top();"></a>
</span>
</div>

<script>

function scroll_top() {
	$('html, body').animate({scrollTop : 0},800);
}


</script>

<script>
	
$(document).ready(function() {	
	$(".btn_floating").on("click", function (e) {
		
		$(".btn_floating").toggleClass("active");;
		$("#quickmenu_box").toggleClass("on");;

	});
});

</script>

<script>

function chat_btn() {

	$.ajax({
		url:"${pageContext.request.contextPath}/common/chat.do",
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
}
</script>
