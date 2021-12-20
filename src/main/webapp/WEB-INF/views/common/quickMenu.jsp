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

<div class="quickmenu_wrap">

	<div class="btn_floating active">
		<button class="quickmenu_control_txt"><span class="ir_pm">QUICK Menu</span></button>
		<button class="quickmenu_control_icon"><span>x</span></button>
	</div>

	<div class="btn_floating">
		<button class="quickmenu_control_txt"><span class="ir_pm">QUICK Menu</span></button>
		<button class="quickmenu_control_icon"><span>x</span></button>
	</div>
	

	<div id="quickmenu_box" class="quickmenu_box">
		<ul id="quickmenu" class="quickmenu">
		
			
			<!-- 퀵메뉴 어떤거 넣을지는 나중에 생각해보자 -->
			<li class="quick_online"><a href="#" target="_blank">온라인상영안내</a></li> 
			<li class="quick_check"><a href="#">예매권 확인</a></li>
			<li class="quick_tica"><a href="#" target="_blank">티켓카탈로그</a></li>
			<li class="quick_faq"><a href="#">1:1 문의</a></li>
			<li class="quick_chant"><a onclick="window.open('${pageContext.request.contextPath}/common/chat.do','ITFF Chat','width=450,height=690,top=100,location=no,status=no,scrollbars=yes');">챗봇</a></li>
			<li class="quick_kakao"><a href="#" target="_blank">카카오톡</a></li>
		</ul>
		<a href="#" target="_blank"></a>
	</div>
	<a href="#" target="_blank"></a>
	</div>

<script>
	
$(document).ready(function() {	
	$(".btn_floating").on("click", function (e) {
		
		$(".btn_floating").toggleClass("active");;
		$("#quickmenu_box").toggleClass("on");;

	});
});

</script>