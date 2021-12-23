<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib은 공유되지 않으니 jsp마다 작성할 것 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	SecurityContext securityContext = SecurityContextHolder.getContext();
	Authentication authentication = securityContext.getAuthentication();
	Member loginMember = (Member) authentication.getPrincipal();
	pageContext.setAttribute("loginMember", loginMember);
%>

<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항 상세보기" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board/sharingDetail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

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

<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">티켓나눔터</h2>
	</div>
</div>

<div class="board">
	<div id="board-container" class="mx-auto text-center">
		<input type="hidden" name="no" value="${board.no}"
			id="boardNo" />
		<div class="sharingDetail">
			
			<input type="text" class="form-control" placeholder="제목" name="title"
				id="title" value="${board.title}" readonly required><input
				type="text" class="form-control" name="regDate"
				value='<fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd"/>' readonly required>
				
<!-- 			<div class="buttons"> -->
<%-- 				<c:forEach items="${board.attachments}" var="attach" varStatus="vs"> --%>
<!-- 					<button type="button" -->
<!-- 						class="btn btn-outline-success btn-block attach" -->
<%-- 						value="${attach.attachNo}">${attach.originalFilename}</button> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->

				
			<div class="form-control" name="content" placeholder="내용" required>
			
				<br /><br />
				<p>${board.content} </p>
				<br /><br />
				<c:forEach items="${board.attachments}" var="attach" varStatus="vs">
					<img
						src="${pageContext.request.contextPath}/resources/upload/board/${attach.renamedFilename}"
						alt="" />
				</c:forEach>
				<br /> 
				
			</div>
			<br /><br /><br />
			<input type="button" value="목록으로 돌아가기" id="btn-add" class="btn btn-outline-success" onclick="goBoardList();"/>
		</div>
	</div>
</div>


<div class="admin_check">
	<c:set var="author" value="${loginMember.authorities}" />
	<c:forEach var="a" items="${author}" varStatus="status">
		<c:if test="${a eq 'ROLE_ADMIN'}">
			<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="btn_group_right">
						<a href="javascript:OnBoardUpdate();"
							class="btn_brd_edit btn btn-xs btn-secondary">수정</a> <a
							href="javascript:OnBoardRemove();"
							class="btn_brd_del btn btn-xs btn-secondary">삭제</a>
					</div>
				</sec:authorize>
			</sec:authorize>
		</c:if>
	</c:forEach>
</div>


<script>

// $(".attach").click((e) => {
// 	const no = $(e.target).val();
// 	console.log(no);
// 	location.href =`${pageContext.request.contextPath}/board/fileDownload.do?no=\${no}`;
// });

function goBoardList() {
	location.href = `${pageContext.request.contextPath}/sharing/boardList.do`;
};

function OnBoardUpdate() {
	const boardNo = $("[name=no]").val();
	console.log("boardNo = ", boardNo);
	location.href = `${pageContext.request.contextPath}/sharing/boardUpdate.do?no=\${boardNo}`;
}


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

