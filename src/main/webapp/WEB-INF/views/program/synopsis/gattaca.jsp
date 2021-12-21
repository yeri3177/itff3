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
  
    <li style="background-image: url(https://i.ibb.co/nLtZxpd/movie-image-9.jpg);">
    	
		<button 
			type="button" 
			class="btn btn-primary video-btn btn_play_trailer js-video-button" 
			data-toggle="modal" 
			data-src="https://www.youtube.com/embed/cowQVrdRGqI" 
			data-target="#myModal">
			▶
		</button>
	</li>
    <li style="background-image: url(https://i.ibb.co/mGmDJs8/movie-image-10.jpg);"></li>
    <li style="background-image: url(https://i.ibb.co/yYHn0v9/movie-image-8.jpg); "></li>
    <li style="background-image: url(https://i.ibb.co/tzycL5X/movie-image-7.jpg);"></li>
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
            가타카
         </p>
         <br />
		 <span>GATTACA</span>
         <ul class="list_film_info list-inline">
            <li>미국</li>
            <li>1997</li>
            <li>108min</li>
            <li>12 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">security·cryptography</strong>
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc_">
         유전자 조작으로 태어난 사람들이 사회 상층부를 이루는 반면, 전통적인 부부관계로 태어난 사람들은 열등한 것으로 취급받아 사회 하층부로 밀려나는 디스토피아적인 미래를 배경으로 한다. 
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc_">
            <p>
				1997년 작이지만, 우주항공회사와 위성 타이탄에 대해 언급되고 이를 탐사하러 간다는 영화의 세계관을 통해 이 영화는 먼 미래의 모습을 담고 있다는 것을 알 수 있다. 그러나 이 영화는 매우 인간적이고 사실적으로 그려졌다. 인공수정과 우생학의 발달로 인해 인류는 점차 자식을 태생적으로 우월하고 선천적 질병과 장애로부터 안전하게 유전자 조작을 통해 '출산'하고 있다. 이러한 혜택은 인류 전체에게 주어지지 않고. 사회지도층의 지위보호를 위해 사용된다. 이러한 상황은 현실의 우리 사회 전반에 만연해 있을 뿐 아니라, 한 가정 내에서도 주연 빈센트와 안톤에 대해 아버지가 차별하는 모습 등은 현실의 모습과 별반 다를 바가 없다고 느껴진다. 영화 내에서 유전자 조작 기술 발전은 현실에서도 진행되고 있고 갈수록 빨라지고 있는 게 현실이다. 결국 영화 내에서의 모습이 곧 현실 세계의 모습이 될 것이다. 이 영화는 그러한 상황에 닥쳤을때 우리가 가져야할 자세와 대비책에 대하여 이야기 하고있다. 또한 극 후반부에서 빈센트와 안톤의 수영 시합중 안톤을 두번이나 이긴 것과 그 과정에서 빈센트의 대사는 우리에게 미래의 기술발전으로 인한 유전공학의 발달은 결코 절대적이지 않으며, 그에 대한 차별 역시 무의미하다는 메시지를 전한다.
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
								<img src="https://i.ibb.co/zJ9FgMk/375px-Andrew-Niccol-by-Gage-Skidmore.jpg" width="175" height="180" border="0" "alt="감독사진">
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12 dir_info">
							
							<div class="dir_name"><strong class="kor">앤드루 니콜</strong><span class="mt10 en">Andrew Nicol</span></div>
							<div class="desc">
							<p style="text-align: justify; line-height: 1.8;" align="justify">
								<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif;">
								&lt;가타카&gt;를 연출하면서 영화계에 데뷔한 앤드류 니콜 감독은 유전학적으로 열성인 주인공 빈센트가 우주 항공사인 '가타카'에 들어가기 위해 신분을 속이는 &lt;가타카&gt;, 일생을 미디어에 노출된 채 조작된 삶을 살아갔던 트루먼이 자신의 정체성을 발견해가는 &lt;트루먼 쇼&gt;(아카데미 각본상 후보)를 통해 그의 독특한 시선을 극적으로 표현해내 관객의 시선을 사로잡았다.
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
						<span class="en"> Danny DeVito</span>
					</li>
					<li>
						<strong class="en">Cast</strong>
						<span class="en">Ethan Hawke, Uma Thurman</span>
					</li>
					<li>
						<strong class="en">Cinematographer</strong>
						<span class="en">Slawomir Idziak</span>
					</li>
					<li>
						<strong class="en">Editor</strong>
						<span class="en">Lisa Zeno Churgin</span>
					</li>
					<li>
						<strong class="en">Music</strong>
						<span class="en">Michael Nyman</span>
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

   