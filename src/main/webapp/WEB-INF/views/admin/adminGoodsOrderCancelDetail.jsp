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
						  	<th class="title_tr">주문정보</th>
						  	<td class="receiver" style="justify-content: flex-start;">	
							  	<button 
					      		type="button" 
					      		class="btn btn-outline-secondary orderUpdateBtn"
					      		data-toggle="modal"
								data-target="#adminMemberDetail"
								onclick="order_receiver_change_btn('${payment.payment.memberId }');">회원상세정보보기
								</button>	
							</td>
						  </tr>
						  
						  <tr>
						  	<th class="title_th">주문번호</th>
						    <td class="receiver">${payment.payment.paymentNo }</td>
						  	<th class="title_th">주문일자</th>
						    <td class="receiver"><fmt:formatDate value="${payment.payment.paymentDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
						  </tr>
						  
					  		<tr>
							  	<th class="title_th">수령인</th>
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
									${payment.payment.detailAddress }
									${payment.payment.postCode }									
								</td>
								<th class="title_th">주문메모</th>
								<td class="receiver">
									${payment.payment.orderComment }	
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
						  	<th class="title_th pay">결제날짜</th>
							<td class="pay_td" style="font-size: 14px !important;"><fmt:formatDate value="${payment.payment.paymentDate }" pattern="yy-MM-dd HH:mm:ss"/></td>						  
						  </tr>

						  <tr>
						  	<th class="title_th pay">결제수단</th>
								<td class="pay_td" style="font-size: 14px !important;">
									${payment.payment.cardName }
									${payment.payment.cardNumber }
								</td>						  
						  </tr>

						  <tr>
						  	<th class="title_th pay">사용포인트</th>
							<td class="pay_td" style="font-size: 14px !important;"><fmt:formatNumber value="${payment.payment.usedPoints }" pattern="#,###"/></td>						  
						  </tr>
						  
						  <tr>
						  	<th class="title_th pay">결제금액</th>
							<td class="pay_td" style="font-weight: 700;"><fmt:formatNumber value="${payment.payment.totalPrice }" pattern="#,###" /></td>
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
								<th>진행상태</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
		 				<tbody>
						  <c:forEach items="${list }" var="list">
						  <c:if test="${list.orderDetail.status eq '주문취소' || list.orderDetail.status eq '환불완료'}">
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
							    <td>
								    <div>
								    <select class="form-select order_select"  data-order-detail-no="${list.orderDetail.orderDetailNo }" aria-label="Default select example" style="width: 100px;">
									  <option ${list.orderDetail.status eq null ? 'selected' : '' }>선택</option>
									  <option value="주문취소" ${list.orderDetail.status eq '주문취소' ? 'selected' : ''}>주문취소</option>
									  <option value="환불완료" ${list.orderDetail.status eq '환불완료' ? 'selected' : ''}>환불완료</option>
									</select>
								    </div>
							    </td>
							    
						  </tr>						  
						  </c:if>
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
				 -->
				 <!-- 
		        <button 
		        	type="button" 
		        	class="btn btn-outline-secondary"
  			      	data-toggle="modal"
					data-target="#adminGoodsOrderDelete"
					onclick="goods_order_delete_btn('${payment.payment.orderNo}', '${payment.payment.paymentNo}');">일괄주문취소
				</button>
				  -->
		      </div>

    <form 
    	action="${pageContext.request.contextPath }/admin/updateGoodsOrderDetailStatus.do?${_csrf.parameterName}=${_csrf.token}" 
    	method="POST" 
    	name="updateGoodsOrderDetailStatusFrm">
    	<input type="hidden" name="orderDetailNo" />
    	<input type="hidden" name="status" />
    	<input type="hidden" name="memberId" class="memberId" value="${payment.payment.memberId }" />
    </form>

<script>

$(".order_select").change((e) => {
	const $this = $(e.target);
	const orderDetailNo = $this.data("orderDetailNo"); // data-속성의 키값을 camelcasing으로 처리
	const status = $this.val();
	
	console.log("orderDetailNo = " + orderDetailNo)
	console.log("status = " + status)
	
	// jsp의 EL문법과 js의 String Template 충돌. escaping처리 할것.
	const msg = `상품 진행 상태를 [\${status}]로 변경하시겠습니까?`;
	
	if(confirm(msg)){
		const $frm = $(document.updateGoodsOrderDetailStatusFrm);
		$frm.find("[name=orderDetailNo]").val(orderDetailNo);
		$frm.find("[name=status]").val(status);
		$frm.submit();

	    let type = '굿즈샵';
	    let target = $(".memberId").val();
	    let content = '주문하신 상품의 진행 상태는 ['+status+'] 입니다.'
	    let url = '${contextPath}/notify/saveNotify.do';
	    
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
	    });
	}
	else {
		// 초기값으로 복귀
		$this.find("[selected]").prop("selected", true);
	}

});

</script>

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