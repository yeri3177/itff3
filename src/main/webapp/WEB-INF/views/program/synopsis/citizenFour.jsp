<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />   <!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="프로그램" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/program/synopsis.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_">
				<a href="${pageContext.request.contextPath }/program/openClose.do" target="_top" style="font-weight: bold;">개·폐막작</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath }/program/ai.do" target="_top">인공지능</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/security.do">보안·암호학</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/deepRunning.do" target="_top">가상현실·딥 러닝</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/bigData.do" target="_top">빅 데이터·컴퓨팅</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/flatform.do" target="_top">플랫폼·사물 인터넷</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/debugging.do" target="_top">사고력·디버깅</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/programSearch.do" target="_top">#작품검색</a>
			</li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<div id="slide">
  <input type="radio" name="pos" id="pos1" checked>
  <input type="radio" name="pos" id="pos2">
  <input type="radio" name="pos" id="pos3">
  <input type="radio" name="pos" id="pos4">
  
  
  <ul>
  
    <li style="background-image: url(https://i.imgur.com/fNdCASM.png);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/Qcu-5MNJ0u4" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/uaLG2ZE.png);"></li>
    <li style="background-image: url(https://i.imgur.com/UGn7PBP.png); "></li>
    <li style="background-image: url(https://i.imgur.com/cRrI02O.png);"></li>
  </ul>
  <p class="pos">
 
    <label for="pos1"></label>
    <label for="pos2"></label>
    <label for="pos3"></label>
    <label for="pos4"></label>
  </p>
</div>



<div class="film_info">
   <div class="container_">
      <div class="film_info_top">
         <p class="director_name">
            시티즌포
         </p>
         <br />
		 <span>CitizenFour</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2014</li>
            <li>114min</li>
            <li>12 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Big data·Computing</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
			스노든이 2013년 1월 “시티즌포”라는 ID로 접촉해왔을 당시 포이트라스 감독은 2년 동안 정부 감시에 대한 영화를 작업 중이었다.
 스노든은 포이트라스가 오랫동안 정부 감시 리스트에 올라 공항을 이용할 때마다 심문을 당했지만 이에 굴하지 않았다는 사실을 알았기 때문에 포이트라스에게 접근했다.
 자신이 정보 기관의 수석 분석가이며 미국 국가안보국(NSA)의 미국인 대량 감시를 폭로하겠다는 뜻을 스노든이 밝히자 포이트라스는 그를 설득해 촬영을 하기로 한다.
 포이트라스와 그린월드, 스노든은 쏟아지는 언론의 관심을 피해가며 호텔방에 모여 자신과 주변 사람들의 인생에 커다란 영향을 줄 결정을 내린다
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>
				다큐멘터리 감독인 로라 포이트라스는 미국정부의 개인정보 수집과 감시와 관련한 영화를 작업 중이었다. 그런데 어느날 ‘CITIZENFOUR’라는 아이디를 가진 익명의 제보자가 접근한다. 그는 자신을 미 정보기관 소속이라고 밝힌다. 그리고 미국 국가안보국이 미국민과 외국인 등을 상대로 무차별 대량 통신 감청을 벌였다며 이를 폭로하겠다고 의사를 밝힌다. 이때부터 실제 내용을 폭로하기까지가 영상으로 생생하게 담기게 됐다.
‘CITIZENFOUR’라는 아이디를 벗고 모습을 드러낸 에드워드 스노든이 폭로한 내용은 경악할만한 내용들이었다. 미국이 다양한 감시프로그램을 운영 중이고, 구글, 페이스북 등 인터넷 사이트는 물론 각종 통신사 등을 통해 전 세계를 감청하고 있다는 사실이 밝혀졌다. 그리고 이를 증명하는 일급 기밀문서들이 쏟아진다. 광범위한 감청 범위와 정보 수집량은 상상을 초월했다. 결국 미국 정부는 에드워드 스노든을 보안법 위반과 간첩 혐의로 수배한다. 결국 에드워드 스노든은 러시아로 망명할 수밖에 없었다. 
            </p>
         </div>
      </div>
   </div>
</div>

<div class="schedule">
	<div class="container_">
		<table class=" tbl_schedule2 wid100">
			<thead>
				<tr>
					<th class="en">Code</th>
					<th class="en">Time</th>
					<th class="en">Theater</th>
					<th class="en">Grade</th>
					<th class="en">Event</th>
				</tr><tr>
			</tr></thead>
			<tbody>
				<c:forEach var="schedule" items="${movieSchedule}" varStatus="vs" >
					<tr onclick="goBooking('${schedule.startDate}', '${schedule.movieId}');">
						<td class="code en"><span class="code_wrap">${fn:substring(schedule.movieScheduleId,9,12) }</span></td>
						<th class="time en">${schedule.startDate} | ${schedule.startTime }</th>
						<td class="theater">KH ITFF ${schedule.theaterId}관</td>
						<td class="film_tit">
							<c:if test="${ageLimit eq '12 +'}">
								<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_12_x2.png" style="width:40px" alt="관람가"> 
							</c:if>
							<c:if test="${ageLimit eq '15 +'}">
								<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
							</c:if>
							<c:if test="${ageLimit eq '19 +'}">
								<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_18_x2.png" style="width:40px" alt="관람가"> 
							</c:if>
							<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
						</td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>

	</div>
</div>


<div class="container_">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="director">
				<h4>Director</h4>
				<ul class="director_list">
					<li>
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="dir_img">
								<img src="https://i.ibb.co/1bdXj77/1.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">로라 포이트러스</strong><span class="mt10 en">Laura Poitras</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								로라 포이트러스는 미국의 다큐멘터리 영화 감독이다. 에드워드 스노든을 다룬 다큐멘터리 영화 《시티즌포》로 2015년 아카데미 다큐멘터리 영화상을 수상하였다.
								</span>
							</p>
							</div>
						</div>
					</li>

				</ul>
			</div> <!-- // director -->
		</div>
	</div>	
		
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="credit">
				<h4>Credit</h4>
				<ul>
					<li>
						<strong class="en">Producer</strong>
						<span class="en">Mathilde Bonnefoy</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Eward Snowden, Laura Poitras</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en">David Menschel</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Mathilde Bonnefoy</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Kirsten Johnson</span>
					</li>
				</ul>
			</div> <!-- // credit -->
		</div>
	</div> <!-- // row -->
</div>


<!-- 모달비디오 -->

<div class="container">
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
        		</button>        
	        	<!-- 16:9 aspect ratio -->
				<div class="embed-responsive embed-responsive-16by9">
 					<iframe class="embed-responsive-item" src="" id="video"  allowscriptaccess="always" allow="autoplay"></iframe>
				</div>
         </div>
	    </div>
	  </div>
	</div> 
</div>

<script>
$(document).ready(function() {

	// Gets the video src from the data-src on each button

	var $videoSrc;  
	$('.video-btn').click(function() {
	    $videoSrc = $(this).data( "src" );
	});

	  
	  
	// when the modal is opened autoplay it  
	$('#myModal').on('shown.bs.modal', function (e) {
	    
	// set the video src to autoplay and not to show related video. Youtube related video is like a box of chocolates... you never know what you're gonna get
	$("#video").attr('src',$videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0" ); 
	})
	  


	// stop playing the youtube video when I close the modal
	$('#myModal').on('hide.bs.modal', function (e) {
	    // a poor man's stop video
	    $("#video").attr('src',$videoSrc); 
	}) 
	    
	    


	  
	  
	// document ready  
	});

	// 상영일정 클릭하면 해당 정보를 담은 예매페이지로 이동
	function goBooking(startDate, movieId) {
		window.location.href=`${pageContext.request.contextPath}/movie/booking.do?playdate=\${startDate}&movieId=\${movieId}`;
	};


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

   