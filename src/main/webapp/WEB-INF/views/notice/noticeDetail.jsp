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
	<jsp:param value="공지사항 상세보기" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board/noticeDetail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<sec:authorize access="isAnonymous() || isAuthenticated()">

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/review/reviewList.do" target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/questionList.do" target="_top">1:1 문의</a></li>
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

<div class=noticeDetail2>
	<div id="board-container" class="mx-auto text-center">
		<input type="hidden" name="no" value="${notice.noticeNo}"
			id="noticeNo" />
		<div class="noticeDetail">
			<input type="text" class="form-control" placeholder="제목" name="title"
				id="title" value="${notice.noticeTitle}" required> <input
				type="text" class="form-control" name="regDate"
				value='<fmt:formatDate value="${notice.regDate}" pattern="yyyy.MM.dd"/>'>

			<div class="buttons">
				<c:forEach items="${notice.attachments}" var="attach" varStatus="vs">
					<button type="button"
						class="btn btn-outline-success btn-block attach"
						value="${attach.attachNo}">${attach.originalFilename}</button>
				</c:forEach>
			</div>

			<div class="form-control" name="content" placeholder="내용" required>
				<br />
				<c:forEach items="${notice.attachments}" var="attach" varStatus="vs">
					<img
						src="${pageContext.request.contextPath}/resources/upload/notice/${attach.renamedFilename}"
						alt="" />
				</c:forEach>
				<br /> ${notice.noticeContent}
			</div>
			
			


			<div class="brd_view_btm">
				<div class="btn_group">
					<a href="javascript:OnBoardList();" class="btn_page_list">목록</a>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="admin_btn_group">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="btn_group_right">
			<a href="javascript:OnBoardUpdate();"
				class="btn_brd_edit btn btn-xs btn-secondary">수정</a> <a
				href="javascript:OnBoardRemove();"
				class="btn_brd_del btn btn-xs btn-secondary">삭제</a>
		</div>
	</sec:authorize>
</div>


<script type="text/javascript">

$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/notice/fileDownload.do?no=\${no}`;
});

function OnBoardList() {
	location.href = `${pageContext.request.contextPath}/notice/noticeList.do`;
};

function OnBoardUpdate() {
	const noticeNo = $("[name=no]").val();
	console.log("noticeNo = ", noticeNo);
	location.href = `${pageContext.request.contextPath}/notice/noticeUpdate.do?no=\${noticeNo}`;
}

function OnBoardRemove() {
	var delConfirm = confirm("정말로 삭제하시겠습니까?");
	if(delConfirm) {
		const noticeNo = $("[name=no]").val();
		console.log("noticeNo = ", noticeNo);
		location.href = `${pageContext.request.contextPath}/notice/noticeDelete.do?no=\${noticeNo}`;
	}
	
}


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</sec:authorize>
