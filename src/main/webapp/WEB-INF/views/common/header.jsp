<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${param.title}</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f83d8937bb78b8df31e1796445fc8213&libraries=services,clusterer"></script>

<!-- bootstrap js: jquery load 이후에 작성할 것.-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />

<!-- sock.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"
	integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- stomp.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"
	integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 babel-standalone -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"
	integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용: babel-polyfill -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js"
	integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- toastr -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- bootstrap toast -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

<script>

toastr.options = {
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": true,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "100",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
		
$('#error').on('click', function(){
	toastr.error('error');
});
$('#warning').on('click', function(){
	toastr.warning('warning');
});
$('#success').on('click', function(){
	toastr.success('success');
});
$('#info').on('click', function(){
	toastr.info('info');
});

</script>


<script>

// 전역변수 설정
var socket  = null;

$(document).ready(function(){
	
    // 웹소켓 연결
    sock = new SockJS("<c:url value="/echo-ws"/>");

    sock.onopen = function() {
   		console.log('Info: connection opened.');
	};

	sock.onmessage = function(evt) {
   		console.log('Info: connection onmessage.');
   		console.log(evt.data);
   		onMessage(evt);
	};
   		
//    		toastr.info('[관리자 메세지]: ' + evt.data);

function onMessage(evt){
    var data = evt.data;
    
    // toast
    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true' style='position: absolute; width: 500px; right: 10; min-height: 150px;'>";
    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close' style='z-index: 999;'>";
    toast += "<span aria-hidden='true'>&times;</span></button>";
    toast += "</div> <div class='toast-body'>" + data + "</div></div>";
    
    $("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
    $(".toast").toast({"animation": true, "autohide": false});
    $('.toast').toast('show');
		};	
		
	sock.onclose = function(event) {
   		console.log('Info: connection closed');
	};
    
	sock.onerror = function(err) {
   		console.log('Error:', err);
	};
});

  		
</script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>
<body>
	<div id="container">
		<header>

			<!-- 20210616183643 -->

			<div id="siwffIndex">
				<a href="#cont"> 본문 바로가기 </a> <a href="#gnb"> 메뉴 바로가기 </a>
			</div>

			<div id="wrap">
				<div class="hd_bg"></div>
				<div class="bg_black"></div>
				<!-- // hd_bg -->

				<!-- Header -->
				<header id="hd" class="hd">

					<div class="container-l">

						<div class="util">
							<ul class="list-inline" style="display: flex; justify-content: flex-end;">
								
								<%-- 로그인하지 않았을 때 --%>
								<sec:authorize access="isAnonymous()">
									<li><button class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do';">JOIN</button></li>
									<li><button class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/member/memberLogin.do';">LOGIN</button></li>
								</sec:authorize>
								
								<%-- 로그인 했을 때 --%>
		    					<sec:authorize access="isAuthenticated()">
			    					<sec:authorize access="hasRole('ROLE_ADMIN')">
										<li><button class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/admin/adminManage.do';">ADMIN</button></li>
			    					</sec:authorize>
									<li><button class="btn btn-link" onclick="location.href='${pageContext.request.contextPath}/member/memberDetail.do';">MYPAGE</button></li>
									<form:form
							    		id="memberLogoutFrm"
							    		method="POST"
							    		action="${pageContext.request.contextPath}/member/memberLogout.do">
								    	<button class="btn btn-link" type="submit">LOGOUT</button>
				 				   </form:form>
		    					</sec:authorize>
		
		    					
							</ul>
						</div>

						<div class="hd_inner">
							<h1 class="logo" onclick="location.href='${pageContext.request.contextPath }'">
								<img src="https://i.imgur.com/fFC9orj.png" alt="logo" class="logo_img"/>
							</h1>

							<div class="f_r">
								<div id="gnb" class="gnb">
									<h2 class="screen_out">주 메뉴</h2>
									<nav id="menu">
										<ul class="list-inline depth1">
											<li><a href="${pageContext.request.contextPath }/intro/outline.do" class="" target="_top">ITFF2022</a>
												<ul>
													<li><a href="${pageContext.request.contextPath }/intro/outline.do" class="menu_drop">개요</a></li>
													<li><a href="${pageContext.request.contextPath }/intro/program.do" class="menu_drop">프로그램 소개</a></li>
													<li><a href="${pageContext.request.contextPath }/intro/greeting.do" class="menu_drop">집행위원장 인사말</a></li>
													<li><a href="#" class="menu_drop">포스터</a></li>
												</ul>
											</li>
											<li><a href="${pageContext.request.contextPath}/program/openClose.do" class="" target="_top">프로그램</a>
												<ul>
													<li><a href="${pageContext.request.contextPath}/program/openClose.do" class="menu_drop">개·폐막작</a></li>
													<li><a href="${pageContext.request.contextPath}/program/ai.do" class="menu_drop">인공지능</a></li>
													<li><a href="${pageContext.request.contextPath}/program/security.do" class="menu_drop">보안·암호학</a></li>
													<li><a href="${pageContext.request.contextPath}/program/deepRunning.do" class="menu_drop">가상현실·딥러닝</a></li>
													<li><a href="${pageContext.request.contextPath}/program/bigData.do" class="menu_drop">빅데이터·컴퓨팅</a></li>
													<li><a href="${pageContext.request.contextPath}/program/flatform.do" class="menu_drop">플랫폼·사물인터넷</a></li>
													<li><a href="${pageContext.request.contextPath}/program/debugging.do" class="menu_drop">사고력·디버깅</a></li>
													<li><a href="${pageContext.request.contextPath}/program/programSearch.do" class="menu_drop">#작품검색</a></li>
												</ul>
											</li>
											<li><a href="#" class="" target="_top">이벤트</a></li>
											<li><a href="#" class="" target="_top">티켓 예매</a>
												<ul>
													<li><a href="${pageContext.request.contextPath}/movie/booking.do" class="menu_drop">빠른예매</a></li>
													<li><a href="${pageContext.request.contextPath}/schedule/day1.do" class="menu_drop">상영시간표</a></li>
												</ul>
											</li>
											<li><a href="${pageContext.request.contextPath}/guide/openCloseGuide.do" class="" target="_top">행사 가이드</a>
												<ul>
													<li><a href="${pageContext.request.contextPath}/guide/openCloseGuide.do" class="menu_drop">개·폐막식 안내</a></li>
													<li><a href="${pageContext.request.contextPath}/guide/ticketGuide.do" class="menu_drop">티켓 안내</a></li>
													<li><a href="${pageContext.request.contextPath}/guide/theaterGuide.do" class="menu_drop">상영관</a></li>
													<li><a href="${pageContext.request.contextPath}/guide/trafficGuide.do" class="menu_drop">교통 안내</a></li>
												</ul>
											</li>
											<li><a href="${pageContext.request.contextPath}/goods/goodsList.do" class="" target="_top">굿즈샵</a>
												<ul>
													<li><a href="${pageContext.request.contextPath}/goods/goodsList.do" class="menu_drop">전체상품</a></li>
													<li><a href="${pageContext.request.contextPath}/goods/goodsQna.do" class="menu_drop">묻고 답하기</a></li>
													<li><a href="${pageContext.request.contextPath}/goods/sellerInfo.do" class="menu_drop">판매자정보</a></li>
												</ul>
											</li>
																		
											<li><a href="${pageContext.request.contextPath }/notice/noticeList.do" class="" target="_top">커뮤니티</a>
												<ul>
													<li><a href="${pageContext.request.contextPath}/notice/noticeList.do" class="menu_drop">공지사항</a></li>
													<li><a href="${pageContext.request.contextPath}/review/reviewList.do" class="menu_drop">네티즌리뷰</a></li>
													<li><a href="${pageContext.request.contextPath}/sharing/boardList.do" class="menu_drop">티켓나눔터</a></li>
													<li><a href="${pageContext.request.contextPath}/question/faq.do" class="menu_drop">자주찾는질문</a></li>
													<li><a href="${pageContext.request.contextPath}/question/questionList.do" class="menu_drop">1:1문의</a></li>
												</ul>
											</li>
										</ul>
									</nav>

								</div>
								<!--// gnb -->

							</div>
							<!-- // f_r 오른쪽 정렬 -->
						</div>
						<!-- // hd_inner -->
						
					</div>

				</header>
				<!--//header-->

				<section id="main-content">