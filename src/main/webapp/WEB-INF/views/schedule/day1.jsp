<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/schedule/schedule.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />


<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_">
				<a href="${pageContext.request.contextPath}/movie/booking.do" target="_top">빠른예매</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath }/schedule/day1.do" target="_top" style="font-weight: bold;">상영시간표</a>
			</li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">상영시간표</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
<div class="d3tab_basic">
	<ul id="depth3" class="depth3_ul">
		<li class="depth3_li on 1_0"><a
			href="${pageContext.request.contextPath }/schedule/day1.do" target="_top" style="color: white; background-color: #212121; border-color: #212121;">1월 7일</a></li>
		<li class="depth3_li on_1_1"><a
			href="${pageContext.request.contextPath }/schedule/day2.do" target="_top">1월 8일</a></li>
		<li class="depth3_li on_1_2"><a
			href="${pageContext.request.contextPath }/schedule/day3.do" target="_top">1월 9일</a></li>
		<li class="depth3_li on_1_3"><a
			href="${pageContext.request.contextPath }/schedule/day4.do" target="_top">1월 10일</a></li>
		<li class="depth3_li on_1_4"><a
			href="${pageContext.request.contextPath }/schedule/day5.do" target="_top">1월 11일</a></li>
		<li class="depth3_li on_1_5"><a
			href="${pageContext.request.contextPath }/schedule/day6.do" target="_top">1월 12일</a></li>
		<li class="depth3_li on_1_6"><a
			href="${pageContext.request.contextPath }/schedule/day7.do" target="_top">1월 13일</a></li>
		<li class="depth3_li on_1_7"><a
			href="${pageContext.request.contextPath }/schedule/day8.do" target="_top">1월 14일</a></li>
	</ul>
</div>

<div class="page page3-1">

	<section class="schedule">

		<div class="schedule_hd hide">


			<!--h3 class="txt_tit txt-center">상영시간표</h3-->
			<div class="schedule_tab">
				<div class="container">
					<ul class="sch_1depth list-inline">
						<li class="on"><a href="/kor/html/schedule/date.asp?day1=21">날짜별</a></li>
						<li class=""><a
							href="/kor/html/schedule/theater.asp?s_theater=BT">극장별</a></li>
						<li class=""><a
							href="/kor/html/schedule/section.asp?sc_idx=353">섹션별</a></li>
					</ul>
				</div>
			</div>




			<div class="schedule_tab_sec" style="">
				<div class="container">
					<ul class="sch_2depth list-inline">

						<li class=" on"><a href="date.asp?day1=6" target="_self"><span
								class="date">6 </span> 수 </a></li>

						<li class=""><a href="date.asp?day1=7" target="_self"><span
								class="date">7 </span> 목 </a></li>

						<li class=""><a href="date.asp?day1=8" target="_self"><span
								class="date">8 </span> 금 </a></li>

						<li class=""><a href="date.asp?day1=9" target="_self"><span
								class="date">9 </span> 토 </a></li>

						<li class=""><a href="date.asp?day1=10" target="_self"><span
								class="date">10 </span> 일 </a></li>

						<li class=""><a href="date.asp?day1=11" target="_self"><span
								class="date">11 </span> 월 </a></li>

						<li class=""><a href="date.asp?day1=12" target="_self"><span
								class="date">12 </span> 화 </a></li>

						<li class=""><a href="date.asp?day1=13" target="_self"><span
								class="date">13 </span> 수 </a></li>

						<li class=""><a href="date.asp?day1=14" target="_self"><span
								class="date">14 </span> 목 </a></li>

						<li class=""><a href="date.asp?day1=15" target="_self"><span
								class="date">15 </span> 금 </a></li>

					</ul>
				</div>
			</div>

		</div>

		<!-- include file="navi_schedule.asp" -->

		<div class="cont">
			<div class="container">
				<div class="grade_info">
					<div>
						<ul class="list-inline">
							<li><span class="ico_grade ico_g"></span>전체관람가</li>
							<li><span class="ico_grade ico_12"></span>만 12세 미만 관람불가</li>
							<li><span class="ico_grade ico_15"></span>만 15세 미만 관람불가</li>
							<li><span class="ico_grade ico_19"></span>만 18세 미만 관람불가</li>
						</ul>
					</div>

					<div>
						<ul class="list-inline">
							<li><span class="ico_grade ico_ke"></span>한글자막+영어자막/대사</li>
							<li><span class="ico_grade ico_kn"></span>한글자막+비영어대사</li>
							<li><span class="ico_grade ico_kk"></span>시·청각장애인을 위한
								배리어프리자막상영</li>
							<li><span class="ico_grade ico_no"></span>대사없음</li>
							<li><span class="ico_grade ico_blank"></span>무표시 : 영어자막 +
								한국어대사</li>
						</ul>
					</div>

				</div>

				<div class="tbl_schedule_wrap">

					<div id="loading">
						<div class="modalpopup">

							<div class="load-3">
								<div class="line"></div>
								<div class="line"></div>
								<div class="line"></div>
							</div>

						</div>
					</div>
					<div class="tbl_schedule_top">
						<div class="pull-left">
							<h3 class="tit_schedule">

								<span class="en">상영시간표</span>
							</h3>

						</div>

					</div>


					<!-- 상영시간표 내용 -->
					<div class="tbl_schedule_wrap">

						<div class="tbl_schedule tbl_schedule_date">



							<div class="sch_li">
								<div class="sch_li_tit">KH극장</div>

								<div class="sch_it sch_it1 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>
								
								<div class="sch_it sch_it2 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>
								
								<div class="sch_it sch_it3 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>
								
								<div class="sch_it sch_it4 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>

								<div class="sch_it sch_it5 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>

								<div class="sch_it sch_it6 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>

								<div class="sch_it sch_it7">
									<span class="code en">007</span>
									<p class="time en">15:00</p>
									<div class="film_tit">
										<a
											href="${pageContext.request.contextPath }/program/synopsis/matrix.do?movieId=007"><span
											class="film_tit_kor">매트릭스</span><span
											class="film_tit_eng en">The Matrix</span></a>
											(개막작)
									</div>
									<div class="grade">
										<span class="ico_grade ico_15" title="15세 이상 관람가"></span>
										<span class="ico_grade ico_ke" title="한글자막+영어자막/대사"></span>
										<span class="ico_grade ico_kk" title="시·청각장애인을 위한 배리어프리자막상영"></span>
									</div>
								</div>

								<div class="sch_it sch_it8">
									<span class="code en">001</span>
									<p class="time en">15:30</p>
									<div class="film_tit">
										<a
											href="${pageContext.request.contextPath }/program/synopsis/iRobot.do?movieId=001"><span
											class="film_tit_kor">아이, 로봇</span><span
											class="film_tit_eng en">I, Robot</span></a>
									</div>
									<div class="grade">
										<span class="ico_grade ico_12" title="12세 이상 관람가"></span>
										<span class="ico_grade ico_ke" title="한글자막+영어자막/대사"></span>
										<span class="ico_grade ico_kk" title="시·청각장애인을 위한 배리어프리자막상영"></span>
									</div>
								</div>

								<div class="sch_it sch_it9">
									<span class="code en">002</span>
									<p class="time en">16:00</p>
									<div class="film_tit">
										<a
											href="${pageContext.request.contextPath }/program/synopsis/eagleEye.do?movieId=002"><span
											class="film_tit_kor">이글아이</span><span
											class="film_tit_eng en">Eagle Eye</span></a>
									</div>
									<div class="grade">
										<span class="ico_grade ico_12" title="12세 이상 관람가"></span>
										<span class="ico_grade ico_ke" title="한글자막+영어자막/대사"></span>
										<span class="ico_grade ico_kk" title="시·청각장애인을 위한 배리어프리자막상영"></span>
									</div>
								</div>
								
								<div class="sch_it sch_it10 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>

								<div class="sch_it sch_it11 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>

								<div class="sch_it sch_it12 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>


								<div class="sch_it sch_it13">
									<span class="code en">013</span>
									<p class="time en">18:30</p>
									<div class="film_tit">
										<a
											href="${pageContext.request.contextPath }/program/synopsis/looper.do?movieId=013"><span
											class="film_tit_kor">루퍼</span><span
											class="film_tit_eng en">Looper</span></a>
									</div>
									<div class="grade">
										<span class="ico_grade ico_19" title="18세 이상 관람가"></span>
										<span class="ico_grade ico_ke" title="한글자막+영어자막/대사"></span>
										<span class="ico_grade ico_kk" title="시·청각장애인을 위한 배리어프리자막상영"></span>
									</div>
								</div>

								<div class="sch_it sch_it14">
									<span class="code en">008</span>
									<p class="time en">19:00</p>
									<div class="film_tit">
										<a
											href="${pageContext.request.contextPath }/program/synopsis/her.do?movieId=008"><span
											class="film_tit_kor">그녀</span><span
											class="film_tit_eng en">Her</span></a>
									</div>
									<div class="grade">
										<span class="ico_grade ico_15" title="15세 이상 관람가"></span>
										<span class="ico_grade ico_ke" title="한글자막+영어자막/대사"></span>
										<span class="ico_grade ico_kk" title="시·청각장애인을 위한 배리어프리자막상영"></span>
									</div>
								</div>

								<div class="sch_it sch_it15">
									<span class="code en">004</span>
									<p class="time en">19:30</p>
									<div class="film_tit">
										<a
											href="${pageContext.request.contextPath }/program/synopsis/password.do?movieId=004"><span
											class="film_tit_kor">패스워드</span><span
											class="film_tit_eng en">Antitrust</span></a>
									</div>
									<div class="grade">
										<span class="ico_grade ico_12" title="12세 이상 관람가"></span>
										<span class="ico_grade ico_ke" title="한글자막+영어자막/대사"></span>
										<span class="ico_grade ico_kk" title="시·청각장애인을 위한 배리어프리자막상영"></span>
									</div>
								</div>
								
								<div class="sch_it sch_it16 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>
								
								<div class="sch_it sch_it17 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>
								
								<div class="sch_it sch_it18 blank_wrap">
								<span class="sch_it_blank"></span>
								</div>

							</div>

						</div>

					</div>

					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td align="right">
									<!--a href="javascript:pageprint(10-06)"><img src='/kor/img/schedule/btn_print.gif' border=0 vspace=6-->
								</td>
							</tr>
						</tbody>
					</table>

					<br>
					<br>
					<div class="caution_box mt50">
						<div class="row">
							<div class="col-md-2 col-xs-12">
								<p class="tit tit-sec bold mt10">※ 유의사항</p>
							</div>
							<div class="col-md-10 col-xs-12">
								<ul class="list_secondary mt10">
									<!-- li>2017년부터 메가박스 해운대역점의 영업종료로 인해 메가박스 해운대(장산)으로 상영관이 변동되었으니 이점 유의 바랍니다.<br>메가박스 해운대(장산)은 지하철 장산역 NC백화점 8층에 있습니다.</li -->
									<li>GV(게스트와의 만남)는 사전 고지없이 변동될 수 있습니다.</li>
									<li>5세 미만의 어린이는 입장하실 수 없습니다.</li>
									<li>모든 촬영기기는 저작권 보호법에 의해 상영관 내 반입하실 수 없으며, 촬영을 금지합니다.</li>
									<li>상영 시작 이후 15분까지는 입장을 허용합니다. <!-- (단, 영화 상영 시작 이후에는 환불이 불가능합니다.) -->
										<!-- &nbsp;
				<a href="/kor/addon/10000001/page.asp?page_num=561" class="btn btn-xs btn-secondary">정시입장제완화 안내</a> --></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</section>

	<script>
		$("#sub > .location").css("display", "none");
	</script>




</div>

<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>