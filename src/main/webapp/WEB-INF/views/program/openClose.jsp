<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="프로그램" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/program/openClose.css" />


<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="current ">
				<a href="${pageContext.request.contextPath }/program/openClose.do" target="_top">개폐막작</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">인공지능</a>
			</li>
			<li class="on_">
				<a href="#">보안/암호학</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">가상현실/딥 러닝</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">빅 데이터/컴퓨팅</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">플랫폼/사물 인터넷</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">사고력/디버깅</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">#작품검색</a>
			</li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->
<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">개폐막작</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div class="page page2-2">
	<div class=" container">
		<div class="cont">
			<div class="container-l inner">
				<div class="d3tab_basic">
					<ul class="tab_list list-inline tab_round">
						<li class="on"><a href="prog_list.asp?c_idx=353&amp;QueryStep=2">전체</a></li>
						<li><a href="prog_list.asp?c_idx=353&amp;sp_idx=509&amp;QueryStep=2">개막작</a></li>
						<li><a href="prog_list.asp?c_idx=353&amp;sp_idx=510&amp;QueryStep=2">폐막작</a></li>
					</ul>	
				</div>	
			</div>
		</div>

		<div class="container-l">
			<div id="pg_wrap">
				<div class="pgl row">			
					<div class="pg_li col-md-4  col-lg-3 col-xs-12">
						<a href="prog_view.asp?idx=55909&amp;c_idx=353&amp;sp_idx=509&amp;QueryStep=2" class="film_thumb">
							<img src="https://img.biff.kr/9611_DATA/FILM_PHOTO/2021/1628053788.jpg" class="poster" alt="행복의 나라로">
						</a>
						<span class="sectionName mt20">개막작</span>
						<div class="txtbox">
							<a href="prog_view.asp?idx=55909&amp;c_idx=353&amp;sp_idx=509&amp;QueryStep=2" class="film_tit">행복의 나라로</a>
							<small class="dir">Heaven: To the Land of Happiness</small>
							<div class="dir">
								<p class="dir_p">임상수 <span class="en">IM Sang-soo</span></p>
							</div>
							<ul class="film_info">
								<li class="en">Korea</li>
								<li class="en">2021</li>
								<li class="en">101min</li>
							</ul>
						</div>
					</div>					

					<div class="pg_li col-md-4  col-lg-3 col-xs-12">
						<a href="prog_view.asp?idx=55943&amp;c_idx=353&amp;sp_idx=510&amp;QueryStep=2" class="film_thumb">
							<img src="https://img.biff.kr/9611_DATA/FILM_PHOTO/2021/1630903356.jpg" class="poster" alt="매염방">
						</a>
						<span class="sectionName mt20">폐막작</span>
						<div class="txtbox">
							<a href="prog_view.asp?idx=55943&amp;c_idx=353&amp;sp_idx=510&amp;QueryStep=2" class="film_tit">매염방</a>
							<small class="dir">Anita</small>
							<div class="dir">
								<p>렁록만 <span class="en">Longman LEUNG</span></p>
							</div>
							<ul class="film_info">
								<li class="en">Hong Kong, China</li>
								<li class="en">2021</li>
								<li class="en">136min</li>
							</ul>
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

	