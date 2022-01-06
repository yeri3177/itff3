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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminMovieReservationList.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<style>
div#search-regDate {display: ${searchType} == '' || ${searchType} == null || "regDate".equals(${searchType}) ? "inline-block" : "none"; }
div#search-movieReservationId {display: "movieReservationId".equals(${searchType}) ? "inline-block" : "none"; }
div#search-memberId {display: "name".equals(${searchType}) ? "inline-block" : "none";}
</style>

<!-- 관리자 헤더 -->
<jsp:include page="/WEB-INF/views/admin/common/adminSectionHeader.jsp"></jsp:include>

<!-- 굿즈 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminMovieNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">예매관리</h2>
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
					            <option value="regDate" ${"date".equals(searchType) ? "selected" : ""}>예매일자</option>
					            <option value="movieReservationId" ${"movieReservationId".equals(searchType) ? "selected" : ""}>예매번호</option>		
					            <option value="memberId" ${"memberId".equals(searchType) ? "selected" : ""}>아이디</option>
					        </select>
					        <div id="search-movieReservationId" class="search-type" style="display: none; width: 500px !important;">
					            <form action="${pageContext.request.contextPath}/admin/adminmovieReservationFinder.do">
					            	<div style="display: flex;">
					                <input type="hidden" name="searchType" value="movieReservationId"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="예매번호를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'movieReservationId' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            	</div>
					            </form>	
					        </div>
					        <div id="search-memberId" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminmovieReservationFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="memberId"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="예매자를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'memberId' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					        <div id="search-regDate" class="search-type">
				            	<input type="hidden" name="searchType" value="regDate"/>
				                 <input type="hidden" name="searchKeyword"  class="form-control rounded" aria-label="Search" aria-describedby="search-addon" value="${'regDate' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					            <form action="${pageContext.request.contextPath}/admin/adminmovieReservationRegDateFinder.do">
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
									<th>예매일자</th>
									<th>예매번호</th>
									<th>아이디</th>
									<th>작품명</th>
									<th>상영일자</th>
									<th>좌석정보</th>
									<th>결제금액</th>
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
									
									<!-- 예매일자 -->
									<td>
										<div class="email">
												<span><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span> 
										</div>
									</td>

									<!-- 예매번호 -->
									<td>
										<div class="email">
											<span class="reservationId">${list.movieReservationId}</span> 
										</div>
									</td>

									<!-- 아이디 -->
									<td>
										<div class="email">
											<span>${list.memberId}</span> 
										</div>
									</td>

									<!-- 작품명 -->
									<td>
										<div class="email">
											<span>${list.titleKor}</span>
										</div>
									</td>

									<!-- 상영일자 -->
									<td>
										<div class="email">
											<span>${list.startDate} ${list.startTime }</span> 
										</div>
									</td>

									<!-- 좌석 -->
									<td>
										<div class="email">
											<span>${list.theaterId}관 ${list.selectedSeat}</span> 
										</div>
									</td>

									<!-- 금액 -->
									<td><fmt:formatNumber value="${list.amount }" pattern="#,###" /></td>

									<td>
										<button 
										id="${list.movieReservationId }" 
										type="button"
										class="btn btn-outline-dark"
										data-toggle="modal"
										data-target="#adminMovieReservationDetail"
										onclick="movie_reservation_detail_btn('${list.movieReservationId}', '${list.movieId }');"
										>예매상세</button>
									</td>

								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						</div>
						
						<!-- 예매 상세 -->
						<div class="modal fade" id="adminMovieReservationDetail" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 900px;">
								<div class="modal-content"
									style="text-align: left;">
								  	<div class="modal-body" id="modal_ajax1">
								    		  
									</div>
								</div>
							</div>
						</div>
						<!-- 예매 상세 끝 -->
						<!-- 예매 정보 수정 -->
						<div class="modal fade" id="adminMovieReservationUpdate" tabindex="-1"
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
						<!-- 예매 정보 수정 끝 -->
						<!-- 예매 삭제 -->
						<div class="modal fade" id="adminMovieReservationDelete" tabindex="-1"
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
						<!-- 예매 삭제 -->
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
								<!-- 작품 정보 -->
								<div class="modal fade" id="adminMovieInfo" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document"
										style="max-width: 1000px;">
										<div class="modal-content"
											style="text-align: left;">
										  	<div class="modal-body" id="modal_ajax10">
										    		  
											</div>
										</div>
									</div>
								</div>
								<!-- 작품 정보 끝 -->

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

// 예매 상세
function movie_reservation_detail_btn(movieReservationId, movieId) {
	
	console.log(movieReservationId);
	console.log(movieId);
	
	var id = movieReservationId;
	var id2 = movieId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMovieReservationDetail.do",
		data: {
			movieReservationId: id,
			movieId: id2
			},
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

// 예매 정보 수정
function movie_reservation_update_btn(movieReservationId) {
	
	console.log(movieReservationId);
	var id = movieReservationId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsUpdate.do",
		data: {movieReservationId: id},
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

// 예매 취소
function movie_reservation_delete_btn(movieReservationId) {
	
	console.log(movieReservationId);
	var id = movieReservationId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsDelete.do",
		data: {movieReservationId: id},
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
function order_member_info_btn(memberId) {
	
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
		url:"${pageContext.request.contextPath}/admin/saveNotify.do",
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

// 작품정보
function movieInfo_btn(movieId) {
	
	console.log(movieId);
	var id = movieId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMovieInfo.do",
		data: {movieId: id},
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax10").html(data);
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

	<!-- //container -->

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>