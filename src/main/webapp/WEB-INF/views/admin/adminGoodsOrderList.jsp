<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminGoodsOrderList.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<style>
div#search-paymentDate {display: ${searchType} == '' || ${searchType} == null || "paymentDate".equals(${searchType}) ? "inline-block" : "none"; }
div#search-paymentNo {display: "paymentNo".equals(${searchType}) ? "inline-block" : "none"; }
div#search-receiver {display: "receiver".equals(${searchType}) ? "inline-block" : "none";}
</style>

<!-- 관리자 헤더 -->
<jsp:include page="/WEB-INF/views/admin/common/adminSectionHeader.jsp"></jsp:include>

<!-- 굿즈 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminGoodsNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">주문관리</h2>
				</div>
			</div>
			
			<div class="search-total-total">
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
		
					<div class="search-total insert" style="justify-content: flex-end;">
					   <div class="input-group rounded">
					        <select 
					        	id="searchType" 
					        	class="custom-select"
					        	style="display: block; padding: 0.375rem 2.25rem 0.375rem 0.75rem; -moz-padding-start: calc(0.75rem - 3px); font-size: 1rem; font-weight: 400; line-height: 1.5; color: #212529; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; -webkit-appearance: none; -moz-appearance: none; appearance: none; width: 150px;">
					            <option value="paymentDate" ${"date".equals(searchType) ? "selected" : ""}>주문날짜</option>
					            <option value="paymentNo" ${"paymentNo".equals(searchType) ? "selected" : ""}>주문번호</option>		
					            <option value="receiver" ${"receiver".equals(searchType) ? "selected" : ""}>주문자</option>
					        </select>
					        <div id="search-paymentNo" class="search-type" style="display: none; width: 500px !important;">
					            <form action="${pageContext.request.contextPath}/admin/adminGoodsOrderFinder.do">
					            	<div style="display: flex;">
					                <input type="hidden" name="searchType" value="paymentNo"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="주문번호를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'paymentNo' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            	</div>
					            </form>	
					        </div>
					        <div id="search-receiver" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminGoodsOrderFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="receiver"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="주문자를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'receiver' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					        <div id="search-paymentDate" class="search-type">
				            	<input type="hidden" name="searchType" value="paymentDate"/>
				                 <input type="hidden" name="searchKeyword"  class="form-control rounded" aria-label="Search" aria-describedby="search-addon" value="${'paymentDate' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					            <form action="${pageContext.request.contextPath}/admin/adminGoodsOrderDateFinder.do">
					            <div style="display: flex; align-items: center;">
					                <input type="text" id="startDate" class="form-control" name="startDate" placeholder="시작일">
					                ~
					                <input type="text" id="endDate" class="form-control" name="endDate" placeholder="종료일">
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					    </div>
					  </div>
					
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>&nbsp;</th>
									<th>주문일자</th>
									<th>주문번호</th>
									<th>아이디</th>
									<th>주문금액</th>
									<th>결제상태</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="list" varStatus="vs">
								<tr class="alert" role="alert">
									<!-- 체크박스 -->
									<td><label class="checkbox-wrap checkbox-primary">

									</label>
									</td>
									
									<!-- 주문일자 -->
									<td>
										<div class="email">
												<span><fmt:formatDate value="${list.payment.paymentDate }" pattern="yy-MM-dd HH:mm:ss"/></span> 
										</div>
									</td>

									<!-- 주문번호 -->
									<td>
										<div class="email">
											<span style="text-decoration: underline;">${list.payment.paymentNo}</span> 
										</div>
									</td>

									<!-- 아이디 -->
									<td>
										<div class="email">
												<span>${list.payment.memberId }</span> 
										</div>
									</td>
									
									<!-- 금액 -->
									<td><fmt:formatNumber value="${list.payment.totalPrice }" pattern="#,###" /></td>

									<td>
										<button 
										id="${list.orderDetail.orderNo }" 
										type="button"
										class="btn btn-outline-secondary"
										data-toggle="modal"
										data-target="#adminGoodsOrderDetail"
										onclick="goods_order_detail_btn('${list.orderDetail.orderNo}');"
										>상세</button>
									</td>

								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						</div>
						
						<!-- 주문 상세 -->
						<div class="modal fade" id="adminGoodsOrderDetail" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 1000px;">
								<div class="modal-content"
									style="text-align: left;">
								  	<div class="modal-body" id="modal_ajax1">
								    		  
									</div>
								</div>
							</div>
						</div>
						<!-- 주문 상세 끝 -->
						<!-- 수령인 정보 수정 -->
						<div class="modal fade" id="adminPaymentInfoUpdate" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 800px;">
								<div class="modal-content"
									style="text-align: left;">
									<div class="modal-body" id="modal_ajax2">
									   		 
									        
									</div>
								</div>
							</div>
						</div>
						<!-- 수령인 정보 수정 끝 -->
						<!-- 주문 상태 일괄 변경 -->
						<div class="modal fade" id="adminGoodsOrderStatusUpdate" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content"
									style="text-align: left;">
									<div class="modal-body" id="modal_ajax3">
									   		 
									        
									</div>
								</div>
							</div>
						</div>
						<!-- 주문 상태 일괄 변경 -->
						<!-- 회원 상세 -->
						<div class="modal fade" id="adminMemberDetail" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document"
							style="max-width: 800px;">
							<div class="modal-content" style="text-align: left;">
							   	<div class="modal-body" id="modal_ajax4">
							    		  
								</div>

								</div>
							</div>
						</div>
						<!-- 회원 상세 끝 -->
						<!-- 회원 정보 수정 -->
						<div class="modal fade" id="adminMemberUpdate" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 1000px;">
								<div class="modal-content" style="text-align: left;">
								   	<div class="modal-body" id="modal_ajax5">
								    		  
									</div>
	
									</div>
								</div>
							</div>
							<!-- 회원 정보 수정 끝 -->
							<!-- 회원 포인트 지급 -->
							<div class="modal fade" id="adminMemberPoint" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document"
									style="max-width: 500px;">
									<div class="modal-content" style="text-align: left;">
									   	<div class="modal-body" id="modal_ajax6">
									    		  
										</div>
		
										</div>
									</div>
								</div>
								<!-- 회원 포인트 지급 끝 -->
								<!-- 회원 차단 -->
								<div class="modal fade" id="adminMemberCut" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document"
										style="max-width: 500px;">
										<div class="modal-content" style="text-align: left;">
										   	<div class="modal-body" id="modal_ajax7">
										    		  
											</div>
			
											</div>
										</div>
									</div>
								<!-- 회원 차단 끝 -->
								<!-- 회원 차단 해제 -->
								<div class="modal fade" id="adminMemberUnblock" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document"
										style="max-width: 500px;">
										<div class="modal-content" style="text-align: left;">
										   	<div class="modal-body" id="modal_ajax8">
										    		  
											</div>
			
											</div>
										</div>
									</div>
								<!-- 회원 차단 해제 끝 -->
								<!--  개별 메세지 -->
								<div class="modal fade" id="adminSaveNotify" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div id="modal_ajax9" class="modal-dialog" role="document"
										style="max-width: 500px;" >
									</div>
								</div>
								<!-- 개별 메세지 끝 -->
						
					</div>
				</div>	
			</div>
		</div>

${pagebar}
	
<script>
$("#searchType").change((e) => {
	// e.target 이벤트발생객체 -> #searchType
	const type = $(e.target).val();
	
	// 1. .search-type 감추기
	$(".search-type").hide();
	
	// 2. #search-${type} 보여주기(display:inline-block)
	$(`#search-\${type}`).css("display", "inline-block");
});
</script>

<script>

// 주문 상세
function goods_order_detail_btn(orderNo) {
	
	console.log(orderNo);
	var id = orderNo;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsOrderDetail.do",
		data: {orderNo: id},
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax1").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 주문자 정보 수정
function payment_info_update_btn(paymentNo) {
	
	console.log(paymentNo);
	var id = paymentNo;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminPaymentInfoUpdate.do",
		data: {paymentNo: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax2").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 주문 삭제
function goods_order_status_update_btn(orderNo, paymentNo) {
	
	console.log(orderNo);
	console.log(paymentNo);
	
	var oNo = orderNo;
	var pNo = paymentNo;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsOrderStatusUpdate.do",
		data: {
			orderNo: oNo, 
			paymentNo: pNo
			},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax3").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 회원 상세
function order_receiver_change_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberDetail.do",
		data: {id: id},
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax4").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}
</script>

<script>
// 회원 정보 수정
function memberUpdate_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberUpdate.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax5").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 포인트 지급
function memberPoint_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberPoint.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax6").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 회원 차단
function member_cut_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberCut.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax7").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 회원 차단 해제
function member_unblock_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberUnblock.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax8").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 개별 메세지
function save_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/notify/saveNotify.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax9").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

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
		
		if(file != undefined) {
			$label.html(filename);
			$("[name=pImg]").val(filename);			
		}
	});	
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

	<!-- //container -->

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>