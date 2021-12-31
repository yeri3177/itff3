<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.spring.goods.model.vo.Goods"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:forEach items="${list }" var="list">
	<li>
		<a href="${pageContext.request.contextPath}/notice/noticeDetail.do?no=${list.noticeNo}"> 
			<span class="date en"><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></span> 
			<span class="brd_tit">[알림] ${list.noticeTitle }</span>
		</a>
	</li>
</c:forEach>