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
  
    <li style="background-image: url(https://i.imgur.com/7cn0arS.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/4W_jkjioxBA" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/s2p408w.jpg);"></li>
    <li style="background-image: url(https://i.imgur.com/BWSV1V9.jpg); "></li>
    <li style="background-image: url(https://i.imgur.com/8Id981O.jpg);"></li>
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
            미션임파서블: 고스트 프로토콜
         </p>
         <br />
		 <span>Mission: Impossible - Ghost Protocol </span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2011</li>
            <li>133min</li>
            <li>15 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Flatform·IoT</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
			지상 최대의 스케일, 사상 초유의 액션 불가능한 미션이 다시 시작된다! 러시아 크렘린 궁 폭발 테러 사건에 연루되어 위기를 맞게 된 IMF(Impossible Mission Force). 국가적 분쟁을 피하기 위해 정부는 IMF 조직에 대해 ‘고스트 프로토콜’을 발동하고, 조직의 과거도 정체도 모두 지워버린다. 순식간에 국제 테러리스트가 되어 버린 특수비밀요원 ‘이단 헌트’(톰 크루즈)는 자신과 조직의 명예를 되찾기 위해 지상 최대의 불가능한 미션을 다시 시작한다
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>
			《미션 임파서블: 고스트 프로토콜》(영어: Mission: Impossible – Ghost Protocol)은 2011년 미국의 첩보 액션 스릴러 영화이자 《미션 임파서블 시리즈》의 4번째 작품이다. 브래드 버드가 감독을 맡았다.[3] IMF 요원 에단 헌트 역을 맡은 톰 크루즈가 출연하며 제러미 레너, 사이먼 페그, 폴라 패튼이 팀원으로 출연한다. 안드레 네멕과 조시 애플바움이 각본을 썼으며, J. J. 에이브럼스, 브라이언 버크, 톰 크루즈가 제작 하였다. 시리즈 중 아이맥스 형식으로 제작된 첫 영화이다.
파라마운트 픽처스가 배급하여 2011년 1월 16일 북아메리카에서 공개되었으며, 작품에 대해 비평가들에게 높은 평가를 얻었다. 또한, 전 세계적으로 약 7억 달러의 흥행 수입을 내 시리즈에서 가장 많은 수입을 낸 영화가 되었다. 2012년 4월 17일, DVD와 블루레이가 발매되었다. 
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
								<img src="https://i.ibb.co/bP4pnmN/2.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">브래드 버드</strong><span class="mt10 en">Philip Bradley Bird</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								필립 브래들리 버드(Philip Bradley Bird, 1957년 9월 24일 ~ )는 아카데미상을 받은 적이 있는 미국의 애니메이션 제작자로, 픽사의 인크레더블 (2004)과 워너브라더즈의 아이언 자이언트 (1999)의 감독으로 잘 알려져 있다.
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
						<span class="en">J.J. Abrams</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Daniel Craig, Eva Green, Mads Mikkelsen</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en">Jeffrey Chernov</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Paul Hirsch</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Michael Giacchino</span>
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

   