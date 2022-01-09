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

<div class="movie_infor new2020" style="border-bottom: 0">
	<span class="thm">
		<img src="${pageContext.request.contextPath}/resources/upload/poster/${oneMovie.image}" alt="" style="width: 250px;">
	</span>
	<strong class="tit" style="margin-left: 0">
		<span class="ic_grade gr_${oneMovie.ageLimit}" style="position: relative; bottom: 2px;"></span>&nbsp;${oneMovie.titleKor}
	</strong>
	<dl class="dlist_infor" style="margin-left: 0; line-height: 20px;">
		<dt>개봉일</dt>
		<dd style="left: 30px;"><fmt:formatDate value="${oneMovie.openingDate}" pattern="yyyy-MM-dd"/></dd>
		<dt>감독</dt>
		<dd style="left: 30px;">${oneMovie.director}</dd>
		<dt>출연</dt>
		<dd style="left: 30px; width: 240px;">${oneMovie.actors}</dd>
		<dt>장르</dt>
		<dd style="left: 30px;">${oneMovie.genre}</dd>
		<dt>상영시간</dt>
		<dd>${oneMovie.runningTime}</dd>
		<dt>시놉시스</dt>
		<dd style="width: 238px;" id="synopsis">${oneMovie.description}</dd>
		<dt></dt>
		<dd style="margin-left: 11px;"><a href="">더보기</a></dd>
	</dl>
</div>
