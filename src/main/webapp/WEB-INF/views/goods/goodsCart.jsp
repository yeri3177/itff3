<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<!-- 소메뉴 네비게이션 -->
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

<!-- 메인 콘텐츠 섹션 -->
<section class="goods-container" id="goodsCart-container">

<!-- 왼쪽 컨테이너 -->
<div id="left-container">
	<!-- 텍스트 -->
	<div class="titleText">
		<i class="fas fa-store"></i> 
		ITFF 굿즈마켓
	</div>
	<br />
	
	
	<!-- card 낱개 반복 -->
	<div class="card-custom">
		<!-- card-head -->
		<div class="card-head">
			<!-- card-head-left : cart-id -->
			<div class="cardId-div">
				No. 323232
			</div>
			
			<!-- card-head-right : X버튼 -->
			<div>
				<button type="button" class="btn-close" aria-label="Close"></button>
			</div>
		</div>
		
		<!-- card-body -->
		<div class="card-body">
			<!-- 이미지 배경 -->
			<div class="img-bg-div">
				<!-- 이미지db 불러오기 -->
				<div>
				
				</div>
			</div>
			
			<!-- 텍스트 -->
			<div class="card-body-right">
				<!-- 상품명 -->
				<div class="goodsName-div">
					망고잼빵 아이폰 케이스
				</div>
				<!-- 서브 카테고리 -->
				<div class="goodsCategory-div">
					아이폰 젤리 케이스
				</div>
				<!-- 가격 -->
				<div class="goodsPrice-div">
					16,300원
				</div>
			
			
			</div>
		</div>
		
		<!-- card-footer -->
		<div class="card-footer">
			<!-- card-footer-left -->
			<div class="card-footer-left">
				<!-- 옵션명 -->
				<div>아이폰 13</div>
				
				<!-- 개수 -->
				<div>1개</div>
			</div>
			<!-- card-footer-right -->
			<div class="card-footer-right">
				<button type="button" id="qtyBtn" class="btn btn-outline-secondary">수량 변경</button>
			</div>
		</div>
	
	</div><!-- end of card 낱개 반복 -->
	

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
			<div>11111</div>
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






	
</section>

<script>


</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>