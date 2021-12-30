<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="티켓나눔터" name="title"/>
</jsp:include>

<%
boolean editable = false;
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
System.out.println(authentication.getPrincipal());

if(authentication.getPrincipal() != "anonymousUser"){
	Member loginMember = (Member) authentication.getPrincipal();
	editable = loginMember != null;
}
%>

<style>
/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board/board.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />	
	
<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />
<script>
function goBoardForm(){
	location.href = "${pageContext.request.contextPath}/sharing/boardForm.do";
}

$(() => {
	/**
	* event bubbling 기반 핸들링
	* tr > td 
	*/
	$("tr[data-no]").click((e) => {
		//console.log(e.target);
		//console.log($(e.target).data("no"));
		const $tr = $(e.target).parents("tr");  // 부모중에 tr태크를 찾아주세요.
		const no = $tr.data("no");
		location.href = `${pageContext.request.contextPath}/sharing/boardDetail.do?no=\${no}`; // '\' 사용한 이유: el이 아니라 javascript $라는 걸 표시하기 위해서.
	});
})
</script>


	
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a 
				href="${pageContext.request.contextPath }/review/reviewList.do" 
				target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav -->
<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">티켓나눔터</h2>
	</div>
</div>

<section id="board-container" class="container">
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th class="text-center">종류</th>
			<th class="text-center">제목</th>
			<th class="text-center">글쓴이</th>
			<th class="text-center">날짜</th>
		</tr>
				<!-- <td><span class="badge badge-\${board.category == 'P' ? 'danger' : (board.category == 'S' ? 'primary')}"></span></td> -->
		<c:forEach items="${list}" var="board">
			<tr data-no="${board.no}">
				<td>
					<span class="badge badge-${board.category == 'P' ? 'danger' : (board.category == 'S' ? 'primary' : 'secondary') }">
						<c:choose>
							<c:when test="${board.category == 'P'}">티켓구함</c:when>
							<c:when test="${board.category == 'S'}">티켓양도</c:when>
							<c:otherwise>티켓교환</c:otherwise>
						</c:choose>
					</span>
				</td>
				<td>${board.title}</td>
				<td>${board.memberId}</td>
				<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd HH:mm" /></td>		
			</tr>
		</c:forEach>
	</table>
<% 	if(editable){ %>	
		<input type="button" value="등록" id="btn-add" class="btn btn-outline-success" onclick="goBoardForm();"/>
<% 	} %>
	<br />
	<br />
	<br />
	${pagebar}
</section>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>