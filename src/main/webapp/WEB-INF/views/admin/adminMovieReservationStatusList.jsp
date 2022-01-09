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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminMovieReservationStatusList.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

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
		
					<div class="search-total insert">
					   <div class="input-group rounded">
						
						<c:forEach items="${schedule }" var="schedule" varStatus="vs">
							<form action="${pageContext.request.contextPath}/admin/adminMovieReserStatusSearchDate.do">
							<input type="hidden" name="startDate" value="${schedule.startDate }" />
							<button 
			    		  		type="submit" 
			    		  		class="btn btn-outline-dark"
			    		  		style="border-radius: 0; font-family: 'Montserrat';">
			    		  		${schedule.startDate }
			    		  	</button>
			    		  </form>
						</c:forEach>

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
										>상세</button>
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