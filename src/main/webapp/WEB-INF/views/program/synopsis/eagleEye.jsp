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
  
    <li style="background-image: url(https://i.imgur.com/W3sVk69.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/Ve_HGFCyCd8" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/kzvNJjR.jpg);"></li>
    <li style="background-image: url(https://i.imgur.com/aAGGXM0.jpg); "></li>
    <li style="background-image: url(https://i.imgur.com/3saQMXv.jpg);"></li>
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
            이글아이
         </p>
         <br />
		 <span>Eagle Eye</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2008</li>
            <li>119min</li>
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
         평범한 청년 제리(샤이아 라보프)의 통장에 의문의 75만불이 입금 된다. 집에는 각종 무기와 자신의 이름으로 된 여러 개의 여권들이 배달되어있다. 그리고 걸려온 전화의 차가운 목소리는 "30초 후, FBI가 닥칠 테니, 도망갈 것"을 명령한다. 결국 테러리스트로 몰리게 된 제리는 FBI의 추격전에서, 아들의 목숨을 담보로 전화 지시에 따르고 있는, 같은 처지의 레이첼(미셀 모나한)을 만나게 되고, 이 둘은 거대한 사건 속으로 빠져들게 된다.
  핸드폰, 현금지급기, 거리의 CCTV, 교통안내 LED사인보드, 신호등 등 그들 주변의 전자장치와 시스템이 그들의 행동을 조종한다. 그들은 선택되었고, 살기 위해선 복종해야 한다. 과연 그것의 정체는 무엇인가? 왜 그들은 선택되었는가? 
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>
            &lt;라이언 일병 구하기&gt; &lt;마이너리티 리포트&gt; &lt;우주 전쟁&gt; &lt;트랜스포머&gt; 등으로 전세계 영화팬의 사랑을 받아온 스티븐 스필버그의 드림웍스가 2008 초대형 프로젝트를 공개했다. 세상을 조종하는 또 하나의 눈 '이글 아이'라는 미지의 존재에 관한 초대형 액션 스릴러가 바로 그것이다! &lt;이글 아이&gt;의 컨셉은 10년 전부터 스필버그가 개발해온 것으로 알려져 있다. 그의 첫 번째 발상은‘주변의 기계들이 우리의 삶을 지배한다’는 내용. 그러나 그 아이디어는 현실화 될 수 없었다. 이 흥미로운 스릴러의 내러티브를 영상으로 구현할 테크놀로지가 현재만큼 발전하지 못했었기 때문이다. 그러나 2006년, 스필버그는 자신의 아이디어를 &lt;미션 임파서블3&gt; &lt;트랜스포머&gt;의 각색자인 알렉스 커츠먼과 로베르토 오씨에게 넘김으로써 현실화시킨다.
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
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_12_x2.png" style="width:40px" alt="관람가"> 
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
					<th class="time en">2022-01-09 | 09:00</th>
					<td class="theater">KH ITFF 5관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_12_x2.png" style="width:40px" alt="관람가"> 
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
					<th class="time en">2022-01-10 | 10:00</th>
					<td class="theater">KH ITFF 3관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_12_x2.png" style="width:40px" alt="관람가"> 
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
					<th class="time en">2022-01-10 | 20:00</th>
					<td class="theater">KH ITFF 5관</td>
					
					<td class="film_tit">
						<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_12_x2.png" style="width:40px" alt="관람가"> 
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
								<img src="https://i.ibb.co/GW3bGDk/movie-image-1.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">D.J. 카루소</strong><span class="mt10 en">D.J. Caruso</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								감독이자 동시에 제작자의 경험을 갖추고 있기도 한 그는 심리 스릴러물을 다루는데 아주 탁월한 능력을 가지고 있다고 정평이 나 있다. 차기작은 역시 드림웍스 제작, 스티븐 스필버그의 아이디어로 만들어질 &lt;이글 아이&gt;. 이번에도 또 한번 샤이아 라보프를 선택, 완벽한 팀워크를 선보일 예정이다.
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
						<span class="en">Steven Spielberg</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Shia LaBeouf, Michelle Monaghan</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en"> Roberto Orci </span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Steven Spielberg</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Brian Tyler</span>
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

   