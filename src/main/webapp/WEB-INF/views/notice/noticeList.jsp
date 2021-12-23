<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page
	import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib은 공유되지 않으니 jsp마다 작성할 것 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%-- <%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%> --%>

<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board/boardListCommon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<script>

function goBoardForm(){
	location.href = "${pageContext.request.contextPath}/notice/noticeForm.do";
}

$(() => {
	/**
	 * event bubbling 기반 핸들링
	 * tr 핸들링 > td발생 및 전파
	 */
	$("tr[data-no]").click((e) => {
		//console.log(e.target);
		//console.log($(e.target).data("no"));
		const $tr = $(e.target).parents("tr");
		const no = $tr.data("no");
		location.href = `${pageContext.request.contextPath}/notice/noticeDetail.do?no=\${no}`;
	});
});
</script>
<sec:authorize access="isAnonymous() || isAuthenticated()">

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="#" target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="#" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="#" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->
<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">공지사항</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<section id="board-container" class="cont">

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<input type="button" value="글쓰기" id="btn-add"
			class="btn btn-outline-success" onclick="goBoardForm();" />
	</sec:authorize>

	<table id="tbl-board" class="table table-striped table-hover">
		<tr style="display: none">
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="notice" items="${noticeList}" varStatus="vs">
			<tr data-no="${notice.noticeNo}" class="brd_li">
				<td>${notice.noticeTitle}</td>
				<td><fmt:formatDate value="${notice.regDate}"
						pattern="yyyy/MM/dd" /></td>
			</tr>
		</c:forEach>
	</table>
	<div class="pagenation">${pagebar}</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</sec:authorize>