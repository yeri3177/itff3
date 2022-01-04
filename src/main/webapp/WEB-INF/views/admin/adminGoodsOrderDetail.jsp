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
						  <tr>
						  	<th class="order_no_th">No. ${orderNo } (<fmt:formatDate value="${payment.payment.paymentDate }" pattern="yy-MM-dd"/>)</th>
						    <td class="order_no_td"></td>
						  </tr>
						</tbody>
					</table>
		
					<table class="table">
					  <tbody>
		 						  
						  <c:forEach items="${list }" var="list">
						  
   						  <tr>
   						  <th class="trash"></th>
						    <td class="detail_content_td">
							    <div class="order_img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${list.goods.PImg })"></div>
							    <div class="goods_order_info">
								    <div>${list.goods.PName }</div>
								    <div class="option_content_div">
									    <span class="optionSpan color">
									    ${list.optionDetail.optionColor } 
									    </span>
									    <span class="optionSpan size">
									    ${list.optionDetail.optionSize } 
									    </span>
										<span class="optionSpan optionType">
									    ${list.optionDetail.optionType }
										</span>									    
									    <span class="optionSpan quantity">
									    ${list.orderDetail.quantity }개
									    </span>
								    </div>
							    </div>
							    <div>
							    	<span class=price><fmt:formatNumber value="${list.goods.PPrice }" pattern="#,###" />원</span>
							    </div>
							    <div>
							    	
							    </div>
						    </td>
						  </tr>
						  
						  </c:forEach>
					  </tbody>
					  </table>
					  
					<table class="table">
						<tbody>
						  <!-- 배송지 정보 -->
						  <tr>
							  <th class="title_tr">배송지 정보</th>
							  <td></td>
						  </tr>
						  
					  		<tr>
							  	<th class="title_th">수령인</th>
								<td class="receiver">${payment.payment.receiver }</td>
						  	</tr>
						  	
							<tr>
								<th class="title_th">휴대폰</th>
								<td class="receiver">${payment.payment.phone }</td>
							</tr>	
													
							<tr>
								<th class="title_th">주소지</th>
								<td class="receiver">${payment.payment.address }</td>
							</tr>	
													
							<tr>
								<th class="title_th">배송메모</th>
								<td class="receiver">${payment.payment.orderComment }</td>
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
						  	<th class="title_th pay">결제 금액</th>
							<td class="pay_td"><fmt:formatNumber value="${payment.payment.totalPrice }" pattern="#,###" /></td>
						  </tr>
						  
						  <tr>
						  	<th class="title_th pd">상품 금액</th>
							<td class="pd_td"><fmt:formatNumber value="${payment.payment.totalPrice }" pattern="#,###" /></td>
						  </tr>
						  
						  <tr>
						  	<th class="title_th total">최종 결제 금액</th>
							<td class="total_td"><fmt:formatNumber value="${payment.payment.totalPrice }" pattern="#,###" /></td>
						  </tr>
						  
						</tbody>
					</table>
		      </div>
		      <div class="modal-footer">
<!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
		      	<!-- 
		      	<button 
		      		type="button" 
		      		class="btn btn-success"
		      		data-toggle="modal"
					data-target="#adminGoodsUpdate"
					onclick="goodsUpdate_btn('${goods.PId}');">수정</button>
		        <button 
		        	type="button" 
		        	class="btn btn-danger"
  			      	data-toggle="modal"
					data-target="#adminGoodsDelete"
					onclick="goodsDelete_btn('${goods.PId}');">삭제</button>
		      </div>
		      	 -->

<script>

// 파일명 바꾸기 & 이미지 이름
$(() => {
	$("[name=upFile]").change((e) => {
		
		// 1.파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
		console.dir(e.target);
		console.log(file);
		console.log(filename);
		
		// 2.label에 설정하기
		const $label = $(e.target).next();
		console.log($label);
		
		if(file != undefined)
			$label.html(filename);
		else
			$label.html("파일을 선택하세요.");	
	});	
		$("[name=pImg]").val(filename);
});

</script>