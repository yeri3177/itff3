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

<jsp:include page="/WEB-INF/views/common/popup.jsp"></jsp:include>

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
	<div id="msgStack"></div>
	<div id="visual">
		<div class="visual-slider slick-initialized slick-slider slick-dotted">

			<div class="slick-list draggable">
				<div class="slick-track" style="opacity: 1; width: 1548px;">
					<div class="slick-slide slick-current slick-active"
						data-slick-index="0" aria-hidden="false" tabindex="0"
						role="tabpanel" id="slick-slide00"
						aria-describedby="slick-slide-control00"
						style="width: 1528px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1; margin: 0px;">
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
		<h2 class="main_tit en program" style="background-color: #212121;">PROGRAM</h2>
	</div>

	<div class="container">
		<div class="pg_tit_wrap">
			<h3 class="main_sec_tit">ITFF</h3>
		</div>

		<div class="film_list">
			<div id="filmSlide1" class="film-slide slick-initialized slick-slider" style="height: 350px;">
			<button type="button" class="film-slick-arrow film-slick-prev slick-arrow" style="display: block;">Previous</button>

				<div class="slick-list draggable" id="slider-container">
				<button type="button" class="film-slick-arrow film-slick-next slick-arrow" style="display: block;">Next</button>
<!-- 					<div class="slick-track" style="opacity: 1; width: 1800px; transform: translate3d(0px, 0px, 0px);"> -->
					<div class="slick-track" id="slider-scroller">
						
						<!-- 반복 부분 돌리기 -->
						<!-- 반복 시작 -->
						<div class="film_li slick-slide slick-current slick-active"
							data-slick-index="0" aria-hidden="false" tabindex="0"
							style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/O9bD3Tb.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">아이, 로봇</p>
								<p class="dir">알렉스 프로야스</p>
							</div>
						</div>
						<!-- 반복 끝 -->
						
						<div class="film_li slick-slide slick-active" data-slick-index="1"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/yVJ0cgo.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">이글아이</p>
								<p class="dir">D.J.커루소</p>
							</div>
						</div>
						
						<div class="film_li slick-slide slick-active" data-slick-index="2"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/cpXNwP2.jpg"
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
									src="https://i.imgur.com/zrU0uIj.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">패스워드</p>
								<p class="dir">피터 호윗</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/v1jO7Ag.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">가타카</p>
								<p class="dir">앤드류 니콜</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/NJOvXw0.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">13층</p>
								<p class="dir">조세프 루스낵</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/IAPZHFR.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">매트릭스</p>
								<p class="dir">워쇼스키 형제</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/wd08k8i.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">그녀</p>
								<p class="dir">스파이크 존즈</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/wTocWM1.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">시티즌포</p>
								<p class="dir">피터 호윗</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/My5qWd0.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">007:카지노 로얄</p>
								<p class="dir">마틴 캠벨</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/DAtzvdf.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">미션 임파서블: 고스트 프로토콜</p>
								<p class="dir">브래드 버드</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/UKV6fJF.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">에린 브로코비치</p>
								<p class="dir">스티븐 소더버그</p>
							</div>
						</div>
						<div class="film_li slick-slide slick-active" data-slick-index="3"
							aria-hidden="false" tabindex="0" style="width: 430px;">
							<div class="thumb">
								<a
									href="#"
									tabindex="0"><img
									src="https://i.imgur.com/fzx2KUz.jpg"
									alt="still"></a>
							</div>
							<div class="txtbox">
								<p class="tit">루퍼</p>
								<p class="dir">라이언 존슨</p>
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
			<div class="slick-track">
				<div class="bn_inner bn1 slick-slide slick-current slick-active"
					style="width: 100%; height: 300px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;"
					data-slick-index="0" aria-hidden="false" tabindex="0"
					role="tabpanel" id="slick-slide40"
					aria-describedby="slick-slide-control40"
					onclick="location.href='${pageContext.request.contextPath }/goods/goodsList.do'"> <!-- 이 부분 굿즈샵 링크 연결 -->
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

<!-- 이메일 구독 -->
<div class="newsletter-sns" id="newsletter">
  <div class="container">
    <div class="main-sns col-md-6">
      <h2>newsletter</h2>
	<h5>정보기술영화제의 최근 소식과 다양한 정보들을<br>빠르고 간편하게 만나보세요</h5>	
    </div>
	  <div class="main-newsletter col-md-6">
       <!-- RD Mailform-->
       <form action="">
      <div class="form-wrap">
        <label>Your e-mail...</label>
        <input class="form-input form-control-has-validation form-control-last-child" id="email" type="email" name="email" placeholder="e-mail" data-constraints="@Email @Required">
        <button class="btn btn-sm btn-secondary" onclick="gosave();">구독신청</button>
      </div>
       </form>
    </div>
    
  </div>
</div>

<!-- 제작 지원 
<div class="wrapper">
	<div class="photobanner">
  <img class="first" src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;" />
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;" />
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;" />
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;" />
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;" />
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
  <img src="https://i.imgur.com/NmlS9jo.png" alt="" style="width: 200px; height: 50px;"/>
</div>
</div>
-->

		<!-- chat modal -->
		<div class="modal fade" id="chat" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document"
				style="max-width: 500px;">
				<div class="modal-content" style="text-align: left;">
				   	<div class="modal-body" id="modal_ajax1">
				    		  
					</div>

					</div>
				</div>
			</div>

<script>

$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/notice/mainNotice.do",
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

<script>

function slideSlider(){
	  $("#slider-scroller").css({"left":"0%","transition":"all 0s linear"});
	  $("#slider-scroller").css({"left": String(parseInt($("#slider-scroller").css("left")) - 800) + "px","transition":"all 13s linear"});
	  setTimeout(function(){moveSliderItem()}, 3435);
	}

	function moveSliderItem(){
	  $("#slider-scroller div").first().detach().appendTo($("#slider-scroller"));
	  slideSlider();
	}

	slideSlider();
	
</script>

<script>

// 메일 구독
function gosave() {
	alert('구독이 완료되었습니다.');
}

</script>
 
<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/quickMenu.jsp"></jsp:include>