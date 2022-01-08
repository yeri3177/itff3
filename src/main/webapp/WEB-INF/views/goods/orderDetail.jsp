<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCommon.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/orderDetail.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

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
<section class="goods-container" id="orderDetail-container">

	<div class="d-flex justify-content-between" style="margin-bottom: 50px;">
		<div style="font-weight: 555;">주문번호 ${order.orderDetail.orderDetailNo }</div>
		<div style="color:gray;"><fmt:formatDate value="${order.goodsOrder.orderDate }" pattern="yyyy-MM-dd HH:mm"/></div>
	</div>

	<!-- 상단 : 상품상태 -->
	<div id="top-container">
		
		<div class="title-text">${order.orderDetail.status }</div>
		
		<!-- 상품상태 프로그레스 -->
		<div class="progress">
		  <div class="progress-bar" role="progressbar" style="width: ${statusPercent}%" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
		
		<!-- 상품상태 텍스트-->
		<div class="status-text">
			<div>상품준비중</div> <div>배송준비중</div> <div>배송중</div> <div>배송완료</div> <div>구매확정</div>
		</div>
	
	</div>
	
	
	<!-- 중간 : 주문한상품n개 -->
	<div id="middle-container">
		<div class="title-text">주문 상품 정보</div>
		
		<div class="d-flex order-item">
			<div class="img-bg">
				<img src="${pageContext.request.contextPath}/resources/upload/goods/${order.optionDetail.optionImg}">	
			</div>
			
			<div class="d-flex w-100 justify-content-between align-items-center">
				<div>
					<div style="color: #a1a1a1;">No. ${order.goods.PId }</div>
					<div style="font-weight: 555;">${order.goods.PName }</div>
					<div>
						${order.optionDetail.optionType }
						${order.optionDetail.optionColor }
						${order.optionDetail.optionSize }
					</div>
				</div>
				<div>${order.orderDetail.quantity }개</div>
				<div><fmt:formatNumber value="${order.goods.PPrice }" pattern="#,###원"/></div>
			
			</div>
		</div>
		
	</div> <!-- end of id="middle-container" -->
	
	
	
	<!-- 하단 : 배송지정보, 결제정보 -->
	<div id="bottom-container" class="w-100">
		<!-- 배송지정보 -->
		<div class="w-50 mr-5">
			<div class="title-text">배송지 정보</div>
			
			<div>${order.payment.receiver }</div>
			<div>${order.payment.phone }</div>
			<div>${order.payment.postCode }</div>
			<div>${order.payment.address }</div>
			<div>${order.payment.detailAddress }</div>
			<div>${order.payment.orderComment }</div>
		</div>
	
		<!-- 결제정보 -->
		<div class="w-50">
			<div class="title-text">결제 정보</div>
			
			<div class="d-flex justify-content-between">
				<div>카드번호</div>
				<div>${order.payment.cardNumber }</div>
			</div>
			
			<div class="d-flex justify-content-between">
				<div>결제수단</div>
				<div>${order.payment.cardName }</div>
			</div>
			
			<div class="d-flex justify-content-between">
				<div>상품금액</div>
				<div><fmt:formatNumber value="${order.goods.PPrice }" pattern="#,###원"/></div>
			</div>
			
			<div class="d-flex justify-content-between">
				<div>사용한포인트</div>
				<div>
					
					<!-- 1이면 포인트, 배송비 적용함 -->
					<c:if test="${booleanFirstOrder eq 1}">
						<div><fmt:formatNumber value="${order.payment.usedPoints }" pattern="#,###P"/></div>
					</c:if>
					
					<!-- 0이면 포인트, 배송비 적용 안함 -->
					<c:if test="${booleanFirstOrder eq 0}">
						<div>0P</div>
					</c:if>
					
				</div>
			</div>
			
			<div class="d-flex justify-content-between">
				<div>배송비</div>
				<div>
					<!-- 1이면 포인트, 배송비 적용함 -->
					<c:if test="${booleanFirstOrder eq 1}">
						<div>2,500원</div>
					</c:if>
					
					<!-- 0이면 포인트, 배송비 적용 안함 -->
					<c:if test="${booleanFirstOrder eq 0}">
						<div>0원</div>
					</c:if>
				</div>
			</div>
			
			<div class="d-flex justify-content-between">
				<div>결제금액</div>
				<div>
					<!-- 1이면 포인트, 배송비 적용함 -->
					<c:if test="${booleanFirstOrder eq 1}">
						<div>
							<div><fmt:formatNumber value="${order.goods.PPrice-order.payment.usedPoints+2500 }" pattern="#,###원"/></div>
						</div>
					</c:if>
					
					<!-- 0이면 포인트, 배송비 적용 안함 -->
					<c:if test="${booleanFirstOrder eq 0}">
						<div>
							<div><fmt:formatNumber value="${order.goods.PPrice }" pattern="#,###원"/></div>
						</div>
					</c:if>
				
				</div>
			</div>
	
		</div> <!-- end of 결제정보 -->
		
	
	</div>


</section>

<script>


</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>