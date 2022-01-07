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
div#search-orderDate {display: ${searchType} == '' || ${searchType} == null || "orderDate".equals(${searchType}) ? "inline-block" : "none"; }
div#search-orderNo {display: "orderNo".equals(${searchType}) ? "inline-block" : "none"; }
div#search-name {display: "name".equals(${searchType}) ? "inline-block" : "none";}
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
					            <option value="orderDate" ${"date".equals(searchType) ? "selected" : ""}>주문날짜</option>
					            <option value="orderNo" ${"orderNo".equals(searchType) ? "selected" : ""}>주문번호</option>		
					            <option value="name" ${"name".equals(searchType) ? "selected" : ""}>주문자</option>
					        </select>
					        <div id="search-orderNo" class="search-type" style="display: none; width: 500px !important;">
					            <form action="${pageContext.request.contextPath}/admin/adminGoodsOrderFinder.do">
					            	<div style="display: flex;">
					                <input type="hidden" name="searchType" value="orderNo"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="주문번호를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'orderNo' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            	</div>
					            </form>	
					        </div>
					        <div id="search-name" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminGoodsOrderFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="name"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="주문자를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'name' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					        <div id="search-orderDate" class="search-type">
				            	<input type="hidden" name="searchType" value="orderDate"/>
				                 <input type="hidden" name="searchKeyword"  class="form-control rounded" aria-label="Search" aria-describedby="search-addon" value="${'orderDate' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
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
									<th>주문자</th>
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
												<span><fmt:formatDate value="${list.goodsOrder.orderDate }" pattern="yy-MM-dd HH:mm:ss"/></span> 
										</div>
									</td>

									<!-- 주문번호 -->
									<td>
										<div class="email">
											<span style="text-decoration: underline;">${list.goodsOrder.orderNo}</span> 
										</div>
									</td>

									<!-- 아이디 -->
									<td>
										<div class="email">
												<span>${list.member.name }</span> 
										</div>
									</td>
									
									<!-- 금액 -->
									<td><fmt:formatNumber value="${list.goodsOrder.totalPrice }" pattern="#,###" /></td>

									<!-- 결제상태 -->
									<td>
										<div class="email">
											<c:if test="${list.payment.paymentNo eq '' }">
												<span style="color: #45a7b9; font-weight: bold;">결제대기</span>
											</c:if>
											<c:if test="${list.payment.paymentNo ne '' }">
												<span style="color: #ec7b65; font-weight: bold;">결제완료</span>
											</c:if>
										</div>
									</td>

									<td>
										<button 
										type="button"
										style="font-size: 12px !important;"
										class="btn btn-outline-dark"
										onclick="not_payment_btn('${list.goodsOrder.memberId}');"
										>결제알림</button>
									</td>

								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						</div>
						
					</div>
				</div>	
			</div>
		</div>

${pagebar}

<script>

function not_payment_btn(memberId) {
	console.log(memberId);
	var id = memberId;
	
    let type = '상품주문';
    let target = id;
    let content = '[상품주문] 주문하신 상품의 결제를 완료해주세요.';
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

};

</script>

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