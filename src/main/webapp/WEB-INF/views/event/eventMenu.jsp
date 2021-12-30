<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/event/eventMenu.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">이벤트</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->



<div class="container" style="padding-bottom: 100px;"> 

<div class="tab-menu line red">
	<a href="${pageContext.request.contextPath}/event/eventMenu.do" class="active"><span>진행중 이벤트</span></a>
	<a href="/promotion/event/eventEndList.do"><span>종료 이벤트</span></a>
</div>

	<div class="row mt50">
		<div class="col-md-12 col-xs-12 evt_flex">
			<div class="col-md-6 col-xs-12 ">
				<div class="border_box2_out">
				<div class="border_box2" onclick="location.href='${pageContext.request.contextPath}/event/eventRoulette.do?id=${loginMember.id }';">			
				<div class="evt-imgbox">
					<img src="https://i.imgur.com/eowfADG.jpg">	
				</div>

				<div class="col-md-12 col-xs-12">
					<div class="evt-txtbox">
						<p class="evt-tit">[JUST ENJOY!]</p>
						<p class="evt-loc">하루에 단 한번만 즐길 수 있는 룰렛이벤트!</p>
						<span class="txt-date">2021.12.29 ~ 2022.1.14</span>
					</div>
				</div>
				</div>
				</div>
			</div>

			<div class="col-md-6 col-xs-12 ">
				<div class="border_box2_out">
				<div class="border_box2" onclick="location.href='${pageContext.request.contextPath}/event/eventOffline.do';">			
				<div class="evt-imgbox">
					<img src="https://i.imgur.com/7NMBjZ6.jpg">	
				</div>

				<div class="col-md-12 col-xs-12">
					<div class="evt-txtbox">
						<p class="evt-tit">[관객이벤트] </p>
						<p class="evt-loc">SF 키워드로 컨셉친(concept+親)하라!</p>
						<span class="txt-date">2022.1.7 ~ 2022.1.14</span>
					</div>
				</div>
				</div>
				</div>
			</div>
		</div>

		</div>

	</div>
	
<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>