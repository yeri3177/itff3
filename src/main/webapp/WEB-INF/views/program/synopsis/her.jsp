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
  
    <li style="background-image: url(https://i.imgur.com/x1ywZN3.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/NHA69lCd1ZM" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/IhW1Kfw.jpg);"></li>
    <li style="background-image: url(https://i.imgur.com/Up22m9y.jpg); "></li>
    <li style="background-image: url(https://i.imgur.com/beozcZM.jpg);"></li>
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
            그녀
         </p>
         <br />
		 <span>Her</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2013</li>
            <li>126min</li>
            <li>15 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Big data·Computing</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
         다른 사람의 편지를 써주는 대필 작가로 일하고 있는 ‘테오도르’는 타인의 마음을 전해주는 일을 하고 있지만 정작 자신은 아내와 별거 중인 채 외롭고 공허한 삶을 살아가고 있다.
어느 날, 스스로 생각하고 느끼는 인공지능 운영체제 ‘사만다’를 만나게 되고, 자신의 말에 귀를 기울이며 이해해주는 ‘사만다’로 인해 조금씩 상처를 회복하고 행복을 되찾기 시작한 ‘테오도르’는 어느새 점점 그녀에게 사랑의 감정을 느끼게 되는데 
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>
				소통의 부재 속에서 외롭게 살아가는 작가와 스스로 생각하고 느끼며 성장하는 운영체제의 사랑과 소통을 그린 독창적인 러브 스토리 <그녀>는 해외 유수의 영화제에서 인정 받고 있는 스파이크 존즈 감독의 화제작으로 전세계 평단의 뜨거운 호평 속에 올해 가장 독창적인 로맨스라는 찬사를 받고 있는 작품이다. 스파이크 존즈 감독은 이 영화로 제86회 아카데미 각본상, 제71회 골든글로브 각본상, 미국작가협회 각본상, 센트럴오하이오비평가협회 작품상, 디자인상, 촬영상, 음악상을 수상하고 오스틴비평가협회 작품상, 각본상, 심사위원상, 특별명예상을 비롯한 전세계 유수의 영화제에서 43개 상을 휩쓸며 해외 언론과 평단들의 끊임없는 찬사를 받았다. 
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
								<img src="https://i.ibb.co/h74jjkg/image.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">스파이크 존즈</strong><span class="mt10 en">Spike Jonze</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								1969년 미국에서 태어난 스파이크 존즈 감독은 영화감독, 프로듀서, 각본가이자 배우이다. 이번 영화 &lt;그녀&gt;를 통해 제 86회 아카데미 각본상, 제 71회 골든글로브 각본상을 수상하였고 해외 유수 영화제에서 43회 수상하였다.
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
						<span class="en"> Megan Ellison</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Joaquin Phoenix, Scarlett Johansson</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en"> K.K. Barrett</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Jeff Buchanan</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Arcade Fire</span>
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

   