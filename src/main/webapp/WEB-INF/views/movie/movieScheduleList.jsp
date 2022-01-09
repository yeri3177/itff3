<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page	import="org.springframework.security.core.context.SecurityContext"%>
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->

<c:if test="${empty list}">
	<div class="bx_notice"><p>조회 가능한 상영시간이 없습니다.</p><p>조건을 변경해주세요.</p></div>
</c:if>
<c:if test="${not empty list}">
	<c:forEach items="${list}" var="movie" varStatus="vs">
		<div class="group_time_select">
			<div class="time_select_tit">
				<span class="ic_grade gr_${movie.ageLimit}">${movie.ageLimit}</span><strong>${movie.titleKor}</strong>
			</div>
			<div class="time_select_wrap timeSelect">
				<ul class="list_time">
					<c:forEach items="${movie.schedules}" var="schedule" varStatus="vs2">
						<li class="">
							<sec:authorize access="isAuthenticated()">
								<%-- <c:set var="loginMemberId">
								    <sec:authentication property="principal.id"/>
								</c:set> --%>
								<a role="button" href="#none" onclick="selectSeats('${schedule.movieScheduleId}', '${schedule.movieId}');">
								<!-- <span class="txt_ntc ic">조조</span> -->
									<dl>
										<dt>상영시간</dt>
										<dd class="time">
											<strong>${schedule.startTime}</strong>
											<div class="tooltip">종료 11:10</div>
										</dd>
										<dt>잔여석</dt>
										<dd class="seat">
											<strong>${schedule.availableSeats}</strong> / ${schedule.maxSeat}
										</dd>
										<dt>상영관</dt>
										<dd class="hall">${schedule.theaterId}관</dd>
									</dl>
								</a>
							</sec:authorize>
							<!-- 로그인 안 한 경우 -->
							<sec:authorize access="isAnonymous()">
								<a role="button" href="#none" onclick="loginplz();">
								<!-- <span class="txt_ntc ic">조조</span> -->
									<dl>
										<dt>상영시간</dt>
										<dd class="time">
											<strong>${schedule.startTime}</strong>
											<div class="tooltip">종료 11:10</div>
										</dd>
										<dt>잔여석</dt>
										<dd class="seat">
											<strong>${schedule.availableSeats}</strong> / ${schedule.maxSeat}
										</dd>
										<dt>상영관</dt>
										<dd class="hall">${schedule.theaterId}관</dd>
									</dl>
								</a>
							</sec:authorize>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:forEach>
</c:if>

<script>
// 로그인 하지 않은 경우 상영일정 클릭하면 alert 띄우고 로그인 페이지로 이동시킴
function loginplz() {
	alert("로그인이 필요한 서비스입니다.");
	window.location.href="${pageContext.request.contextPath}/member/memberLogin.do";
}


function selectSeats(scheduleId, movieId) {
	/* console.log(memberId); */
	console.log(scheduleId);
	console.log(movieId);
	
	$("#reserveStep02").show();
	$("#step01").removeClass("active");
	$("#step01").addClass("prev");
	
	$("#step02").removeClass("disabled");
	$("#step02").addClass("active");
	
	$.ajax ({
		url: "${pageContext.request.contextPath}/movie/selectSeats.do",
		data: {
			scheduleId : scheduleId,
			movieId : movieId
		  },
		method: "GET", 
		contentType: "application/json",
		success: function(data) {
			$("#reserveStep02").html(data);
			
		},
		complete: function() {
			console.log("complete")
		}	
	});
}

</script>