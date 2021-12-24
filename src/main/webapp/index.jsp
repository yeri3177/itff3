<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<style>
section#main-content {
	background-color: #212121 !important;
}
</style>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<div class="container-l">
	<div class="container-visual">
	<div id="visual">
		<div class="visual-slider slick-initialized slick-slider slick-dotted">

			<div class="slick-list draggable">
				<div class="slick-track" style="opacity: 1; width: 1548px;">
					<div class="slick-slide slick-current slick-active"
						data-slick-index="0" aria-hidden="false" tabindex="0"
						role="tabpanel" id="slick-slide00"
						aria-describedby="slick-slide-control00"
						style="width: 1528px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1; margin: 0px;">
						<div class="visual_img">
								<img class="center-block" src="https://i.ibb.co/NKfCNgq/main.png" alt="logo">
						</div>

						<a href="#" tabindex="0">


							<div class="visual_txt">
								<div class="tit-l mt50">
									<p class="kor">
										제 1회 <br />정보기술영화제
									</p>
								</div>

								<div class="txt">2022. 1. 7(금)-1. 14(금)</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

</div>

<!-- 프로그램 슬라이드 시작 -->
<!-- 어떤 식으로 jsp 따서 돌렸는지 파악하고 db 준비되면 뿌리기 -->
<div class="cont_main">
<div class="pg">
<div class="sec">

	<!-- 이 부분 페이지 밀리면 안 없어지는데 추후 수정 예정 -->
	<div class="container-l">
		<h2 class="main_tit en">PROGRAM</h2>
	</div>

	<div class="container">
		<div class="pg_tit_wrap">
			<h3 class="main_sec_tit">ITFF</h3>
		</div>

		<div class="film_list">
			<div id="filmSlide1"
				class="film-slide slick-initialized slick-slider">

				<div class="slick-list draggable">
					<div class="slick-track"
						style="opacity: 1; width: 1800px; transform: translate3d(0px, 0px, 0px);">
						
						<!-- 반복 부분 돌리기 -->
						<!-- 반복 시작 -->
						<div class="film_li slick-slide slick-current slick-active"
							data-slick-index="0" aria-hidden="false" tabindex="0"
							style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.ibb.co/rkXG1Rc/image.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">에이 아이</p>
								<p class="dir">스티븐 스필버그</p>
							</div>
						</div>
						<!-- 반복 끝 -->
						
						<div class="film_li slick-slide slick-active" data-slick-index="1"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.ibb.co/rkXG1Rc/image.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">에이 아이</p>
								<p class="dir">스티븐 스필버그</p>
							</div>
						</div>
						
						<div class="film_li slick-slide slick-active" data-slick-index="2"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.ibb.co/rkXG1Rc/image.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">에이 아이</p>
								<p class="dir">스티븐 스필버그</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.ibb.co/rkXG1Rc/image.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">에이 아이</p>
								<p class="dir">스티븐 스필버그</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--// film_list -->
	</div>
</div>

<!-- 굿즈샵 배너 시작 -->
<div class="banner">
	<div class="banner-slide slick-initialized slick-slider slick-dotted">
		<div class="slick-list draggable">
			<div class="slick-track" style="opacity: 1; width: 2562px;">
				<div class="bn_inner bn1 slick-slide slick-current slick-active"
					style="width: 100%; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;"
					data-slick-index="0" aria-hidden="false" tabindex="0"
					role="tabpanel" id="slick-slide40"
					aria-describedby="slick-slide-control40"
					onclick="location.href='${pageContext.request.contextPath }'"> <!-- 이 부분 굿즈샵 링크 연결 -->
					<div class="container">
						<a href="#" target="_blank" tabindex="0">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- 굿즈샵 배너 끝 -->

<!-- //contents -->

<!-- 공지사항 -->
<div class="sec news">
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-xs-12">
				<ul class="news_tab">
					<li class="active"><a href="#" class="">공지사항</a></li>
				</ul>
			</div>
			<div class="col-md-9 col-xs-12">
				<ul class="news_list" id="notice">

				</ul>
			</div>
		</div>
		<h2 class="main_tit en">NEWS</h2>
	</div>
</div>
</div>

<script>

$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMainNotice.do",
		method: "GET",
		success: function(data) {
			$("#notice").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

</script>

<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/quickMenu.jsp"></jsp:include>