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

<div id="slide">
  <input type="radio" name="pos" id="pos1" checked>
  <input type="radio" name="pos" id="pos2">
  <input type="radio" name="pos" id="pos3">
  <input type="radio" name="pos" id="pos4">
  
  
  <ul>
  
    <li style="background-image: url(https://i.imgur.com/8NWIYEB.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/rL6RRIOZyCM" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/fz1qRQ2.jpg);"></li>
    <li style="background-image: url(https://i.imgur.com/5By7mmo.jpg); "></li>
    <li style="background-image: url(https://i.imgur.com/kwCU8tB.jpg);"></li>
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
      	 <!-- <h1 class="tit_movie">매트릭스<span>The Matrix</span></h1> -->
         <p class="director_name">
            아이, 로봇
         </p>
         <br />
		 <span>i, Robot</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2004</li>
            <li>110min</li>
            <li>12 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Artificial Intelligence</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
         영화의 배경은 가까운 미래인 2035년의 시카고이다. 로봇회사 USR의 신형 로봇 모델인 'NS-5'의 출시를 앞두고, 개발자인 래닝 박사(제임스 크롬웰)가 숨지는 사건이 발생한다. 형사인 델 스프너(윌 스미스)가 수사를 개시하고, 캘빈 박사(브리짓 모이나한)가 이를 도우면서 이야기가 시작된다. 
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>&lt;아이로봇&gt;
            은 할리웃 톱스타 윌 스미스의 출연 뿐 아니라 아카데미 수상을 통해 실력을 인정받은 스텝들의 참여로 제작 초기부터 이슈를 만들었다. 수많은 뮤직 비디오 제작과 SF영화 &lt;다크 시티&gt;와 &lt;크로우&gt; 등에서 보여준 감각적인 영상미로 두터운 팬층을 확보하고 있는 알렉스 프로야스 감독과 &lt;글라디에이터&gt;로 아카데미 비주얼 효과상을 수상한 존 넬슨, &lt;반지의 제왕&gt;으로 역시 아카데미에서 수상한 뉴질랜드의 비주얼 이펙트 팀 WETA, 그리고 &gt;인디펜던스 데이&gt;의 타투포우로스가 그 핵심 멤버. 그들이 &lt;아이,로봇&gt; 제작에 참여한다는 소식이 전해지자 SF영화 팬들은 지금껏 보여지지 않은 새로운 스타일의 영화를 볼 수 있을 거란 기대감에 열광했다. 지금까지 그려진 미래와 전혀 다른 미래 세계를 만들고 싶어하는 프로야스 감독의 깐깐한 눈높이를 맞추기 위해 스텝들은 영화 전반에 걸쳐 로케이션 촬영과 특별 제작된 세트, CG를 병행해야만 했다. 이는 최첨단 기술로 만들어진 디지털 캐릭터인 "써니" 뿐 아니라 다른 로봇들이 등장하는 1000커트가 넘는 장면들을 고작 수백명의 엑스트라를 동원해 수만의 로봇들로 재창조하는 과정을 통해 &lt;아이,로봇&gt;은 CG 역사상 가장 복잡하고 다양한 형태의 테크닉이 총동원된 기록을 남겼다.
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
					<tr>
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
								<img src="https://i.ibb.co/cxYm5JP/11-48-58-568f239a83fde-X252-310.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">알렉스 프로야스</strong><span class="mt10 en">Alex Proyas</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								10살 때 영화를 만들기 시작했고 두 편의 단편 '소녀 자신의 이야기'(1984년)와 그가 촬영한 '열정의 순간'(1985년)을 작업했다. 스피릿 오브 에어, 그렘린스 오브 더 클라우드 (1987)는 프로야스의 감독 겸 시나리오 작가로서의 장편 데뷔작이었다.
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
						<span class="en">Laurence Mark</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Will Smith, Bridget Moynahan, Bruce Greenwood</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en">Will Smith</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Akiva Goldsman </span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Wyck Godfrey </span>
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




</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

   