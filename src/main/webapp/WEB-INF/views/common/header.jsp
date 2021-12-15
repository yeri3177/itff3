<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${param.title }</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />

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
							<ul class="list-inline">
								<li><a class="en" href="${pageContext.request.contextPath}/member/memberEnroll.do">JOIN</a></li>
								<li><a class="en" href="${pageContext.request.contextPath}/member/memberLogin.do">LOGIN</a></li>
							</ul>
						</div>

						<div class="hd_inner">
							<h1 class="logo" onclick="location.href='${pageContext.request.contextPath }'">
								<img src="https://i.ibb.co/jJFK12W/Untitled-12.png" alt="logo" class="logo_img"/>
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
											<li><a href="${pageContext.request.contextPath}/movie/movieList.do" class="" target="_top">프로그램</a>
												<ul>
													<li><a href="#" class="menu_drop">개·폐막작</a></li>
													<li><a href="#" class="menu_drop">인공지능</a></li>
													<li><a href="#" class="menu_drop">보안/암호학</a></li>
													<li><a href="#" class="menu_drop">가상현실/딥러닝</a></li>
													<li><a href="#" class="menu_drop">빅데이터/컴퓨팅</a></li>
													<li><a href="#" class="menu_drop">플랫폼/사물인터넷</a></li>
													<li><a href="#" class="menu_drop">사고력/디버깅</a></li>
													<li><a href="#" class="menu_drop">#작품검색</a></li>
												</ul>
											</li>
											<li><a href="#" class="" target="_top">이벤트</a></li>
											<li><a href="#" class="" target="_top">티켓 예매</a>
												<ul>
													<li><a href="#" class="menu_drop">빠른예매</a></li>
													<li><a href="#" class="menu_drop">상영시간표</a></li>
												</ul>
											</li>
											<li><a href="${pageContext.request.contextPath}/goods/goodsList.do" class="" target="_top">굿즈샵</a></li>
											<li><a href="#" class="" target="_top">커뮤니티</a>
												<ul>
													<li><a href="#" class="menu_drop">공지사항</a></li>
													<li><a href="#" class="menu_drop">네티즌리뷰</a></li>
													<li><a href="#" class="menu_drop">티켓나눔터</a></li>
													<li><a href="#" class="menu_drop">자주찾는질문</a></li>
													<li><a href="#" class="menu_drop">1:1문의</a></li>
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