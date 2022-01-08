<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCommon.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/orderList.css" />

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

<section class="goods-container" id="orderList-container">
	
	 <c:if test="${not empty list}">
	
		<!-- 반복되는 div -->
		<c:forEach items="${list }" var="order" varStatus="vs">
		<div class="order-item">
			<div class="top-div">
				
				<div>
					주문 번호 ${order.orderDetail.orderDetailNo } 
					<i class="fas fa-angle-right"></i>
				</div>
				
				<div style="color: #a3a3a3;">
					<fmt:formatDate value="${order.goodsOrder.orderDate }" pattern="yyyy-MM-dd HH:mm"/>
				</div>
			</div>
			
			<div class="bottom-div">
				<!-- 이미지 -->
				<div class="image-bg">
					<img src="${pageContext.request.contextPath}/resources/upload/goods/${order.optionDetail.optionImg}">		
				</div>
				
				<!-- 이미지 아닌 오른쪽 영역 -->
				<div class="bottom-right-div">
					<div>${order.goods.PName } </div>
					<div><fmt:formatNumber value="${order.goods.PPrice }" pattern="#,###원"/></div>
					<div>${order.orderDetail.status }</div>
					
					<div> <!-- 상세보기 버튼  -->
						<div class="detail-btn detail-btn${vs.index }" data-order-detail-no="${order.orderDetail.orderDetailNo }">상세보기</div>
					</div>
				</div>
			</div> <!-- end of class="bottom-div" -->
		</div> <!-- end of class="order-item" -->
		</c:forEach>
	
	</c:if>
	 
	 <c:if test="${empty list}">
	 	
	 	<div>
	 		<div style="font-size: 130px; font-weight: 600;">텅</div>
	 		구매내역이 없습니다.
	 	
	 	</div>
	 	
	 </c:if>

</section>

<script>
$(".detail-btn").click((e) => {
	
	const $this = $(e.target);
	const orderDetailNo = $this.data("orderDetailNo");
	
	console.log(orderDetailNo);
	
	location.href = '${pageContext.request.contextPath}/goods/orderDetail.do?no='+orderDetailNo;
	
})

</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>