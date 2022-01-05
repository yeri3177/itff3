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
	href="${pageContext.request.contextPath }/resources/css/member/memberPointNew.css" />
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
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberProfile.do" target="_top">프로필사진변경</a></li>
			<li class="on_"><a href="#">예매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top" target="_top">장바구니</a></li>
			<li class="on_"><a href="#" target="_top">상품구매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberPoint.do" target="_top">포인트이용내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberWrittenReviewList.do" target="_top">내가쓴게시글</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberUpdate.do" target="_top">정보수정</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">포인트 내역</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
<div class="biggerPoint">
<div class="col-one-point">
      	<h3>ITFF POINT</h3>
	<ul>
		<li>
			<strong>사용가능 포인트</strong>
			<span><em class="txt-maroon">${totalPoint }</em> 점</span>
		</li>
	</ul>
       
</div>

<br />

<div style="text-align: center;">
	<form:form
		action="${pageContext.request.contextPath}/member/memberPointByDate.do"
		method="GET">
		<input type="date" name="startDate" id="startDate"/> ~ <input type="date" name="endDate" id="endDate"/>
		<input type="submit" value="조회하기" />
	</form:form>
</div>

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
const submitProcess = (name) => {
	$(devFrm)
		.attr("action", `${pageContext.request.contextPath}/member/\${name}.do?${_csrf.parameterName}=${_csrf.token}`)
		.submit();
};
</script>


<!-- </body> -->



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>