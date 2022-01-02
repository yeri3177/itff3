<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#full-heart {
	color: red!important;
}
</style>

<c:if test="${like eq 0}">
	<!-- null이면 빈하트 -->
	<i class="far fa-heart"></i>
</c:if>

<c:if test="${like eq 1}">
	<!-- null이 아니면 빨강하트 -->
	<i class="fas fa-heart" id="full-heart"></i>
	
</c:if>