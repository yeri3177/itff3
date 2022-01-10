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


<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


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
					<div style="width: 31%;">${order.goods.PName } </div>
					<div style="width: 23%;" class="text-center"><fmt:formatNumber value="${order.goods.PPrice }" pattern="#,###원"/></div>
					<div style="width: 23%;" class="text-center">${order.orderDetail.status }</div>
					
					<div class="btn-group"> 
						
						<!-- 상세보기 버튼  -->
						<div class="detail-btn" data-order-detail-no="${order.orderDetail.orderDetailNo }">상세보기</div>
						
						<!-- 구매확정 버튼 -->
						<c:if test="${order.orderDetail.status eq '배송완료'}">
						<%-- <div class="confirm-btn" data-order-detail-no="${order.orderDetail.orderDetailNo }">구매확정</div> --%>
						
						<button type="button" class="confirm-btn" data-bs-toggle="modal" data-bs-target="#orderConfirmModal${vs.index }">
						  구매확정
						</button>
						</c:if>
						
						<!-- 리뷰쓰기 버튼 -->
						<c:if test="${order.orderDetail.status eq '구매확정'}">
						<div class="review-btn" data-order-detail-no="${order.orderDetail.orderDetailNo }">리뷰쓰기</div>
						</c:if>
						
					</div>
				</div>
			</div> <!-- end of class="bottom-div" -->
		</div> <!-- end of class="order-item" -->
		
		
		<!-- Modal -->
		<div class="modal fade" id="orderConfirmModal${vs.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      
		      <div class="modal-body">
			      	<div>
				      	주문번호 : ${order.orderDetail.orderDetailNo } <br />
				      	상품명 : ${order.goods.PName }
				    </div> 
			      	
			        <div style="margin-top: 20px; font-weight: bold">
			        	해당상품을 구매확정 하시겠습니까?
			        </div>
		      </div>
		      
		      <div class="modal-footer">
			      	<button type="button" class="btn modal-btn modal-confirm-btn" data-order-detail-no="${order.orderDetail.orderDetailNo }">확정하기</button>
			        <button type="button" class="btn modal-btn close-btn" data-bs-dismiss="modal">닫기</button>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		
		
		</c:forEach>
	
	</c:if>
	 
	 <c:if test="${empty list}">
	 	
	 	<div>
	 		<div style="font-size: 130px; font-weight: 600;">텅</div>
	 		구매내역이 없습니다.
	 	</div>
	 	
	 </c:if>

</section>




<!-- 구매확정 -->
<form
	action="${pageContext.request.contextPath}/goods/updateOrderStatusConfirm.do?${_csrf.parameterName}=${_csrf.token}"
	method="POST" 
	name="orderConfirmFrm">
	
	<input type="hidden" name="orderDetailNo" />
</form>


<script>
/* [구매확정] 버튼 클릭시 */
$(".modal-confirm-btn").click((e) => {
	const $this = $(e.target);
	const orderDetailNo = $this.data("orderDetailNo");
	
	console.log(orderDetailNo);
	
	const $frm = $(document.orderConfirmFrm);
	$frm.find("[name=orderDetailNo]").val(orderDetailNo);
	$frm.submit();
});


/* [상세보기] 버튼 클릭시 */
$(".detail-btn").click((e) => {
	
	const $this = $(e.target);
	const orderDetailNo = $this.data("orderDetailNo");
	
	console.log(orderDetailNo);
	
	location.href = '${pageContext.request.contextPath}/goods/orderDetail.do?no='+orderDetailNo;
	
})

</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>