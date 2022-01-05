<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/intro/outline.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="current "><a
				href="${pageContext.request.contextPath }/intro/outline.do" target="_top" style="font-weight: bold;">
					개요</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/intro/program.do" target="_top">프로그램 소개</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/intro/greeting.do" target="_top">집행위원장
					인사말</a></li>
			<li class="on_"><a
				href="/kor/addon/10000001/page.asp?page_num=2795" target="_top">포스터</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">개요</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<!-- 개요 시작 -->
<div id="cont" class="cont_sub">

	<div>

		<!-- START CONTENTS -->
		<div class="intro">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<img alt="1회포스터" src="https://i.imgur.com/UlfKf3B.jpg"
							style="border: 1px solid #e3e3e3;">
					</div>
					<!-- // col-md-4 col-xs-12 -->
					<!-- 재두 추가 -->

					<div class="col-md-8 col-xs-12 intro_desc">
						<div class="inner">
							<div class="tit_sec">제1회 정보기술영화제</div>

							<div class="tbl_box">
								<div class="group">
									<div class="hdbox" style="">
										<strong class="tit">개최</strong>
									</div>

									<div class="subbox">
										<div>
											<p class="desc">2022년 1월 7일(금) ~ 1월 14일(금), 총 8일간</p>
										</div>
									</div>
								</div>

								<div class="group">
									<div class="hdbox" style="">
										<strong class="tit">장소 </strong>
									</div>

									<div class="subbox">
										<div>
											<p class="desc">KH극장, 강남점</p>
										</div>
									</div>
								</div>

								<div class="group">
									<div class="hdbox" style="">
										<strong class="tit">상영작</strong>
									</div>

									<div class="subbox">
										<div>
											<p class="desc">공식 선정작 13편</p>
										</div>
									</div>
								</div>

								<div class="group">
									<div class="hdbox" style="">
										<strong class="tit">주최 </strong>
									</div>

									<div class="subbox">
										<div>
											<p class="desc">KH정보교육원</p>
										</div>
									</div>
								</div>

								<div class="group">
									<div class="hdbox" style="">
										<strong class="tit">개최형식 </strong>
									</div>

									<div class="subbox" style="">
										<ul class="list_dot">
											<li>극장 상영 진행</li>
											<li>1편당 2~3회 상영</li>
											<li>아시아 콘텐츠&굿즈마켓 온/오프라인 동시 개최</li>
										</ul>
									</div>
								</div>

								<p>&nbsp;</p>
							</div>
						</div>
					</div>
				</div>

				<div style="text-align: justify">
					<div class="mt50 inner "
						style="border-top: 1px solid #e0e0e0; padding-top: 50px;">
						<div class="tit_sec border-bottom"> Information Technology </div>

						<div class="row mt30">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<p class="txt_headline">"정보기술"</p>

								<div class="desc mt20">
									<p>2022년 처음 시작되는 정보기술영화제는 영화를 통해 정보기술과 인간의 공존을 모색하고 미래를 위한
										대안과 실천을 논의하는 페스티벌로, 정보 기술을 소재로 다룬 국내외 우수 작품들을 선정하였습니다. 국내 유일의
										정보기술영화제, 제1회 정보기술영화제는 2022년 1월 7일부터 14일까지 열립니다.&nbsp;&nbsp;</p>
								</div>
							</div>
						</div>

						<div class="row mt50">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<p class="txt_headline">ITFF Brand Identity</p>

								<div class="desc mt20">
									<p>정보기술영화제의 브랜드 아이덴티티는 곡선의 아름다움을 활용했고, 간결한 라인으로 표현했다. 어두운
										남색을 중심으로 한 다양한 컬러 활용은 정보기술영화제가 담고 있는 공존, 평화, 혁신의 여러 가치를 담고 있다.</p>
									<img src="https://i.imgur.com/jm3vCrf.png" alt="logo"
										class="logo1" />
								</div>
							</div>
						</div>
					</div>

					<div class="row mt50">
						<div class="col-md-12 col-sm-12 col-xs-12" style="display: flex; justify-content: space-evenly;">
						<div>
							<p class="txt_headline">기본형</p>
							<br />
							<div class="desc mt20">
								<img src="https://i.imgur.com/32HU2Lz.png" alt="basic_logo" class="itff_logo" />
							</div>
						</div>
							<div>
							<p class="txt_headline">응용형</p>
							<div class="desc mt20">
								<img src="https://i.imgur.com/Ha05Pws.png" alt="basic_logo" class="itff_logo" />
							</div>
							</div>

							<div>
							<p class="txt_headline">앰뷸럼</p>
							<div class="desc mt20">
								<img src="https://i.imgur.com/067fEiX.png" alt="basic_logo" class="itff_logo" style="width: 300px;" />
							</div>
							</div>							
						</div>
					</div>
				</div>
				<!-- // container -->
			</div>
			<!-- // intro -->
			<!-- //END CONTENTS -->
		</div>

		<p>&nbsp;</p>


	</div>
	<!-- //contents -->
</div>


<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>