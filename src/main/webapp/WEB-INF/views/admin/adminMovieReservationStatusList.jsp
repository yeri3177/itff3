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
div#search-startDate {display: "name".equals(${searchType}) ? "inline-block" : "none";}
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
					<h2 class="heading-section">예매현황</h2>
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
					            <option value="startDate" ${"startDate".equals(searchType) ? "selected" : ""}>상영일자</option>
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
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="아이디를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'memberId' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					        <div id="search-regDate" class="search-type">
				                 <input type="hidden" name="searchKeyword"  class="form-control rounded" aria-label="Search" aria-describedby="search-addon" value="${'regDate' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					            <form action="${pageContext.request.contextPath}/admin/adminMovieReservationDateFinder.do">
				            	<input type="hidden" name="searchType" value="regDate"/>
					            <div style="display: flex; align-items: center;">
					                <input type="text" id="startDate" class="form-control" name="startDate" placeholder="시작일">
					                ~
					                <input type="text" id="endDate" class="form-control" name="endDate" placeholder="종료일">
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					        <div id="search-startDate" class="search-type" style="display: none;">
				                 <input type="hidden" name="searchKeyword"  class="form-control rounded" aria-label="Search" aria-describedby="search-addon" value="${'startDate' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					            <form action="${pageContext.request.contextPath}/admin/adminMovieReservationDateFinder.do">
				            	<input type="hidden" name="searchType" value="startDate"/>
					            <div style="display: flex; align-items: center;">
					                <input type="text" id="startDate2" class="form-control" name="startDate" placeholder="시작일">
					                ~
					                <input type="text" id="endDate2" class="form-control" name="endDate" placeholder="종료일">
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
									<th>&nbsp;</th>
									<th>상영번호</th>
									<th>상영작</th>
									<th>상영관</th>
									<th>상영정보</th>
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
									
									<!-- 이미지 -->
									<td>
										<div class="img" style="width:100px; height: 140px; background-image: url(${pageContext.request.contextPath}/resources/upload/poster/${list.movie.image })"></div>
									</td>

									<!-- 상영번호 -->
									<td>
										<div class="email">
											<span class="reservationId">${list.movieSchedule.movieScheduleId}</span> 
										</div>
									</td>

									<!-- 상영작 -->
									<td>
										<div class="email">
											<span><strong>${list.movie.titleKor}</strong>(${list.movie.titleEng })</span> 
										</div>
									</td>

									<!-- 상영관 -->
									<td>
										<div class="email">
											<span>
											${list.movieSchedule.theaterId}관
											</span>
										</div>
									</td>

									<!-- 상영정보 -->
									<td>
										<div class="email">
											<span>
											${list.movieSchedule.startDate}
											${list.movieSchedule.startTime}											
											</span>
										</div>
									</td>

									<td>
										<button 
										type="button"
										class="btn btn-outline-dark"
										data-toggle="modal"
										data-target="#adminMovieReservationStatusDetail"
										onclick="movie_reservation_status_detail_btn('${list.movieSchedule.movieScheduleId}');"
										>상세현황</button>
									</td>

								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						</div>
						
						<!-- 예매 상세 -->
						<div class="modal fade" id="adminMovieReservationStatusDetail" tabindex="-1"
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
function movie_reservation_status_detail_btn(movieScheduleId) {
	
	console.log(movieScheduleId);
	
	var id = movieScheduleId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMovieReservationStatusDetail.do",
		data: {
			movieScheduleId: id,
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