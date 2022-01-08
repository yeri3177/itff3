<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCommon.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/completeOrder.css" />

<style>
	canvas{z-index:10;pointer-events: none;position: fixed;top: 0;transform: scale(1.1);}
</style>

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

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
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsList.do" target="_top">전체상품</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsQna.do" target="_top">묻고 답하기</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/sellerInfo.do" target="_top">판매자 정보</a></li>
		</ul>
	</div>
</div>

<!-- 메인 콘텐츠 섹션 -->
<section class="goods-container" id="completeOrder-container">

<div id="top-container">
	<div>
		<i class="far fa-check-circle"></i>
	</div>
	<div id="top-right-div">
		<div class="title-text">
			고객님의 주문이 완료되었습니다. 
		</div>
		
		<div>
			구매내역에 대한 안내는 구매내역조회를 통하여 확인 가능합니다. 
		</div>
		
		<div>
			주문번호 : ${order.orderNo }
		</div>
		
		<div>
			주문일자 : ${orderDate }
		</div>
	
	</div>
</div>

<div class="btngroup-div">
	<button class="goodsBtn" id="paychk-btn">구매 내역 확인</button> 
	
	<button class="goodsBtn" id="shopping-btn">쇼핑 계속하기</button>
</div>

<div class="buttonContainer">
	<button class="canvasBtn" id="stopButton">Stop Confetti</button>
	<button class="canvasBtn" id="startButton">Drop Confetti</button>	
</div>

<canvas id="canvas"></canvas>

</section>

<script src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>
<script>
$(() => {
	console.log('${payment.paymentNo}');
})

$(document).ready(function(){  
  function reAction(){
  	$("#startButton").trigger("click");
  	setTimeout(function(){
  		$("#stopButton").trigger("click");
  	}, 6000);
  }  
  reAction(); 
});

$("#paychk-btn").click((e) => {
	location.href = '${pageContext.request.contextPath}/goods/orderList.do';
})

$("#shopping-btn").click((e) => {
	location.href = '${pageContext.request.contextPath}/goods/goodsList.do';
})

</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>