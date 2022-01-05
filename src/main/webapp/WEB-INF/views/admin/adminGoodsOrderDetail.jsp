<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminGoodsOrderDetail.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">주문상세</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    		  <div class="modal-body">
					  
					<table class="table">
						<tbody>
						  <!-- 주문 정보 -->
						  
						  <tr>
						  	<th class="title_tr">주문 정보</th>
						  	<td class="receiver" style="justify-content: flex-start;">	
							  	<button 
					      		type="button" 
					      		class="btn btn-outline-secondary orderUpdateBtn"
					      		data-toggle="modal"
								data-target="#adminMemberDetail"
								onclick="order_receiver_change_btn('${payment.payment.memberId }');">회원상세정보보기
								</button>	
							  	<button 
					      		type="button" 
					      		class="btn btn-outline-secondary orderUpdateBtn"
								onclick="order_receiver_change_btn('${orderNo}, ${payment.payment.receiver }');">주문자정보수정
								</button>	
							</td>
						  </tr>
						  
						  <tr>
						  	<th class="title_th">주문번호</th>
						    <td class="receiver">${orderNo }</td>
						  	<th class="title_th">주문일자</th>
						    <td class="receiver"><fmt:formatDate value="${payment.payment.paymentDate }" pattern="yy-MM-dd"/></td>
						  </tr>
					  		<tr>
							  	<th class="title_th">주문자</th>
								<td class="receiver">
									${payment.payment.receiver }
								</td>
								<th class="title_th">연락처</th>
								<td class="receiver">
									${payment.payment.phone }					
								</td>
						  	</tr>
													
							<tr>
								<th class="title_th">배송주소</th>
								<td class="receiver">
									${payment.payment.address }
								</td>
								<th class="title_th">주문메모</th>
								<td class="receiver">
									${payment.payment.orderComment }	
								</td>
							</tr>	

						</tbody>					
					</table>
					
					<table class="table">
						<tbody>
							<tr>
								<th class="title_th">주문상태</th>
								<td class="receiver">
									<select class="form-select" aria-label="Default select example">
									  <option selected>선택</option>
									  <option value="1">결제확인</option>
									  <option value="2">상품준비중</option>
									  <option value="3">배송중</option>
									  <option value="3">배송완료</option>
									  <option value="3">취소</option>
									</select>
								</td>
								<th class="title_th">택배회사</th>
								<td class="receiver">
									<select class="form-select" aria-label="Default select example">
									  <option selected>선택</option>
									  <option value="1">CJ대한통운</option>
									  <option value="2">한진택배</option>
									  <option value="3">우체국택배</option>
									  <option value="3">롯데택배</option>
									  <option value="3">로젠택배</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>						  
					
					 <!-- 결제 정보 -->
					<table class="table">
						<tbody> 
						
						  <tr>
							<th class="title_tr">결제 정보</th>
							<td></td>
						  </tr>
						  
						  <tr>
						  	<th class="title_th pay">주문금액</th>
							<td class="pay_td"><fmt:formatNumber value="${payment.payment.totalPrice }" pattern="#,###" /></td>
						  </tr>
						  
						</tbody>
					</table>
					
					<table class="table">
					  <tbody>
		 				
						<thead class="thead-primary">
							<tr>
								<th></th>
								<th>상품번호</th>
								<th>카테고리</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
								<th></th>
							</tr>
						</thead>
		 				<tbody>
						  <c:forEach items="${list }" var="list">
						  
   						  <tr>
						    	<td>
							    	<div class="order_img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${list.goods.PImg })"></div>
							    </td>
							    <td>
							   		${list.goods.PId }
							    </td>
							    <td>
							    	${list.goods.PCategory }
							    </td>
							    <td>
								    <div class="goods_order_info">
									    <div>${list.goods.PName }</div>
									    <div class="option_content_div">
										    <span class="optionSpan color">
										    ${list.optionDetail.optionColor } 
										    </span>
										    <span class="optionSpan size">
										    ${list.optionDetail.optionSize eq 'ONE' ? 'Free' : list.optionDetail.optionSize} 
										    </span>
											<span class="optionSpan optionType">
										    ${list.optionDetail.optionType }
											</span>									    
									    </div>
								    </div>
							    </td>
							    <td>
								    <span class="optionSpan quantity">
								    ${list.orderDetail.quantity }개
								    </span>
							    </td>
							    <td>
								    <div>
								    	<span class=price><fmt:formatNumber value="${list.goods.PPrice }" pattern="#,###" />원</span>
								    </div>
							    </td>
						  </tr>
						  
						  </c:forEach>
					  </tbody>
					  </table>
		      </div>
		      <div class="modal-footer">
<!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				<!-- 
		      	<button 
		      		type="button" 
		      		class="btn btn-outline-secondary"
		      		data-toggle="modal"
					data-target="#adminGoodsUpdate"
					onclick="goodsUpdate_btn('${orderNo}');">주문자정보</button>
		        <button 
		        	type="button" 
		        	class="btn btn-outline-secondary"
  			      	data-toggle="modal"
					data-target="#adminGoodsDelete"
					onclick="goodsDelete_btn('${orderNo}');">주문메모</button>
				 -->
		      </div>

<script>

//Bootstrap multiple modal
var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌

$(document).on('show.bs.modal', '.modal', function () {
    var zIndex = 1040 + (10 * count);

    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);

    count = count + 1

});

// multiple modal Scrollbar fix
$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});

</script>