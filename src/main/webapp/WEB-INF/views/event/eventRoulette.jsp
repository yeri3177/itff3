<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/event/eventRoulette.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>
		
		<div class="roulette_total_con">
		<div class="inner title-area">
			<h2 class="hidden">EVENT</h2>

			<h3>[JUST ENJOY!] 하루에 단 한번만 즐길 수 있는 룰렛이벤트!</h3>

			<div class="btns">
				<span class="txt-date">2021.12.29 ~ 2022.01.14</span>
			</div>
		</div>
		
		<div class="inner bbs-detail">
			<div class="roulette">
				<div class="roulette-inner">
					<div class="roulette-bg">
						<img src="https://resources.fujifilm.co.kr/upload/img/event/4/20211127224300128.jpg" alt="">
						<img src="https://resources.fujifilm.co.kr/upload/img/event/4/20211127205633050.jpg" alt="">
						</div>
						<main id="roulette_wrap">
							<div class="roulette_area">
								<div class="roulette_box">
									<div class="roulette_center">
										<a href="javascript:;" class="btn_start">
										<img src="https://i.imgur.com/NjSQfjf.png" alt="버튼" class="roulette_btn"></a> 
										<img src="https://i.imgur.com/UxCfZNH.png" class="roll_bg" alt="룰렛이미지">
									</div>
								</div>
							</div>
						</main>
					
					</div>
			</div>
			
			<div class="event-info">
				<img src="https://i.imgur.com/1DtQgjH.png">
			</div>
			
			<div class="btnbbs">
				<a class="btn medium" onclick="location.href='${pageContext.request.contextPath}/event/eventMenu.do';">목록보기</a>
			</div>
			
			<form action="" class="point_frm">
				<input type="hidden" class="id" name="id" value="${member.id }" />
				<input type="hidden" class="point"  name="point" value="${member.point }" />
			</form>

		</div>
		</div>

<script>

var _btnStart;
var _roll_bg;
var _items;
var _mTime;

function init() {
create();
addEvent();
}

function create() {
_btnStart = $( ".btn_start" );
_roll_bg = $( ".roll_bg" );
_items = [ "100", "10", "50", "5000", "30", "1000", "500", "300" ];
_mTime = 1;
}

function addEvent() {
_btnStart.on( "click", btnStartClick );
}

function btnStartClick( $e ) {
spinMotion();
}

var _count = 0;

//움직이는 모션
function spinMotion() {
TweenMax.to( _roll_bg, _mTime, { rotation:360, ease:Power0.easeInOut, onComplete:function(){
TweenMax.set( _roll_bg, { rotation:0 });
_count ++;

if( _count > 0 ){
randomValue();
return;
}

spinMotion();
}});
}

//결과값 추출
function randomValue(){
	
var ran = parseInt( Math.random() * _items.length );

angleCount( ran );
}

//결과값 맞게 움직이는 모션
function angleCount( $ran ){
TweenMax.killTweensOf( _roll_bg );
TweenMax.set( _roll_bg, { rotation:0 });

var angle = 360 / _items.length;

TweenMax.to( _roll_bg, _mTime, { rotation: $ran * angle , ease:Power0.easeInOut, 
	onComplete:function(){
		alert( _items[ $ran ] + "P에 당첨되었습니다." );
		
		let form = $('.point_frm');
	    let id = form.find('.id').val();
	    let point = form.find('.point').val();
	    let change = _items[ $ran ];
	    
	    console.log(id);
	    console.log(point);
	    console.log(change);
	    
	    // 전송한 정보를 db에 저장	
	    $.ajax({
	        type: "post",
	        url:"${pageContext.request.contextPath}/admin/eventRoulette.do",
	        dataType: "text",
	        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	        data: {
	            id: id,
	            point: point,
	            change: change
	        },
	        beforeSend : function(xhr) {   
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        success: console.log('success')
	    });
	
	}
});
}

$( document ).ready( function(){
init();
});

</script>

<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>