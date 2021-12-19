<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/member/memberEnroll.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/footer.css" />
	
<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<div class="join">
	<div class="container">
<h2 class="tit_sec txt-center txt-white">회원가입</h2>

<div class="content_wrap join_complete">
	<div class="join_complete_wrap">
		<div class="join_Complete">			
			<div class="speechBubble">
			<div>
				<strong class="point"> 회원가입이 완료되었습니다.</strong> 
			</div>
			<div class="info1">
				<span>온라인 티켓 예매, 잇프 굿즈 구입, 티켓 나눔터<br />
				상영작 출품, 프로젝트 지원 등의 서비스를 이용하실 수 있습니다.</span>
			</div>
			<div class="info2">
				<span>새로움과 도전, 그리고 열정으로 가득한<br />
				ITFF에 오신 것을 환영합니다.</span>
			</div>
			</div>
		</div>
			<div class="homeBtn">
				<a href="${pageContext.request.contextPath}" class="goHome"> <span> < 홈으로 가기</span>
				</a>
			</div>
	</div>
</div>
</div>
</div>
<!-- //container -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>