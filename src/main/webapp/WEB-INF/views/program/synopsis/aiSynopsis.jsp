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
  
    <li style="background-image: url(https://i.imgur.com/qOLVXPo.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/A-0LqKa8TGM" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/knt0GBI.jpg);"></li>
    <li style="background-image: url(https://i.imgur.com/1DIaSE5.jpg); "></li>
    <li style="background-image: url(https://i.imgur.com/s0xynZw.jpg);"></li>
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
            에이아이
         </p>
         <br />
		 <span>A.I.</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2001</li>
            <li>146min</li>
            <li>15 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Artificial Intelligence</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
         인간의 기억마저 AI에 의해 입력되고 삭제 되는 세상.진짜보다 더 진짜 같은 가상 현실 ‘매트릭스’ 그 속에서 진정한 현실을 인식할 수 없게 재배되는 인간들. 그 ‘매트릭스’를 빠져 나오면서 AI에게 가장 위험한 인물이 된 '모피어스’는 자신과 함께 인류를 구할 마지막 영웅 ‘그’를 찾아 헤맨다. 마침내 ‘모피어스’는 낮에는 평범한 회사원으로, 밤에는 해커로 활동하는 청년 ‘네오’를 ‘그’로 지목하는데… 꿈에서 깨어난 자들, 이제 그들이 만드는 새로운 세상이 열린다. 
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>&lt;에이아이&gt;
            는 2001년에 개봉된 스티븐 스필버그가 감독한 미국의 공상 과학 영화이다. 각본은 스필버그가 1969년 발표 된 브라이언 올디스의 단편 소설 《Super Toys Last All Summer Long》을 원작으로 이안 왓슨가 함께 썼다. 이 영화는 1983년 스탠리 큐브릭이 구상한 미완의 프로젝트였으며, 큐브릭은 이 영화가 제작되기 직전에 사망했다. 헤일리 조엘 오스먼트, 주드 로, 프랜시스 오코너, 브렌던 글리슨와 윌리엄 허트가 출연했다. 지구가 물에 잠긴 먼 미래를 배경으로, 감정을 가진 소년 로봇 데이비드가 잃어버린 엄마의 사랑을 되찾기 위해 벌이는 모험을 그린 이 영화는 새턴 영화제에서 최우수 공상 과학 영화상을 수상하였고, 미국 아카데미상에서 최우수 특수 효과상와 음악상 부문 후보에 올랐다.
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
				</tr>
			</thead>
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
								<img src="https://i.ibb.co/5rBgYmP/375px-Steven-Spielberg-by-Gage-Skidmore.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">스티븐 스필버그</strong><span class="mt10 en">Steven Allan Spielberg</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								미국의 영화 감독, 각본가, 영화 프로듀서이다. 드림웍스의 공동 창립자이다. 스필버그는 1993년 &lt;쉰들러 리스트&gt;와 1998년 &lt;라이언 일병 구하기&gt;로 아카데미 감독상을 받았다. 타임지는 그를 '20세기의 가장 중요한 인물 100인'에 올렸다. 2011년 해즈브로가 주최한 트랜스포머 명예의 전당에 입성하였다.
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
						<span class="en">Kathleen Kennedy</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en"> Haley Joel Osment, Jude Law, Frances O'Connor</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en"> Jan Harlan</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Steven Spielberg</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Janusz Kaminski</span>
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

   