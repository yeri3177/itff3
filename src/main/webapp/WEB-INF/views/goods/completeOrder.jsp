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

<!-- 서브메뉴 네비게이션 -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsList.do" target="_top">전체상품</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/likeItems.do" target="_top">관심상품</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top">장바구니</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/orderList.do" target="_top">구매목록</a></li>
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
			주문일자 : <fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
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

<input type="hidden" class="ws_id" value="${order.memberId }" />

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

<script>

window.onload = function () {
	let type = '굿즈샵';
	  let target = $('.ws_id').val();
	  let content = '[굿즈샵] 상품 구매가 완료되었습니다. 빠르게 배송해드릴게요!'
	  let url = '${contextPath}/notify/saveNotify.do';
	  	    
	  console.log(type);
	  console.log(target);
	  console.log(content);
	  console.log(url);
	  
	  // 전송한 정보를 db에 저장	
	  $.ajax({
	      type: "post",
	      url:"${pageContext.request.contextPath}/notify/saveNotify.do",
	      dataType: "text",
	      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	      data: {
	          target: target,
	          content: content,
	          type: type,
	          url: url
	      },
	      beforeSend : function(xhr) {   
	          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	      },
	      success:    // db전송 성공시 실시간 알림 전송
	          // 소켓에 전달되는 메시지
	          // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
	      	socket.send("ITFF,"+target+","+content+","+url)
//				console.log("관리자,"+target+","+content+","+url)

	  });
};
</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>