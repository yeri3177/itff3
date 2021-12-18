<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="프로그램" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/program/programCommon.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />


<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_">
				<a href="${pageContext.request.contextPath }/program/openClose.do" target="_top">개폐막작</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath }/program/ai.do" target="_top">인공지능</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/security.do">보안/암호학</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/deepRunning.do" target="_top">가상현실/딥 러닝</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/bigData.do" target="_top">빅 데이터/컴퓨팅</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/flatform.do" target="_top">플랫폼/사물 인터넷</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/debugging.do" target="_top" style="font-weight: bold;">사고력/디버깅</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/programSearch.do" target="_top">#작품검색</a>
			</li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->
<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">사고력/디버깅</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div class="page page2-2">
	<div class=" container">

		<div class="container-l">
			<div id="pg_wrap">
				<div class="pgl row">
					<!-- col-md-4  col-lg-3 -->			
					<div class="pg_li col-md-4  col-lg-3 col-xs-12" style="padding: 0">
						<a href="#" class="film_thumb">
							<img src="https://i.ibb.co/4MjNVZP/Erin-Brockovich-2000-1080p-Blu-Ray-H264-mp4-20200524-123152-359.jpg" class="poster" alt="에린 브로코비치">
						</a>
						<div class="fighting">
							<span class="sectionName mt20">개막작</span>
							<div class="txtbox">
								<a href="#" class="film_tit">에린 브로코비치</a>
								<small class="dir">Erin Brockovich</small>
								<div class="dir">
									<p class="dir_p">스티븐 소더버그 <span class="en">Steven Soderbergh</span></p>
								</div>
								<ul class="film_info">
									<li class="en">USA</li>
									<li class="en">2000</li>
									<li class="en">130min</li>
								</ul>
							</div>
						</div>
					</div>					

					<div class="pg_li col-md-4  col-lg-3 col-xs-12" style="padding: 0">
						<a href="#" class="film_thumb">
							<img src="https://i.ibb.co/1Gy9kx7/171-BBE4950-E6-AFE819.jpg" class="poster" alt="루퍼">
						</a>
						<div class="fighting">
							<span class="sectionName mt20">폐막작</span>
							<div class="txtbox">
								<a href="#" class="film_tit">루퍼</a>
								<small class="dir">Looper</small>
								<div class="dir">
									<p>라이언 존슨 <span class="en">Rian Johnson</span></p>
								</div>
								<ul class="film_info">
									<li class="en">USA, China</li>
									<li class="en">2012</li>
									<li class="en">118min</li>
								</ul>
							</div>
						</div>
					</div>					
				</div>	
			</div>	

			<div class="pagenation" style="display:none;">
				<i class="current">1</i>   
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	