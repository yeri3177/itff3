<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="티켓나눔터" name="title"/>
</jsp:include>
<style>
/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}
</style>
<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/guide/guide.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<script>
function goBoardForm(){
	location.href = "${pageContext.request.contextPath}/sharing/boardForm.do";
}


$(() => {
	/**
	 * event bubbling 기반 핸들링
	 * tr 핸들링 > td발생 및 전파
	 */
	$("tr[data-no]").click((e) => {
		const $tr = $(e.target).parent("tr");
		const no = $tr.data("no");
		location.href = `${pageContext.request.contextPath}/sharing/boardDetail.do?no=\${no}`;
	});
});
</script>
<h1></h1>
<selection id="board-container" class="container">
	<table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th class="text-center">종류</th>
			<th class="text-center">제목</th>
			<th class="text-center">글쓴이</th>
			<th class="text-center">날짜</th>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr data-no="${board.no}">
				<td>${board.category}</td>
				<td>${board.title}</td>
				<td>${board.memberId}</td>
				<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd HH:mm"/></td>		
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="등록" id="btn-add" class="btn btn-outline-success" onclick="goBoardForm();"/>
	
	<br />
	<br />
	<br />
	${pagebar}
</selection>
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