<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div>사이즈</div>
<div class="size-box">
	<!-- 개별 사이즈 박스 -->
	<c:forEach items="${searchSizeList}" var="size" varStatus="vs">
	<div class="size-btn-box">
		<input type="radio" class="btn-check" name="optionSize" id="${size.optionSize}" autocomplete="off" ${vs.first ? 'checked' : ''}>
		<label class="btn btn-secondary" for="${size.optionSize}">${size.optionSize}</label>
	</div>
	</c:forEach>
</div>