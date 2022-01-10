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
	href="${pageContext.request.contextPath }/resources/css/member/memberPoint.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


<fmt:requestEncoding value="utf-8" />
<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="포인트 내역" name="title" />
</jsp:include>

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<jsp:include page="/WEB-INF/views/member/common/memberNav.jsp">
	<jsp:param value="멤버 네베게이션 바" name="nav" />
</jsp:include>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">포인트 내역</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
<div class="biggerPoint">

	<div class="dateAndPoint">
		<div class="col-one-point">
			<span style="font-size: 16px;">내 포인트 <em class="txt-maroon">${totalPoint }</em> 점</span>
		</div>
	
		<div style="text-align: center; margin-bottom: 13px;">
			<form:form
				id="memberPointByDateFrm"
				action="${pageContext.request.contextPath}/member/memberPointByDate.do"
				method="GET">
				<input type="date" name="startDate" id="startDate" required/> ~ <input type="date" name="endDate" id="endDate" required/>
				<!-- <input type="submit" value="조회하기" /> --> 
				<button type="button" onclick="submitProcess();" class="btn btn-dark" style="position: relative; top: -3px;">조회하기</button>
			</form:form>
		</div>
	</div>
<br />


<div class="sub_sc">
<div id="_listContentArea">

    <ul class="list_area  ">



<c:forEach items="${list }" var="point">
	<li class="list_item">
	    <div class="item sub _interlockNo1641303452434239cf9ca3T">
	        <a href="#" class="item_content">
	            <!-- <div class="state_space point">
	                <span class="state _statusName">사용</span>
	            </div> -->
	            <div class="info_space"> <!--N=a:pnt.detail-->
	                <span class="date"><fmt:formatDate value="${point.regDate}" pattern="yyyy.MM.dd"/> </span>
	                <strong class="title click _titleName">${point.reason }</strong>
	            </div>
		        <div class="amount_space">
		            <div class="amount_inner">
		                <span class="point">${point.change }</span>
		            </div>
		        </div>
	        </a>
	
	    </div>
	</li>
</c:forEach>





    </ul>

	</div>
</div>
<div class="pagebar_footer">
	${pagebar}
	
</div>


</div>

<script>
	
</script>

<script>
const submitProcess = () => {
	const startDate = $('#startDate').val();
	const endDate = $('#endDate').val();
	
	if(startDate == ""){
		alert("시작날짜를 입력해주세요.");
		return;
	}
	
	if(endDate == ""){
		alert("종료날짜를 입력해주세요.");
		return;
	}
	
	if(startDate > endDate){
		alert("조회할 수 있는 날짜가 아닙니다. 다시 입력해주세요.");
		return;
	}
	
	$(memberPointByDateFrm)
		.attr("action", `${pageContext.request.contextPath}/member/memberPointByDate.do`)
		.submit();
};
</script>


<!-- </body> -->



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>