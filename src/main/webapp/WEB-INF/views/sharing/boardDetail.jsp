<%@page import="org.springframework.web.context.request.RequestContextListener"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="com.kh.spring.sharing.model.vo.Board"%>

<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAnonymous() || isAuthenticated()">

<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="티켓나눔터 상세보기" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath }/resources/css/board/sharingDetail.css" media="(min-width:380px) and (max-width:500px)"/> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />


<!-- // 	boolean editable = false; -->
<!-- // 	SecurityContext securityContext = SecurityContextHolder.getContext(); -->
<!-- // 	Authentication authentication = securityContext.getAuthentication(); -->
	
<!-- // 	Member loginMember = (Member) authentication.getPrincipal(); -->
<!-- // 	if(loginMember != null){ -->
<!-- // 		pageContext.setAttribute("loginMember", loginMember); -->
		
<!-- // 	 	Board board = (Board) request.getAttribute("board"); -->
<!-- // 		editable = loginMember != null && ( -->
<!-- // 						  loginMember.getId().equals(board.getMemberId()) -->
<!-- // 						  ); -->
<!-- // 	} -->


<%
	boolean editable = false;
	SecurityContext securityContext = SecurityContextHolder.getContext();
	Authentication authentication = securityContext.getAuthentication();
	System.out.println(authentication.getPrincipal());
	
	if(authentication.getPrincipal() != "anonymousUser"){
		Member loginMember = (Member) authentication.getPrincipal();
		pageContext.setAttribute("loginMember", loginMember);
		Board board = (Board) request.getAttribute("board");
		editable = loginMember != null && (
				loginMember.getId().equals(board.getMemberId())
				);
}
%>


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
		
			<input type="input" class="form-control" placeholder="제목" name="title" style = "text-align:center;"
				id="title" value="${board.title}                                                                                <fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd"/>" readonly required>
<%-- 			<input type="text" class="form-control" name="regDate" value='<fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd"/>' readonly required> --%>
				
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
					<div class="image-box">
						<img class="image-thumbnail"
							src="${pageContext.request.contextPath}/resources/upload/board/${attach.renamedFilename}"
							alt="" />					
					</div>
				</c:forEach>
				<br /> 
				


			</div>
			<br />

<sec:authorize access="isAuthenticated()">
<% 	if(editable){ %>	

			<%-- 작성자만 수정/삭제버튼이 보일수 있게 할 것 --%>
			<a href="javascript:goUpdateBoard();" 
					class="btn btn-outline-success">수정하기</a>&nbsp&nbsp&nbsp&nbsp
			<a href="javascript:goDeleteBoard();" 
					class="btn btn-outline-success">삭제하기</a>&nbsp&nbsp&nbsp&nbsp
					
<% 	} %>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="javascript:goUpdateBoard();" 
					class="btn_brd_edit btn btn-xs btn-secondary">수정하기</a>&nbsp&nbsp&nbsp&nbsp
				<a href="javascript:goDeleteBoard();" 
					class="btn_brd_del btn btn-xs btn-secondary">삭제하기</a>&nbsp&nbsp&nbsp&nbsp	
			</sec:authorize>
</sec:authorize>
			<input type="button" value="목록보기" id="btn-add" class="btn btn-outline-success" onclick="goBoardList();"/>
			<br />
			<br />
			<br />
			<br />
			<br />
		</div>
		<br />
	</div>
</div>

<script type="text/javascript">

function goBoardList() {
	location.href = `${pageContext.request.contextPath}/sharing/boardList.do`;
};


function goUpdateBoard() {
	const boardNo = $("[name=no]").val();
	console.log("boardNo = ", boardNo);
	location.href = `${pageContext.request.contextPath}/sharing/boardUpdate.do?no=\${boardNo}`;
}

function goDeleteBoard() {
	var delBoard = confirm("게시글을 삭제하시겠습니까?");
	if(delBoard) {
		const boardNo = $("[name=no]").val();
		console.log("boardNo = ", boardNo);
		location.href = `${pageContext.request.contextPath}/sharing/boardDelete.do?no=\${boardNo}`;
	}
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</sec:authorize>
