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
  
    <li style="background-image: url(https://i.imgur.com/JN3Mo41.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/XJzbPCKq_zw" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.imgur.com/BqH6kPF.jpg);"></li>
    <li style="background-image: url(https://i.imgur.com/iHdzZcj.jpg); "></li>
    <li style="background-image: url(https://i.imgur.com/iLhQOQ7.jpg);"></li>
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
            007:카지노 로얄
         </p>
         <br />
		 <span>007:Casino Royale</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>2006</li>
            <li>144min</li>
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
			아직 영국첩보국 MI6의 평범한 요원이던 제임스 본드(다니엘 크레이그). 체코에서의 위험한 암살을 마치고 007로 승격된 그에게 첫번째 임무가 주어진다. 국제 테러조직의 자금줄로 알려진 수수께끼의 인물 르쉬프(매즈 미켈슨)의 배후를 밝혀내는 것. 마다가스카에서 작전을 수행하던 007은 르쉬프가 몬테카를로의 ‘카지노 로얄’에서 무제한 배팅이 가능한 ‘홀뎀포커’를 통해 대규모 테러자금을 모으려는 음모를 밝혀내는데
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>
				<007 카지노 로얄>은 시리즈의 기원으로 거슬러 올라가 제임스 본드가 살인면허를 받기 전의 활약부터 소개한다. 살인면허가 없어도 제임스 본드가 위험한 인물인 건 마찬가지. 그는 자신에게 주어진 두번의 중요한 임무를 훌륭하게 처리한 후 암호명 '00'(살인면허)을 받는다. 제임스 본드는 첩보기관 MI6으로부터 007이란 암호명을 부여받고 마다가스카에서 테러리스트 몰라카(세바스찬 푸캉)를 감시하는 임무를 맡게 된다. 임무 수행 중 상황이 급변하게 되면서 007은 상부의 지시를 어기고 테러리스트 조직에 대한 독자적인 작전에 돌입한다. 단서를 쫓아 바하마에 도착한 007은 신비한 인물 드미트리오스와 그의 애인 솔랑게(카테리나 뮤리노)를 만나게 되고, 드미트리오스가 국제 테러 조직의 자금줄인 르 쉬프르(매즈 미켈슨)와 직결되어 있음을 직감한다. 
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
					<th class="time en">2022-01-10 | 10:00</th>
					<td class="theater">KH ITFF 3관</td>
					
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
					<th class="time en">2022-01-10 | 20:00</th>
					<td class="theater">KH ITFF 5관</td>
					
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
								<img src="https://i.ibb.co/R4QbkXn/movie-image-15.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">마틴 캠벨</strong><span class="mt10 en">Martin Campbell</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								고향인 영국에서 최고의 감독 위치를 차지하고 있었는데, 텔레비전 영화인 &lt;Reilly: Ace of Spies &gt;로 비평적인 찬사를 받았고, BBC 시리즈인 <Edge of Darkness>로 BAFTA(British Academy of Film and Television Awards)에서 6개 부문을 휩쓸며 평단의 신뢰를 이끌었다.
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
						<span class="en">Barbara Broccoli</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Daniel Craig, Eva Green, Mads Mikkelsen</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en">Phil Meheux</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Stuart Baird</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">David Arnold</span>
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

   