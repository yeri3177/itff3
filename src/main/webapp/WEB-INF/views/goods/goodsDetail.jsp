<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goodsDetail.css" />

<style>
/* 색상옵션 > 체크 안되어 있을때 */
.color-box input[type='radio'] {
  background-color: #e0e0e0; /* el로 해당옵션 색상 넣어주기 */
  cursor: pointer;
}

/* 색상옵션 > 체크 되어 있을때 */
.color-box input[type='radio']:checked {
  background-color: gray; /* el로 해당옵션 색상 넣어주기 */
  border: 4px double white;
}

/* 색상옵션 > 마우스 호버시 */
.color-box input[type='radio']:hover {
  border: 4px double white;
}
</style>

<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<body onload="init();">

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
<section id="goodsDetail-container" class="container w-90 py-5" style="height: 1200px;">
	
	<!-- 상단 영역 -->
	<div id="top-box"> 
		<!-- 상단 > 왼쪽 영역 -->
		<div>
			<div id="preview-img-div" class="d-inline-block">
				<img src="${pageContext.request.contextPath}/resources/upload/goods/${goods.PImg}" />
			</div>
			
			<!-- 판매자 프로필 영역 -->
			<div class="profile-box">	
				<!-- 프로필이미지 -->
				<div class="logo-img-box">
					<img src="${pageContext.request.contextPath}/resources/images/goods/goodsshop_logo.png" />
				</div>
				
				<!-- 프로필 텍스트 -->
				<div class="profile-text-box">
					<div class="text1">Designed By</div>
					<div class="text2">잇프 굿즈샵</div>
				</div>
				
			</div>
			
		</div>
		<!-- 상단 > 오른쪽 영역 -->
		<div id="top-right-box" class="d-inline-block">
			
			<!-- 상품명 -->
			<div class="goods-name">${goods.PName}</div>
			
			<!-- 상품가격 -->
			<div>
				<fmt:formatNumber value="${goods.PPrice}" pattern="#,### 원" />
				<input type=hidden name="sell_price" id="sell_price" value="${goods.PPrice}">
			</div>
				
				<!-- 옵션1: 기종 (OPTION_TYPE)--> 
				<%-- <c:if test="${not empty optionList}"> --%>
				<%-- <c:if test="${optionList.optionType != null}"> --%>
				<div id="option-type-div" class="option-div">
					<div>기종</div>
					
					<select class="form-select" aria-label="Default select example">
						<%-- <c:forEach items="${optionList}" var="option"> --%>
					 		 <option selected>아이폰 12</option>
					 		 <option>아이폰 X</option>
					 	<%-- </c:forEach> --%>
					</select>
				</div>
				<%-- </c:if> --%>
				
				<!-- 옵션2 : 색상 (OPTION_COLOR) -->
				<div class="option-div">
					<div>색상</div>
					
					<!-- 색상 라디오 태그 그룹 -->
					<div class="option-colors-div">
						<!-- 개별 색상 박스 -->
						<div class="color-box radio-wrap">
							<input type="radio" name="color" checked><br />
							<label for="">그린</label>
						</div>
						
						<div class="color-box radio-wrap">
							<input type="radio" name="color"><br />
							<label for="">레드</label>
						</div>
						
						<div class="color-box radio-wrap">
							<input type="radio" name="color"><br />
							<label for="">화이트</label>
						</div>
					</div>
				</div>
				
				
				<!-- 옵션3 : 사이즈 (OPTION_SIZE) -->
				<div class="option-div">
					<div>사이즈</div>
					<div class="size-box">

						 <div class="size-btn-box">
							<input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked>
							<label class="btn btn-secondary" for="option1">S</label>
						</div>
						<div class="size-btn-box">
							<input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
							<label class="btn btn-secondary" for="option2">M</label>
						</div>
						<div class="size-btn-box">
							<input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
							<label class="btn btn-secondary" for="option3">L</label>
						</div>
						<div class="size-btn-box">
							<input type="radio" class="btn-check" name="options" id="option4" autocomplete="off">
							<label class="btn btn-secondary" for="option4">XL</label>
						</div>
					</div>
				</div>
				
				<!-- 수량 버튼 박스-->
				<div class="qty-div">
					<div>수량</div>
					
					<div class="qty-btn-div">
						<input type="button" value="+" class="cnt-bnt" onclick="add();">
						<input type="text" name="amount" id="amount" value="1" onchange="change();">
						<input type="button" value="-" class="cnt-bnt" onclick="del();">
					</div>
				</div>
				
				<hr />
				
				<!-- 개수, 가격 변동 -->
				<div class="price-box">
					<div>
						<span class="cnt"></span>개 상품 금액</div>
					<div>
						<input type="text" name="sum" id="sum" size="8" readonly>원
					</div>
				</div>
				
				<!-- 장바구니 버튼 -->
				<input type="submit" value="장바구니" class="cart-btn"/>
				
		</div>
	</div>
	

	
</section>

<script>


/* span 개수 태그 */
const $cnt = $(".cnt");
/* 상품 수량 태그 */
var hm = document.getElementById('amount');
/* 상품 가격 합계 태그 */
var sum = document.getElementById('sum');
/* 상품 단일 가격 값*/
var sell_price = document.getElementById('sell_price').value;
/* 상품 수량 값*/
var amount = hm.value;


$(".cnt-bnt").click((e) => {
	/* $cnt.text($("#amount").val()); */
	$cnt.text(hm.value);
});


/* 초기화 함수 */
function init () {
	$cnt.text('1');
	sum.value = sell_price;
	change();
}

/* 더하기 함수 */
function add () {
	hm.value++ ;
	sum.value = parseInt(hm.value) * sell_price;
}

/* 빼기 함수 */
function del () {

	if (hm.value > 1) {
		hm.value--;
		sum.value = parseInt(hm.value) * sell_price;
	}
}
/* 가격 바꿔주는 함수 */
function change () {

	if (hm.value < 0) {
		hm.value = 0;
	}
	sum.value = parseInt(hm.value) * sell_price;
}  

</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>