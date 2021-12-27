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
  
    <li style="background-image: url(https://i.imgur.com/MFPmO6R.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/Ac7VlMsgPU4" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/EWHIAuD.jpg);"></li>
    <li style="background-image: url(https://i.imgur.com/RLzN4Tf.jpg); "></li>
    <li style="background-image: url(https://i.imgur.com/BsPZCHN.jpg);"></li>
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
            루퍼
         </p>
         <br />
		 <span>Looper</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2012</li>
            <li>118min</li>
            <li>15 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Thinking Power·Debugging</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
			완벽한 증거 소멸과 시체 처리를 위해 미래의 조직들은
 제거 대상들을 비밀리에 2044년에 활동하고 있는 ‘루퍼’라는 킬러들에게 보낸다.
 어느 날, 완벽한 임무수행으로 최고의 자리를 지켜내고 있는 킬러 ‘조(조셉 고든 레빗)’의 앞에 새로운 타겟이 등장한다. 그는 바로 ‘레인메이커’에 의해 살해 당한 아내를 다시 살려내고자 과거로 돌아온 30년 후의 바로 자신(브루스 윌리스인)임을 알게 되는데…
 미래의 나와 현재의 내가 만나는 순간, 피할 수 없는 시간 전쟁이 시작된다
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>
				놀라운 상상력과 화려한 볼거리로 무장된 SF장르는 할리우드 영화 전체의 역사라고 해도 과언이 아닐 만큼 항상 스크린 속 흥행 소재로 사랑 받아 왔다. 특히 ‘시간여행’이란 테마는 <터미네이터>를 시작으로 <백 투 더 퓨쳐><12 몽키즈><맨 인 블랙><나비 효과> 등에 이어, 최근 <인셉션><소스 코드>까지 다양한 표현 방식으로 그려져 왔으며, 놀라운 흥행 성적과 뛰어난 작품성으로 SF 장르의 든든한 소재 역할을 하고 있다. 이에 2012년, <루퍼>가 새로운 SF액션스릴러의 기준을 제시한다. 라이언 존슨 감독은 <루퍼>를 기획할 당시, 머리 속에 온통 SF에 대한 무궁무진한 영감들로 가득 차 있었다. 그는 ‘시간여행’이라는 매력적인 소재를 통해 가장 간단하면서도 신선한 스토리를 만들어내고 싶었는데 그의 이러한 열망은 현재와 미래의 동일 인물이 한 공간에서 만나는 설정을 통해 비로소 성공하게 된다. 특히 시공간을 초월한 시간전쟁을 보여줄 <루퍼>의 스토리는 그 어떤 SF 대작들보다 매우 세밀하고 탄탄함을 자랑한다. 미국의 ‘할리우드 리포터’가 “촘촘히 짜여진 매력적인 시간여행 스토리”라 극찬할 만큼 가장 근사한 시간여행을 그려낸 <루퍼>는 이 모든 것을 완벽한 발란스로 매끄럽게 표현해내며 새로운 센세이션을 예고하고 있다.
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
				<tr>
					<td class="code en"><span class="code_wrap">105</span></td>
					<th class="time en">2022-01-08 | 20:00</th>
					<td class="theater">KH ITFF 1관</td>
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
						<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
					</td>
					<td class="event">
					</td>
				</tr>				


				<tr>
					<td class="code en"><span class="code_wrap">304</span></td>
					<th class="time en">2022-01-09 | 09:00</th>
					<td class="theater">KH ITFF 5관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
						<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
					</td>
					<td class="event">
					</td>
				</tr>
				
				<tr>
					<td class="code en"><span class="code_wrap">304</span></td>
					<th class="time en">2022-01-10 | 10:00</th>
					<td class="theater">KH ITFF 3관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
						<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
					</td>
					<td class="event">
					</td>
				</tr>
				
				<tr>
					<td class="code en"><span class="code_wrap">304</span></td>
					<th class="time en">2022-01-10 | 20:00</th>
					<td class="theater">KH ITFF 5관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
						<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
					</td>
					<td class="event">
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
								<img src="https://i.ibb.co/0cKjwWw/375px-Star-Wars-The-Last-Jedi-Japan-Premiere-Red-Carpet-Rian-Johnson-38905282292-cropped.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">라이언 존슨</strong><span class="mt10 en">Rian Johnson</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
									라이언 존슨(영어: Rian Johnson, 1973년 12월 17일 ~ )은 미국의 영화 감독이다. 흔히 스타워즈 에피소드 8 《스타워즈: 라스트 제다이》의 감독으로 알려져 있으며, 이외의 연출작으로 초기작 《브릭》과 《블룸 형제 사기단》, SF 스릴러 《루퍼》, 퍼즐 미스터리 《나이브스 아웃》이 있다. 영화 외에는 드라마 《브레이킹 배드》의 3개 에피소드를 연출했다.
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
						<span class="en">Ram Bergman</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Joseph Gordon Levitt, Bruce Willis, Emily Blunt</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en">Steve Yedlin</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Bob Ducsay</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Nathan Johnson</span>
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

   