<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page
	import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board/boardListCommon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/reviewList.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberWrittenList.css" />

<fmt:requestEncoding value="utf-8" />
<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="내가 쓴 게시글" name="title" />
</jsp:include>

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberProfile.do" target="_top">프로필사진변경</a></li>
			<li class="on_"><a href="#">예매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top" target="_top">장바구니</a></li>
			<li class="on_"><a href="#" target="_top">상품구매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberPoint.do" target="_top">포인트이용내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberWrittenReviewList.do" target="_top">내가 쓴 게시글</a></li>
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

<section class="ink_board guest_mode">
	<div class="bd_header">
		<h2 class="bd_title">
				<%-- <form
					id="devFrm"
					name = "searchFrm">
					<input type="hidden" name="searchType" value="pCategory"/>
					<label><input type="radio" name="searchBoard" value="리뷰게시판" onclick="submitProcess('memberWrittenReviewList');" checked <c:if test="${searchBoard eq '리뷰게시판' }">checked</c:if> > 리뷰게시판 </label>
					<label><input type="radio" name="searchBoard" value="티켓나눔터" onclick="submitProcess('memberWrittenBoardList');"  <c:if test="${searchBoard eq '티켓나눔터' }">checked</c:if>> 티켓나눔터 </label>
				</form> --%>
			
			<%-- <br />
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			
			<a href="#">네티즌 리뷰 (총 ${totalContent }개 )</a> --%>
			
		</h2>
	</div>
	<div class="list_wrap">
		<div class="ink_list ldn">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				summary="List of Articles">
				<thead>
					<!-- LIST HEADER -->
					<tr>
						<th class="no" scope="col">번호</th>
						<th scope="col" class="title">제목</th>
						<th scope="col">글쓴이</th>
						<th class="date" scope="col">날짜</th>
						<th class="extra_col" scope="col">조회수</th>
					</tr>
					<!-- /LIST HEADER -->
				</thead>
				<tbody class="">

					<!-- LIST -->
					<c:forEach items="${list}" var="board" varStatus="vs">
						<tr>
							<td class="no text_en">${board.no}</td>
							<td class="list_left list_title" style="display: flex;">
								<div class="article_type">
									<c:choose>
										<%-- 첨부파일 유무에 따라 다른 이미지 표시 --%>
										<c:when test="${board.attachCount eq 0}">
											<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 없음.png" style="position: relative; top: 3px;" alt="" /></span>
										</c:when>
										<c:otherwise>
											<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 있음.png" style="position: relative; top: 3px;" alt="" /></span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="title_area">
										<a href="${pageContext.request.contextPath}/sharing/boardDetail.do?no=${board.no}"
											class="title_link"> ${board.title}
										</a>
								</div>
							</td>
							<td class="list_left list_author has_profile" style="text-align:center;">
								<a href="#popup_menu_area" class="member_66300686" onclick="return false">${board.memberId }</a>
							</td>
							<td class="date text_en">
								<span class="ink_time"><fmt:formatDate value="${board.regDate}" pattern="MM-dd"/></span>
								
							</td>
							<td class="extra_col text_en">
								<span>${board.readCount}</span>
							</td>
						</tr>
					</c:forEach>
					<!-- <tr>
						<td class="no text_en">53972</td>
						<td class="list_left list_title">
							<div class="article_type">
								<span class="list_icon2 image"></span>
							</div>
							<div class="title_area">
								<a href="/movietalk/71816953?category=61633579"
									class="title_link"> 킹스맨: 퍼스트 에이전트 짧은 후기 </a> <a
									href="/movietalk/71816953?category=61633579#comment"
									class="cmt_num updated">1</a>
							</div>
						</td>
						<td class="list_left list_author has_profile"><span
							class="inkpf round"></span> <a href="#popup_menu_area"
							class="member_56947472" onclick="return false"><img
								src="https://extmovie.com/modules/point/icons/xeicon_coa/10.gif"
								alt="[레벨:10]" title="포인트:10783point (94%), 레벨:10/99"
								class="xe_point_level_icon"
								style="vertical-align: middle; margin-right: 3px;">자구자구</a></td>
						<td class="date text_en"><span class="msover_date"><span
								class="ink_date">39분 전</span><span class="ink_time">00:31</span></span></td>
						<td class="extra_col text_en"><span>189</span></td>
					</tr>
				

					<!-- //LIST -->
				</tbody>
			</table>
		</div>
	
	</div>
	<div class="bt_area bt_left clearfix">
		<sec:authorize access="isAuthenticated()">
			<a class="ib ib2 ib_color bt_write" href="${pageContext.request.contextPath}/sharing/boardForm.do" style="color: white"><i class="fas fa-pen"></i><span>글쓰기</span></a>
		</sec:authorize>	
	</div>
	<div class="ink_align_center"></div>
</section>
<div class="pagebar_footer">
	${pagebar}
	
</div>


<!-- 페이지 제일 위로 가는 버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<script>
//페이지 제일 위로 가는 버튼
//Get the button:
mybutton = document.getElementById("myBtn");

//When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	  mybutton.style.opacity = 1;
	} else {
	  mybutton.style.opacity = 0;
	}
}

//When the user clicks on the button, scroll to the top of the document
function topFunction() {
document.body.scrollTop = 0; // For Safari
document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
</script>

<script>
const submitProcess = (name) => {
	$(devFrm)
		.attr("action", `${pageContext.request.contextPath}/member/\${name}.do?${_csrf.parameterName}=${_csrf.token}`)
		.submit();
};
</script>


<!-- </body> -->



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>