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

<fmt:requestEncoding value="utf-8" />
<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영화 리뷰" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board/boardListCommon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/reviewList.css" />


<section class="ink_board guest_mode">
	<div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/review/reviewList.do">영화리뷰</a>
		</h2>
	</div>
	<div class="list_wrap">
		<div class="list_buttons">
			<div class="fix">
				<ul>
					<li>
						<a class="has_bubble" href = "${pageContext.request.contextPath}/review/reviewForm.do"><i class="fas fa-pen"></i></a>
						<span class="ink_bubble bubble_left">글쓰기</span>
					</li>
				</ul>
			</div>
		</div>
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
						<th class="extra_col" scope="col">조회 수</th>
					</tr>
					<!-- /LIST HEADER -->
				</thead>
				<tbody class="">

					<!-- LIST -->
					<c:forEach items="${list}" var="review" varStatus="vs">
						<tr>
							<td class="no text_en">${review.reviewNo}</td>
							<td class="list_left list_title" style="display: flex;">
								<div class="article_type">
									<c:choose>
										<%-- 첨부파일 유무에 따라 다른 이미지 표시 --%>
										<c:when test="${review.attachCount eq 0}">
											<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 없음.png" style="position: relative; top: 3px;" alt="" /></span>
										</c:when>
										<c:otherwise>
											<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 있음.png" style="position: relative; top: 3px;" alt="" /></span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="title_area">
									<a href="${pageContext.request.contextPath}/review/reviewDetail.do?reviewNo=${review.reviewNo}"
										class="title_link"> ${review.reviewTitle}
									</a>
									<c:if test="${review.reviewCommentCount ne 0}">
										<a href="#" class="cmt_num updated">${review.reviewCommentCount}</a>
									</c:if>
								</div>
							</td>
							<td class="list_left list_author has_profile">
								<span class="inkpf round"></span> 
								<a href="#popup_menu_area" class="member_66300686" onclick="return false">${review.member.nickname}</a>
							</td>
							<td class="date text_en">
								<span class="ink_time"><fmt:formatDate value="${review.regDate}" pattern="MM-dd"/></span>
							</td>
							<td class="extra_col text_en">
								<span>${review.readCount}</span>
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
			<a class="ib ib2 ib_color bt_write" href="${pageContext.request.contextPath}/review/reviewForm.do" style="color: white"><i class="fas fa-pen"></i><span>글쓰기</span></a>
		</sec:authorize>	
	</div>
	<div class="ink_align_center"></div>
</section>
<div class="pagebar_footer">
	${pagebar}
	
</div>
<style>

</style>

<!-- </body> -->



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>