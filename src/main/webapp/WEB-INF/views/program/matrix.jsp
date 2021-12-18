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
  <h1 class="tit_movie">매트릭스<span>The Matrix</span></h1>
  <input type="radio" name="pos" id="pos1" checked>
  <input type="radio" name="pos" id="pos2">
  <input type="radio" name="pos" id="pos3">
  <input type="radio" name="pos" id="pos4">
  
  
  <ul>
    <li>
    	<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary video-btn btn_play_trailer js-video-button" data-toggle="modal" data-src="https://www.youtube.com/embed/CSFUIGl0BL4" data-target="#myModal">
			▶
		</button>
	</li>
    <li></li>
    <li></li>
    <li></li>
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
            차이다 베리로트
         </p>
         <ul class="list_film_info list-inline">
            <li>핀란드, 스웨덴</li>
            <li>2020</li>
            <li>100min</li>
            <li>15 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Korean Premiere</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
         핀란드의 퀴어 예술가 토베 얀손에 대한 전기 영화. 토베는 화가로서 자신을 지지해 주지 않는 아버지와 갈등을 겪지만, 2차 세계 대전 도중 방공호에서 창작한 무민 캐릭터로 점차 명성을 쌓아간다. 한편, 연극 연출가 비비카 반들레르와의 만남과 관계는 토베의 삶과 예술에 중요한 영향을 가져 온다. 
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>&lt;토베 얀손&gt;은 ‘무민’ 시리즈의 창조자, 퀴어 예술가 토베 얀손의 2차 세계 대전의 막바지 시기부터 10여 년간 삶을 그리고 있다. 관객들이 가장 처음 보게 되는 것은 춤을 추듯 몽환적으로 또는 격렬하게 몸을 움직이는 토베의 모습이다. 그리고 곧 2차 세계 대전 한가운데 방공호에서 무민 캐릭터의 원형을 스케치하는 토베의 모습이 이어진다. 무민 시리즈의 탄생과 성공에 안착하기까지 토베 얀손의 작가적 경력이 영화의 원경이라면, 전경에는 여성 퀴어 예술가 토베 개인이 맺는 개인적 관계들과 그로 인한 불안과 긴장, 자아의 발견과 성장, 자유와 독립에 대한 갈망, 그리고 이 모든 것을 통과하며 발산되는 토베의 에너지와 얼굴 표정이 내세워진다. 거의 항상 인물에 가까이 다가가 있으며 시종일관 미세하게 흔들리고 있는 카메라는 이러한 영화적 구조를 뒷받침하며, 아버지와의 갈등, 비비카 반들레르와의 연애, 평생의 파트너 툴리키 피에틸레와의 만남이 어떻게 토베의 작품 세계에 불가분의 영감을 주는지 보여 준다. 린다 바스베리의 16mm 촬영은 투박함과 온화함을 동시에 전달하며, 영화의 엔딩에 삽입된 8mm 푸티지는 영화 내내 토베가 보여 준 자유로운 움직임과 활력, 생동감의 원천을 확인시켜 준다. [황미요조]&nbsp;</p>
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


				<tr>
					<td class="code en"><span class="code_wrap">105</span></td>
					<th class="time en">2021-08-27 | 17:10 - 18:50</th>
					<td class="theater">메가박스 상암월드컵경기장 1관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
						<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
					</td>
					<td class="event">
						<a href="javascript:alert('예매 기간이 아닙니다.')">
							<img src="https://siwff.or.kr/kor/img/cont/schedule/gogogo_x2.png" style="width:40px">
						</a>
					</td>
				</tr>				


				<tr>
					<td class="code en"><span class="code_wrap">304</span></td>
					<th class="time en">2021-08-29 | 10:50 - 12:30</th>
					<td class="theater">메가박스 상암월드컵경기장 4관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
						<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
					</td>
					<td class="event">
						<a href="javascript:alert('예매 기간이 아닙니다.')">
							<img src="https://siwff.or.kr/kor/img/cont/schedule/gogogo_x2.png" style="width:40px">
						</a>
					</td>
				</tr>				
	
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
								<img src="	https://siwff.or.kr/db/9908_db/DIRECTOR_PHOTO/d_37cdbf6d17c14d.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">차이다 베리로트</strong><span class="mt10 en">Zaida BERGROTH</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify"><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">1977년 출생. 핀란드 영화감독이자 각본가. &lt;마지막 카우보이&gt;(2009), &lt;좋은 아들&gt;(2011), &lt;마이애미&gt;(2017), &lt;마리아스 파라다이스&gt;(2019)로 토론토국제영화제에 초청되었고 부산국제영화제, 시카고국제영화제 등에서 수상했다.</span></p>
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
						<span class="en">Andrea Reuter, Aleksi Bardy</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en"> Cast Alma PÖYSTI, Krista KOSONEN, Shanti RONEY, Joanna HAARTTI, Robert ENCKELL, Kajsa ERNST, Jakob ÖHRMAN, Eeva PUTRO, Liisi TANDEFELT, Wilhelm ENCKELL</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en"> Linda Wassberg D.F.F.</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en"> Samu Heikkilä</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">  Matti Bye</span>
					</li>
					<li>
						<strong class="en">Sound</strong>
						<span class="en"> Micke Nyström</span>
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

   