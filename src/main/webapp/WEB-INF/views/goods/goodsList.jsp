<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goods.css" />

<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 소메뉴 네비게이션 -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="current "><a href="#" target="_top">ITFF 2022</a></li>
			<li class="on_"><a href="#" target="_top">전체상품</a></li>
			<li class="on_"><a href="#" target="_top">묻고 답하기</a></li>
			<li class="on_"><a href="#" target="_top">판매자 정보</a></li>
		</ul>
	</div>
</div>

<!-- 메인 콘텐츠 섹션 -->
<section class="goods-container">

	<!-- 굿즈 배너 이미지 -->
	<img src="${pageContext.request.contextPath }/resources/images/goods/goods_banner.png" id="goods-banner-img" alt="굿즈배너"/>
	
	<hr />


</section>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
