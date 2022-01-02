<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.apache.tomcat.util.net.openssl.ciphers.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
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
div#search-reviewNo {display: ${searchType} == '' || ${searchType} == null || "reviewNo".equals(${searchType}) ? "inline-block" : "none"; }
div#search-reviewTitle {display: "reviewTitle".equals(${searchType}) ? "inline-block" : "none";}
div#search-memberId {display: "memberId".equals(${searchType}) ? "inline-block" : "none";}
</style>

<!-- 게시판 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminBoardNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

		<div class="container">	
		
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">리뷰게시판</h2>
				</div>
			</div>
			
			<div class="search-total-total">
			<div class="row" id="row">
				<div class="col-md-12">
					<div class="table-wrap">
					
					<div class="search-total" style="display: flex; flex-direction: row; justify-content: flex-end;">
						<div class="input-group rounded">
					        <select 
					        	id="searchType" 
					        	class="custom-select"
					        	style="display: block; padding: 0.375rem 2.25rem 0.375rem 0.75rem; -moz-padding-start: calc(0.75rem - 3px); font-size: 1rem; font-weight: 400; line-height: 1.5; color: #212529; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; -webkit-appearance: none; -moz-appearance: none; appearance: none; width: 150px;">
					            <option value="reviewNo" ${"reviewNo".equals(searchType) ? "selected" : ""}>글번호</option>		
					            <option value="reviewTitle" ${"reviewTitle".equals(searchType) ? "selected" : ""}>글제목</option>
					            <option value="memberId" ${"memberId".equals(searchType) ? "selected" : ""}>작성자</option>
					        </select>
					        <div id="search-reviewNo" class="search-type" style="width: 500px !important;">
					            <form action="${pageContext.request.contextPath}/admin/adminReviewFinder.do">
					            	<div style="display: flex;">
					                <input type="hidden" name="searchType" value="reviewNo"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="글번호를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'reviewNo' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            	</div>
					            </form>	
					        </div>
					        <div id="search-reviewTitle" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminReviewFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="reviewTitle"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="제목을 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'reviewTitle' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					        <div id="search-memberId" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminReviewFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="memberId"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="작성자를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'memberId' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
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
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr class="alert" role="alert">

									<td></td>

									<!-- 글번호 -->
									<td>
										<div class="email" data-id="${list.reviewNo }">
											<span>${list.reviewNo }</span> 
											<input type="hidden" name=id${status.index} value="${reviewNo }" />
										</div>
									</td>

									<!-- 제목 -->
									<td>
										<div class="email">
											<span>${list.reviewTitle }</span>
										</div>
									</td>

									<!-- 작성일 -->
									<td>
										<div class="email">
											<span>${list.memberId }</span>
										</div>
									</td>

									<!-- 작성일 -->
									<td>
										<div class="email">
											<span><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd" /></span>
										</div>
									</td>

									<td>
										<button 
											type="button"
											class="btn btn-outline-dark" 
											data-toggle="modal"
											data-target="#adminreviewDetail"
											onclick="review_detail_btn('${list.reviewNo}');">상세</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>

					<!-- 리뷰 상세 -->
					<div class="modal fade" id="adminreviewDetail" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document"
							style="max-width: 800px;">
							<div class="modal-content" style="text-align: left;">
							   	<div class="modal-body" id="modal_ajax1">
							    		  
								</div>

								</div>
							</div>
						</div>
						<!-- 리뷰 상세 끝 -->

						<!-- 리뷰 삭제 -->
						<div class="modal fade" id="adminreviewDelete" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 800px;">
								<div class="modal-content" style="text-align: left;">
								   	<div class="modal-body" id="modal_ajax3">
								    		  
									</div>
	
									</div>
								</div>
							</div>
							<!-- 리뷰 삭제 끝 -->
					
					</div>
				</div>
			</div>
		</div>
	        
<!-- //container -->

${pagebar}

<script>

// 검색
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

// 리뷰 상세
function review_detail_btn(reviewNo) {
	
	console.log(reviewNo);
	var no = reviewNo;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminReviewDetail.do",
		data: {reviewNo: no},
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

// 리뷰 삭제
function review_delete_btn(reviewNo) {
	
	console.log(reviewNo);
	var no = reviewNo;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminReviewDelete.do",
		data: {reviewNo: no},
		method: "get",
		contentType: "application/json",
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

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>