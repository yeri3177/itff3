<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	SecurityContext securityContext = SecurityContextHolder.getContext();
	Authentication authentication = securityContext.getAuthentication();
	
	if(!"anonymousUser".equals(authentication.getPrincipal())){
		Member loginMember = (Member) authentication.getPrincipal();
		pageContext.setAttribute("loginMember", loginMember);
	}
%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/sellerInfo.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 서브메뉴 네비게이션 -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsList.do" target="_top">전체상품</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/likeItems.do" target="_top">관심상품</a></li>
		<c:if test="${loginMember != null }">
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top">장바구니</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/orderList.do" target="_top">구매목록</a></li>
		</c:if>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/sellerInfo.do" target="_top">판매자 정보</a></li>
		</ul>
	</div>
</div>

<!-- 메인 콘텐츠 섹션 -->
<section class="goods-container text-left" id="sellerinfo-container">

<!-- 전체 너비 80% 컨테이너-->
<div class="container w-80"> 
	<!-- <span class="text1 font-weight-bold">판매자 정보</span>
	
	<hr class="bg-secondary"/>
	<br /> -->
	
	
	<div class="both-box">
		<!-- 왼쪽 테이블 정보 -->
		<div class="left-box">
		
			<div class="text2">잇프 굿즈마켓</div>
			<div class="text3">잇프 굿즈 마켓 ( ITFF GOODS MARKET )</div>
			<br /><br />
			<span class="text4">사업자정보</span>
			<table class="table">
				<tr>
					<td class="text3">상호명</td>
					<td>(사)아이티국제영화제</td>
					<td class="text3">사업자등록번호</td>
					<td>2148210535</td>
				</tr>
				<tr>
					<td class="text3">대표자</td>
					<td>최형구</td>
					<td class="text3">사업장 소재지</td>
					<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 3F</td>
				</tr>
				<tr>
					<td class="text3">고객센터</td>
					<td>02-1234-5678</td>
					<td class="text3">통신판매업번호</td>
					<td>2021-서울강남-8282</td>
				</tr>
				<tr>
					<td class="text3">email</td>
					<td>itff_market@itff.com</td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		
		<!-- 오른쪽 데이터랩 차트 -->
		<div class=right-box>
			<!-- <div><span>DataLab </span><span>연령별/성별 인기도</span></div> -->
			<div>DataLab<span style="color: #283ba3; font-size: 2px;">◼</span> ITFF 회원의 굿즈샵 사용율</div>
			
			<div class="chart-div">
  				<canvas id="ageChart" height="260"></canvas>
			</div>
			
			<div class="chart-div">
  				<canvas id="genderChart"></canvas>
			</div>
			
			<div class="text3">데이터랩은 ITFF의 빅테이터 분석을 통해 생성한 정보입니다.</div>
		</div>
	
	</div>
	
	<br />
	<br />
	
	<!-- 굿즈마켓 배너 이미지 -->
	<img src="${pageContext.request.contextPath }/resources/images/goods/goods_banner.png" id="goods-banner-img" alt="굿즈배너"/>
	
	<br />
	<br />
	
	<!-- 주의 메세지 -->
	<div class="alert d-flex align-items-center" role="alert">
	  <span>
	  	<i class="fas fa-exclamation-circle"></i>
	  </span>
	  
	  <div class="pl-2">반품 배송비, 반품 배송주소 등은 해당 상품 페이지 내 안내를 참고해주세요.</div>
	</div>

	
</div> <!-- 전체 너비 80% 컨테이너-->
</section> <!-- 메인 콘텐츠 섹션 -->

<script>

/**
 * 연령별 회원수 
 */
const ctx1 = document.getElementById('ageChart');
const ageChart = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: ['10대', '20대', '30대', '40대', '50대'],
        datasets: [{
            data: [
            	'${ageMap.get("10대")}', 
            	'${ageMap.get("20대")}', 
            	'${ageMap.get("30대")}', 
            	'${ageMap.get("40대")}', 
            	'${ageMap.get("50대")}'
            ], 
            backgroundColor: ['#73A2E4'],
        }]
    },
    options: {
	   	 plugins: { 
	  	      legend: {
	  	    	display: false, /* 라벨 안보이게 하기 */
	  	      },
		},
	},
});


/**
 * 성별 회원수 
 */
const ctx2 = document.getElementById('genderChart');
const genderChart = new Chart(ctx2, {
    type: 'doughnut',
    data: {
        labels: ['O', 'X'],
        datasets: [{
            data: ['${usingPercent}', '${100-usingPercent}'], /* el로 데이터값 불러오기 */
            backgroundColor: ['#ABD8FF', '#FF6D6D'],
            hoverOffset: 3, /* 마우스 호버 효과 */
        }]
    },
    options: {
    	
    	plugins: {
	   	      legend: {
	   	        position: 'bottom',
	   	      },
    	},
    	
	}
});
</script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>