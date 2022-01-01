<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCommon.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCart.css" />



<div class="modal-header">
<h5 class="modal-title" id="exampleModalLabel">수량을 선택해 주세요.</h5>

<!-- x 버튼 -->
<button type="button" class="btn-close modal-close-btn" data-bs-dismiss="modal" aria-label="Close"></button>
</div>

<div class="modal-body">
	
	<!-- 상단 (이미지,상품명,서브카테고리,낱개가격) -->
	<div class="modal-body-top">
		<!-- 상단 왼쪽  -->
		<div class="img-bg-div"><!-- 이미지 배경 -->
			<img src="${pageContext.request.contextPath}/resources/upload/goods/${cart.optionDetail.optionImg }">
		</div>
		<!-- 상단 오른쪽 -->							
		<div class="modal-body-top-right">
			<!-- 상품명 -->
			<div class="pname-div">${cart.goods.PName}</div>
			<!-- 서브카테고리 -->
			<div class="pcategory-div">${cart.goods.PSubcategory}</div>
			<!-- 낱개가격 -->
			<div class="pprice-div">
				<fmt:formatNumber value="${cart.goods.PPrice}" pattern="#,###원" />
				<input type="hidden" id="sell_price" value="${cart.goods.PPrice}"/>
			</div>
		</div>
	
	</div>
	
	<!-- 중간 (옵션명, 개수+-버튼) -->
	<div class="modal-body-middel">
		<!-- 옵션명 -->
		<div class="optiongroup-div">
			${cart.optionDetail.optionType }
			${cart.optionDetail.optionColor }
			${cart.optionDetail.optionSize }
		</div>
		
		<!-- 개수+-버튼 -->
		<div class="qtyChange-div">
			<!--[ - 버튼 ]-->
			<input type="button" value="-" class="cnt-bnt" id="minus-btn${vs.count }" onclick="del();">
			
			<!-- 상품 개수 -->
			<input type="text" name="amount" id="amount" class="amount" 
				value="${cart.goodsCart.cartQuantity }" readonly onchange="change();">
			
			<!-- [ + 버튼 ] -->
			<input type="button" value="+" class="cnt-bnt" id="plus-btn${vs.count }" onclick="add();">
		
		</div>
	</div>
	
	<!-- 하단 (총 수량, 총 가격) -->
	<div class="modal-body-bottom">
		<!-- 총수량 -->
		<div class="sumcnt-div">총 수량: <span class="cnt"></span></div>
		<!-- 총가격 -->
		<div class="sumprice-div">
			<input type="text" name="sum" size="8" id="sum" value="${cart.goods.PPrice*cart.goodsCart.cartQuantity}" readonly>원
		</div>
	</div>	
</div> <!-- end of class="modal-body" -->


<div class="modal-footer">
	<button class="goodsBtn" data-cart-id=${cart.goodsCart.cartId }>
		확인
	</button>
</div>


<script>

/* [확인]버튼 클릭시 
 * location.reload(); 
 */
$(".goodsBtn").click((e) => {
	
	const $this = $(e.target);
	const cartId = $this.data("cartId");
	const qty = $(".amount").val();
	
	console.log("변경할 수량 = " + qty);
	console.log("cartId = " + cartId);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/goods/updateCartQty.do?${_csrf.parameterName}=${_csrf.token}",
		data: {cartId : cartId, qty : qty},
		type : "get",
        
        success(data) {
        	console.log(data);
        	
        	
        },
        error: console.log
    });
	
});
 





/* 상품개수 나오는 span 태그 */
const $cnt = $(".cnt");

/* +-버튼 가운데 상품 수량 태그 */
var hm = document.getElementById('amount');
console.log(hm);

/* 상품 총합 가격 태그 */
var sum = document.getElementById('sum');
console.log(sum);
/* 상품 단일 가격 값*/
var sell_price = document.getElementById('sell_price').value;
console.log(sell_price);
/* 상품 수량 값*/
var amount = hm.value;



$(() => {
	
	/* 수량, 가격  초기값 함수 */
	init();
	
});


/* 수량, 가격  초기값 함수 */
function init() {
	$cnt.text(amount);
	sum.value = sell_price;
	change();
	
}

/* +,- 버튼 클릭 이벤트 > 수량span값 바뀌기 */
$(".cnt-bnt").click((e) => {
	$cnt.text($("#amount").val());
	
});


/* 더하기 함수 */
function add () {
	
	hm.value++ ;
	sum.value = comma(parseInt(hm.value) * sell_price);
}



/* 빼기 함수 */
function del () {

	if (hm.value > 1) {
		hm.value--;
		sum.value = comma(parseInt(hm.value) * sell_price);
	}
}
/* 더하기, 빼기 버튼 사이에 개수 바뀌는 함수 */
function change () {

	if (hm.value < 0) {
		hm.value = 0;
	}
	sum.value = comma(parseInt(hm.value) * sell_price);
}


/* 숫자형식에 콤마 붙여주는 함수 */
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}


</script>