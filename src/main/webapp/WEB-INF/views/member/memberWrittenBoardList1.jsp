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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/member/memberWrittenList.css" />
	

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberProfile.do" target="_top">프로필사진변경</a></li>
			<li class="on_"><a href="#">예매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top" target="_top">장바구니</a></li>
			<li class="on_"><a href="#" target="_top">상품구매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberPoint.do" target="_top">포인트이용내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberWrittenReviewList.do" target="_top">내가쓴게시글</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberUpdate.do" target="_top">정보수정</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">내가 쓴 게시글</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->


<div class="mytmall_tab1 marT0">
	<ul>
		<li><a href="${pageContext.request.contextPath}/member/memberWrittenReviewList.do">내가 작성한 리뷰</a></li>
		<li class="on"><a href="${pageContext.request.contextPath}/member/memberWrittenBoardList.do">내가 작성한 티켓나눔</a></li>
	</ul>
</div>

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
	<br />
	<p>총 ${totalContent}개 </p>
	<br />
	<table id="tbl-board" class="table table-striped table-hover">
		<tr class="text-center">
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr class="text-center" data-no="${board.no}">
				<td>${board.no}</td>
				<td>${board.title}</td>
				<td><fmt:formatDate value="${board.regDate}" pattern="MM-dd"/> </td>
				<td>${board.readCount}</td>
			</tr>
		</c:forEach>
	</table>
	
	${pagebar }
	
	<br />
</section> 

<script>
const submitProcess = (name) => {
	$(devFrm)
		.attr("action", `${pageContext.request.contextPath}/member/\${name}.do?${_csrf.parameterName}=${_csrf.token}`)
		.submit();
};
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		