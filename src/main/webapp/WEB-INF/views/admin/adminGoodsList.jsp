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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminList.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<style>
div#search-pId {display: ${searchType} == '' || ${searchType} == null || "pId".equals(${searchType}) ? "inline-block" : "none"; }
div#search-pName {display: "pName".equals(${searchType}) ? "inline-block" : "none";}
</style>

<!-- 굿즈 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminGoodsNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>


		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">판매 상품 목록</h2>
				</div>
			</div>
			
			<div class="search-total-total">
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
					
					<div class="search-total">
					   <div class="input-group rounded">
					        <select 
					        	id="searchType" 
					        	class="custom-select"
					        	style="display: block; padding: 0.375rem 2.25rem 0.375rem 0.75rem; -moz-padding-start: calc(0.75rem - 3px); font-size: 1rem; font-weight: 400; line-height: 1.5; color: #212529; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; -webkit-appearance: none; -moz-appearance: none; appearance: none; width: 150px;">
					            <option value="pId" ${"pId".equals(searchType) ? "selected" : ""}>상품코드</option>		
					            <option value="pName" ${"pName".equals(searchType) ? "selected" : ""}>상품명</option>
					        </select>
					        <div id="search-pId" class="search-type" style="width: 500px !important;">
					            <form action="${pageContext.request.contextPath}/admin/adminGoodsFinder.do">
					            	<div style="display: flex;">
					                <input type="hidden" name="searchType" value="pId"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="상품코드를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'pId' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-primary">search</button>		
					            	</div>
					            </form>	
					        </div>
					        <div id="search-pName" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminGoodsFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="pName"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="상품명을 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'pName' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-primary">search</button>		
					            </div>
					            </form>	
					        </div>
					    </div>
					  </div>
					
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>상품코드</th>
									<th>상품명</th>
									<th>가격</th>
									<th>카테고리</th>
									<th>등록일자</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="list">
								<tr class="alert" role="alert">
									<!-- 체크박스 -->
									<td><label class="checkbox-wrap checkbox-primary">

									</label>
									</td>
									
									<!-- 이미지 -->
									<td>
										<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${list.PImg })"></div>
									</td>
									
									<!-- 상품코드 -->
									<td>
										<div class="email">
											<span>${list.PId }</span> 
										</div>
									</td>

									<!-- 상품명 -->
									<td>
										<div class="email">
												<span>${list.PName }</span> 
										</div>
									</td>
									
									<!-- 금액 -->
									<td><fmt:formatNumber value="${list.PPrice }" pattern="#,###" /></td>
									
									<!-- 카테고리  -->
									<td class="quantity">${list.PCategory }</td>
									
									<!-- 등록일자 -->
									<td><fmt:formatDate value="${list.PEnroll }" pattern="yyyy-MM-dd"/></td>

									<td>
										<button 
										id="${list.PId }" 
										type="button"
										class="btn btn-secondary" 
										data-toggle="modal"
										data-target="#adminGoodsDetail"
										onclick="goodsDetail_btn('${list.PId}');">상세</button>
									</td>

								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						</div>
						
						<!-- 상품 상세 -->
						<div class="modal fade" id="adminGoodsDetail" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 600px;">
								<div class="modal-content"
									style="text-align: left;">
								  	<div class="modal-body" id="modal_ajax1">
								    		  
									</div>
								</div>
							</div>
						</div>
						<!-- 상품 상세 끝 -->
						<!-- 상품 정보 수정 -->
						<div class="modal fade" id="adminGoodsUpdate" tabindex="-1"
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
						<!-- 상품 상세 끝 -->
						<!-- 상품 삭제 -->
						<div class="modal fade" id="adminGoodsDelete" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content"
									style="text-align: left;" id="modal_ajax3">
									<div class="modal-body" id="modal_ajax3">
									   		 
									        
									</div>
								</div>
							</div>
						</div>
						<!-- 상품 삭제 -->
						
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

// 상품 상세
function goodsDetail_btn(pId) {
	
	console.log(pId);
	var id = pId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsDetail.do",
		data: {pId: id},
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

// 상품 정보 수정
function goodsUpdate_btn(pId) {
	
	console.log(pId);
	var id = pId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsUpdate.do",
		data: {pId: id},
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

// 상품 삭제
function goodsDelete_btn(pId) {
	
	console.log(pId);
	var id = pId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsDelete.do",
		data: {pId: id},
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