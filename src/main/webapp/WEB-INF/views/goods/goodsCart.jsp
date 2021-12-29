<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	/* SecurityContext securityContext = SecurityContextHolder.getContext();
	Authentication authentication = securityContext.getAuthentication();
	Member loginMember = (Member) authentication.getPrincipal();
	pageContext.setAttribute("loginMember", loginMember); */

%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCommon.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCart.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

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
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsQna.do" target="_top">묻고 답하기</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/sellerInfo.do" target="_top">판매자 정보</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top">장바구니</a></li>
		</ul>
	</div>
</div>

<!-- 페이지 전체 컨테이너 -->
<section class="goods-container" id="goodsCart-container">


 <c:if test="${not empty list}">

<!-- 왼쪽 컨테이너 -->
<div id="left-container">
	<!-- 텍스트 -->
	<div class="titleText">
		<i class="fas fa-store"></i> 
		ITFF 굿즈마켓 
	</div>
	<br />
	
	
	<!-- card 낱개 반복 -->
	<c:forEach items="${list}" var="cart" varStatus="vs">
	<div class="card-custom">
		<!-- card-head -->
		<div class="card-head">
			<!-- card-head-left : cart-id -->
			<div class="cardId-div">
				<%-- No. ${cart.cartId} --%>
				No. ${cart.goodsCart.cartId }
			</div>
			
			<!-- card-head-right : X버튼 (버튼 클릭시 해당 goods_cart 레코드 삭제(GET) -->
			<div class="iconBg-div">
				<button type="button" data-cart-id="${cart.goodsCart.cartId }" class="btn-close" aria-label="Close"></button>
			</div>
		</div>
		
		<!-- card-body -->
		<div class="card-body">
			<!-- 이미지 배경 -->
			<div class="img-bg-div">
				<!-- 상품 옵션 이미지 -->
				<img src="${pageContext.request.contextPath}/resources/upload/goods/${cart.optionDetail.optionImg }">
			</div>
			
			<!-- 텍스트 -->
			<div class="card-body-right">
				<!-- 상품명 -->
				<div class="goodsName-div">
					${cart.goods.PName }
				</div>
				<!-- 서브 카테고리 -->
				<div class="goodsCategory-div">
					${cart.goods.PSubcategory }
				</div>
				<!-- 상품 가격 (상품낱개가격*장바구니수량) -->
				<div class="goodsPrice-div">
					<fmt:formatNumber value="${cart.goods.PPrice*cart.goodsCart.cartQuantity}" pattern="#,###원" />
				</div>
			</div>
		</div>
		
		<!-- card-footer -->
		<div class="card-footer">
			<!-- card-footer-left -->
			<div class="card-footer-left">
				<!-- 옵션명 -->
				<div>
					${cart.optionDetail.optionType }
					${cart.optionDetail.optionColor }
					${cart.optionDetail.optionSize }
				
				</div>
				
				<!-- 개수 -->
				<div>${cart.goodsCart.cartQuantity }개</div>
			</div>
			<!-- card-footer-right -->
			<div class="card-footer-right">
				<button type="button" id="qtyBtn" class="btn btn-outline-secondary">수량 변경</button>
			</div>
		</div>
	
	</div><!-- end of card 낱개 반복 -->
	</c:forEach>

</div> <!-- end of 왼쪽 컨테이너 -->





<!-- 오른쪽 컨테이너 -->
<div id="right-container">
	<div class="titleText">결제금액</div>
	
	<!-- 결제금액 body -->
	<div id="summaryBody">
		<div class="summary-row">
			<div>총 수량</div>
			<div>11111</div>
		</div>
		
		<div class="summary-row">
			<div>가격</div>
			<div>11111</div>
		</div>
		
		<div class="summary-row">
			<div>배송비</div>
			<div>2,500원</div>
		</div>
		
		<div class="summary-row sum-row">
			<div>합계</div>
			<div>11111</div>
		</div>
	</div>
	
	<button type="button" id="orderBtn" class="goodsBtn">
		주문서 작성
	</button>
</div> <!-- end of 오른쪽 컨테이너 -->
</c:if>
 
 <c:if test="${empty list}">
 <div class="empryList-div">
 	<!-- <i class="fas fa-shopping-basket"></i> -->
 	<i class="fas fa-shopping-cart"></i>
 	<br />
 	비어있는 장바구니를 채워주세요!
 </div>
 </c:if>



</section> <!-- end of 페이지 전체 컨테이너 -->

 
<!-- 장바구니 삭제폼 -->
<form
	action="${pageContext.request.contextPath}/goods/deleteCart.do?${_csrf.parameterName}=${_csrf.token}"
	method="POST" 
	name="deleteCartFrm">
	
	<input type="hidden" name="cartId" />
</form>

<script>
$(".btn-close").click((e) => {
	const $this = $(e.target);
	const cartId = $this.data("cartId");
	
	console.log("cartId = "+cartId);
	
	const $frm = $(document.deleteCartFrm);
	$frm.find("[name=cartId]").val(cartId);
	$frm.submit();
});

</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>