<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/guide/guide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">마이페이지</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div class="">
	<p>회원이름 : ${member.name }</p>
	<p>내 포인트 : ${member.point }</p>
	<br />
	<ul>
		<li><a href="">예매내역</a></li>
		<li><a href="">장바구니</a></li>
		<li><a href="">상품 구매내역</a></li>
		<li><a href="${pageContext.request.contextPath }/member/memberWrittenBoardList.do">내가 쓴 게시글</a></li>
		<li><a href="">정보수정</a></li>
		<li><a href="${pageContext.request.contextPath }/member/memberSms.do">본인인증</a></li>
	</ul>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>