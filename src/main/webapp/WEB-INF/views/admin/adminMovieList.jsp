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

<!-- 영화 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminMovieNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">상영목록</h2>
				</div>
			</div>
			
			<div class="search-total-total">
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
					
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>작품코드</th>
									<th>작품명</th>
									<th>감독</th>
									<th>&nbsp;</th>
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
										<div class="img" style="height: 140px; background-image: url(${pageContext.request.contextPath}/resources/upload/poster/${list.image })"></div>
									</td>
									
									<!-- 작품코드 -->
									<td>
										<div class="email">
											<span>${list.movieId }</span> 
										</div>
									</td>
									
									<!-- 작품명 -->
									<td>
										<div class="email">
											<span><strong>${list.titleKor }</strong>(${list.titleEng })</span> 
										</div>
									</td>
									
									<!-- 감독 -->
									<td>
										<div class="email">
											<span>${list.director}</span> 
										</div>
									</td>

									<td>
										<button 
										id="${list.movieId }" 
										type="button"
										class="btn btn-outline-dark" 
										data-toggle="modal"
										data-target="#adminMovieInfo"
										onclick="movieInfo_btn('${list.movieId}');"
										>작품정보</button>
									</td>

									<td>
										<button 
										id="${list.movieId }" 
										type="button"
										class="btn btn-outline-dark" 
										data-toggle="modal"
										data-target="#adminOneMovieSchedule"
										onclick="one_movie_schedule_btn('${list.movieId}');"
										>상영조회</button>
									</td>

								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						</div>
						
						<!-- 작품 정보 -->
						<div class="modal fade" id="adminMovieInfo" tabindex="-1"
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
						<!-- 작품 정보 끝 -->
						<!-- 상영조회 -->
						<div class="modal fade" id="adminOneMovieSchedule" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 1000px;">
								<div class="modal-content"
									style="text-align: left;">
								  	<div class="modal-body" id="modal_ajax2">
								    		  
									</div>
								</div>
							</div>
						</div>
						<!-- 상영조회 -->
						
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
			$("#modal_ajax1").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 상영조회
function one_movie_schedule_btn(movieId) {
	
	console.log(movieId);
	var id = movieId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminOneMovieSchedule.do",
		data: {movieId: id},
		method: "get",
		contentType: "application/json",
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