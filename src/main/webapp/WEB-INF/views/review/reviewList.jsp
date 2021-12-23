<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>   
</jsp:include>
		
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardListCommon.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />		
		
<div class="ink_list ldn">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="List of Articles">
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
			<c:forEach items="${list}" var="review" varStatus="vs">
				<!-- LIST -->
				<tr>
					<td class="no text_en">${review.reviewNo}</td>																			
					<td class="list_left list_title">
						<div class="article_type">
							<span class="list_icon2 normal">normal</span>											
						</div>
						<div class="title_area">
							<a href="/movietalk/71790944?category=61633579" class="title_link">
							${review.reviewTitle}					
							</a>
						</div>
					</td>
					<td class="list_left list_author has_profile">
						<a href="#" class="member_51985530" onclick="return false">${review.memberId}</a>
					</td>
					<td class="date text_en"><span class="msover_date"><span class="ink_date">36분 전</span><span class="ink_time">14:00</span></span></td>																																																																																
					<td class="extra_col text_en"><span>513</span></td>																			
				</tr>
			</c:forEach>								
			<!-- //LIST -->
		</tbody>
	</table>
</div>		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>