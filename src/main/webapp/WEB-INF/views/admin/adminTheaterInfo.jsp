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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminTheaterInfo.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 관리자 헤더 -->
<jsp:include page="/WEB-INF/views/admin/common/adminSectionHeader.jsp"></jsp:include>

<!-- 영화 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminMovieNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-4">
				<h2 class="heading-section">상영관정보</h2>
			</div>
		</div>
		
		<div class="shadow-lg p-3 mb-5 rounded">
		<div class="container">
		  <div class="row">
		  <c:forEach items="${list}" var="list">  	
		    <div class="col-sm" data-toggle="modal" data-target="#adminTheaterDetail" onclick="theaterDetail_btn('${list.theaterId}');">
		      <p class="theaterId">${list.theaterId }관</p>
		      <p>${list.maxSeat }열</p>
		    </div>
		  </c:forEach>
		  </div>
		</div>
		</div>


		<!-- 상품 상세 -->
		<div class="modal fade" id="adminTheaterDetail" tabindex="-1"
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
		<!-- 상품 상세 끝 -->
		
<script>

// 상품 상세
function theaterDetail_btn(theaterId) {
	
	console.log(theaterId);
	var id = theaterId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminTheaterDetail.do",
		data: {theaterId: id},
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

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>