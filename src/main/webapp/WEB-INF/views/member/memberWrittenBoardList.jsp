<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/guide/guide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">내가 쓴 게시글</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
<style>
/*글쓰기버튼*/
input#btn-add{float:right; margin: 0 0 15px;}
</style>
<script>
function goBoardForm(){
	location.href = "${pageContext.request.contextPath}/board/boardForm.do";
}

$(() => {
	/**
	 *	event bubbling 기반 핸들링
	 *	tr 핸들링 > td발생 및 전파
	 */
	$("tr[data-no]").click((e) => {
		//console.log(e.target);
		//console.log($(e.target).data("no"));
		const $tr = $(e.target).parents("tr");
		const no = $tr.data("no");
		location.href = `${pageContext.request.contextPath}/board/boardDetail.do?no=\${no}`;
	});
});
</script>
<section id="board-container" class="container">
	<p>총 ${totalContent}개의 게시물이 있습니다.</p>
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goBoardForm();"/>
	<table id="tbl-board" class="table table-striped table-hover">
		<tr class="text-center">
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th> <!-- 첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr class="text-center" data-no="${board.no}">
				<td>${board.no}</td>
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
				<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd HH:mm"/> </td>
				<td class="text-center">
					<c:if test="${board.attachCount gt 0}">
						<img src="${pageContext.request.contextPath}/resources/images/file.png" alt="" width="16px"/>
					</c:if>
				</td>
				<td>${board.readCount}</td>
			</tr>
		</c:forEach>
	</table>
	
	${pagebar }
</section> 




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		