<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page	import="org.springframework.security.core.context.SecurityContext"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/movie/booking.css" />

<h3 class="hidden">결제</h3>
<div class="article article_sum_infor">
	<div class="group_top">
		<h4 class="tit" style="position: relative; top: 16px;">예매정보</h4>
	</div>
	<div class="inner">
		<div class="movie_infor new2020">
			<span class="thm">
				<img src="${pageContext.request.contextPath}/resources/upload/poster/${movie.image}" alt="">
			</span>
			<strong class="tit">
				<span class="ic_grade gr_${movie.ageLimit}" style="position: relative; bottom: 2px;"></span>&nbsp;${movie.titleKor}
			</strong>
			<dl class="dlist_infor">
				<dt>일시</dt>
				<dd>${schedule.startDate} ${schedule.startTime} 시작</dd>
				<dt>상영관</dt>
				<dd>${schedule.theaterId}관</dd>
				<dt>인원</dt>
				<dd id="selectedCnt">일반 ${fn:length(selectedSeats)}인</dd>
			</dl>
		</div>
		<div class="seat_infor" style="padding-left: 241px; font-size: 14px;"> 
				<dt style="float: left;">좌석&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</dt>
				<dd id="selectedSeats">
					<strong>
						<c:forEach items="${selectedSeats}" var="seat" varStatus="vs">
							<c:if test="${vs.first}">
								${seat}
							</c:if>		
							<c:if test="${vs.first eq false}">
								, ${seat}
							</c:if>		
						</c:forEach>
					</strong>
				</dd>
			</dl>
		</div>
		<div class="addprodlistwrap">
			
			
		</div>
	</div>
</div>

<div class="article article_payment">
	<div class="group_top">
		<h4 class="tit" style="position: relative; top: 16px;">결제하기</h4>
	</div>
	<div class="inner">
	
		<div class="reservation_sec" style="margin-left: 25px; margin-top: 40px;">
			<strong class="tit04" style="font-weight: normal;">포인트</strong>
			<p>보유 포인트</p>
			<div class="licenseNumInput">
				<input type="number" id="myMileage" value="<sec:authentication property="principal.point"/>" readonly />
			</div>
			<p>사용할 포인트</p>
			<div class="licenseNumInput">
				<input type="number" id="usingMileage" min=0 max="" value=0 style="width: 100%"/>
			</div>
			<br /><br />
			
			
			<br /><br /><br />
			<div class="col-md-2 col-xs-12" style="box-sizing: initial;">
				<p class="tit tit-sec bold mt10" style="width: 100px; font-size: 20px;">※ 유의사항</p>
			</div>
			<div class="col-md-10 col-xs-12" style="font-size: 13px; line-height: 23px;">
				<ul class="list_secondary mt10">
					
					<li>- 5세 미만의 어린이는 입장하실 수 없습니다.</li>
					<li>- 모든 촬영기기는 저작권 보호법에 의해 상영관 내 반 입하실 수 없으며, 촬영을 금지합니다.</li>
					<li>- 상영 시작 이후 15분까지 입장을 허용합니다. <!-- (단, 영화 상영 시작 이후에는 환불이 불가능합니다.) -->	</li>
				</ul>
			</div>
			
		</div>
		
		
		
		
		<div class="payment_sum_wrap">
			<dl>
				<dt>상품금액</dt>
				<dd>
					<strong id="ticketFee"><fmt:formatNumber value="${total}" pattern="#,###" /></strong>원
				</dd>
			</dl>
			<dl>
				<dt>할인금액</dt>
				<dd>
					-<strong id="usedPoints">0</strong>원
				</dd>
			</dl>
			<dl>
				<dt>결제금액</dt> 
				<dd>
					총<strong id="finalAmount"><fmt:formatNumber value="${total}" pattern="#,###" /></strong>원
				</dd>
			</dl>
			<a href="#none" onclick="inicisPay();" class="btn_col1 btn_confirm">결제하기</a>
		</div>
	</div>
</div>

<!-- 스크립트에서 쓸 정보 -->
<input type="hidden" id="memberId" value="<sec:authentication property='principal.id'/>"/>
<input type="hidden" id="memberName" value="<sec:authentication property='principal.name'/>"/>
<input type="hidden" id="memberEmail" value="<sec:authentication property='principal.email'/>"/>
<input type="hidden" id="memberPhone" value="<sec:authentication property='principal.phone'/>"/>
<input type="hidden" id="memberPoint" value="<sec:authentication property='principal.point'/>"/>
<input type="hidden" id="movieTitle" value="${movie.titleKor}"/>
<input type="hidden" id="movieId" value="${movie.movieId}"/>
<input type="hidden" id="movieImage" value="${movie.image}"/>
<input type="hidden" id="scheduleId" value="${schedule.movieScheduleId}"/>
<input type="hidden" id="startDate" value="${schedule.startDate}"/>
<input type="hidden" id="startTime" value="${schedule.startTime}"/>
<input type="hidden" id="theaterId" value="${schedule.theaterId}"/>
<input type="hidden" id="finalSeat" value="${selectedSeats}" />
<input type="hidden" id="hiddenTicketFee" value="${total}" />


<script>
// 02단계 호버시 나오는 값을 세팅
$(() => { 
	$("#bx_step02_count").html($("#selectedCnt").html());
	$("#bx_step02_seats").html($("#finalSeat").val().substr(1, $("#finalSeat").val().length - 2));  // 선택한 좌석 목록이 [] 이거 안에 들어간 형태로 나오므로, substr로 []를 잘라낸다.
});


$("#usingMileage").blur((e) => {
	var val = $("#usingMileage").val();
	console.log($("#myMileage").val());
	console.log(val);
	
	if(val < 0) {
		alert("0보다 큰 숫자를 입력해주세요.");
		<%-- 그냥 alert 다음 focus() 하니까 alert가 무한으로 뜬다. 찾아보니까 setTimeout 안에 focus 넣으면 된다고 한다. --%>
		setTimeout(function() {
			$("#usingMileage").focus();
		}, 10);
	}
	else if(parseInt($("#hiddenTicketFee").val()) - val <= 0) {
		alert("결제금액 이상으로 사용하실 수 없습니다.");	
		setTimeout(function() {
			$("#usingMileage").focus();
		}, 10);
	}
	else if(val % 100 != 0) {
		alert("100원 단위로 사용할 수 있습니다.");	
		setTimeout(function() {
			$("#usingMileage").focus();
		}, 10);
	}
	else if(parseInt(val) > parseInt($("#myMileage").val())) {
		alert("보유한 마일리지 범위 내에서 사용하실 수 있습니다.");	
		setTimeout(function() {
			$("#usingMileage").focus();
		}, 10);
	}
	else {
		console.log($("#ticketFee").html());
		$("#finalAmount").html((parseInt($("#hiddenTicketFee").val()) - val).toLocaleString());	
		
		$("#usedPoints").html((parseInt(val)).toLocaleString());
	}
});



function inicisPay() {
	
	var IMP = window.IMP;      // 계속 requestPay is undefined라고 떠서 시간을 한참 날렸는데, 이 두줄도 같이 function 안에 넣어줘야하는거였다.
	IMP.init("imp32315053");   // 아임포트 관리자페이지에 있는 자신의 가맹점번호  
	
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card', //생략 가능
	    merchant_uid: "reservation_" + new Date().getTime(), // 아임포트 관리자페이지의 결제내역 목록에서 각 건마다 붙는 등록번호같은것
	    name : $("#movieTitle").val(),   
	    amount : parseInt($("#hiddenTicketFee").val() - $("#usingMileage").val()),
	    buyer_name : $("#memberName").val(),    // 따옴표 안에 넣으면 브라우저 콘솔에 뭐라 뜨면서 결제창이 뜨자마자 꺼진다.
	    buyer_tel : $("#memberPhone").val(),
	    buyer_email : $("#memberEmail").val(),
	    /* buyer_email : 'iamport@siot.do', */
	    /* buyer_addr : '서울특별시 강남구 삼성동', */
	    /* buyer_postcode : '123-456' */
	}, function(rsp) { // callback 로직
			if(rsp.success) {
				// jQuery로 HTTP 요청
				$.ajax({
					url: "${pageContext.request.contextPath}/movie/reservation.do?${_csrf.parameterName}=${_csrf.token}",
				    method: "POST",
				    data: {
				        movieScheduleId : $("#scheduleId").val(),
				        memberId : $("#memberId").val(),
				        movieId: $("#movieId").val(),
				        movieImage: $("#movieImage").val(),
				        titleKor : $("#movieTitle").val(),
				        finalSeat : $("#finalSeat").val(),
				        startDate: $("#startDate").val(),
				        startTime: $("#startTime").val(),
				        amount: parseInt($("#hiddenTicketFee").val() - $("#usingMileage").val()),
				        totalPoint: $("#memberPoint").val(),
				        usedPoint: $("#usingMileage").val(),
				        theaterId : $("#theaterId").val()
				    },
				    success(data){
				    	$("#reserveStep04").html(data);
				    	$("#reserveStep04").show();
				    	$("#step03").removeClass("active");
						$("#step03").addClass("prev");
						
						$("#step04").removeClass("disabled");
						$("#step04").addClass("active");
						
						console.log("complete")
				    }
				}).done(function (data) {
				  // 가맹점 서버 결제 API 성공시 로직
				})
			} else {
				alert("결제에 실패하였습니다.");				
			}
	});
	
}
</script>




<!-- <div class="saveInfoBtn">
				<input type="button" value="마일리지 사용하기" class="licenseRegisterBtn" id="mileageBtn" style="width: 122px;"/>
			</div>
			<div class="saveInfoBtn">
				<input type="button" value="마일리지 사용 취소" class="licenseRegisterBtn" id="mileageCancelBtn" style="width: 125px; display: none; color: #FF2628; border-color: #FF2628;"/>
			</div> -->

<%-- //사용할 마일리지 입력란에 적은 숫자를 결제금액 에리어의 사용 마일리지 란에 넣는다. 입력한 숫자가 보유 마일리지보다 크면 alert를 띄운다.
$("#mileageBtn").click((e) => {
	var val = $("#usingMileage").val();
	
	if(val == "") {
		alert("0보다 큰 숫자를 입력해주세요.");
	}
	else if(val > $("#myMileage").val() || val < 0) {
		alert("보유한 포인트 범위 내에서 사용하실 수 있습니다.");
	} 
	else if((parseInt($("#hiddenTicketFee").val() - val) <= 0) {
		alert("결제금액보다 많이 사용하실 수 없습니다.");
	}
	else if(val % 100 != 0) {
		alert("100원 단위로 사용하실 수 있습니다.");
	} 
	else {
		// 마일리지 사용 버튼을 사용불가로 만들고 없앤다. 동시에 마일리지 사용 취소 버튼을 나타나게 한다.
		$("#mileageBtn")
			.prop('disabled', true)
			.css('display', 'none');
		$("#mileageCancelBtn").css('display', 'block');
		
		// 결제내역 에리어의 마일리지 사용란에 나오게 한다.
		$("#finalAmount").html((parseInt($("#hiddenTicketFee").val()) - val).toLocaleString());	
		$("#usedPoints").html(val);
	}
}); 


// 마일리지 사용 취소 버튼
$("#mileageCancelBtn").click((e) => {
	// 마일리지 사용 취소 버튼을 안보이게 하고, 마일리지 사용 버튼을 사용가능하게 하고 보이게 한다.
	$("#mileageCancelBtn").css('display', 'none');
	$("#mileageBtn")
		.prop('disabled', false)
		.css('display', 'block');
	
	// 사용할 마일리지 입력란과 결제금액 에리어의 마일리지 란을 초기화하고 총 결제금액에서도 마일리지 계산을 뺀다.
	$("#usingMileage").val("");
	$("#usedPoints").html("");
	$("#finalAmount").html((parseInt($("#hiddenTicketFee").val()).toLocaleString());
});   --%>


<!-- 56번줄 밑에 있던 부분 
			<h5 class="tit">추가상품 구매</h5>
			<div class="mCustomScrollbar _mCS_2 mCS-autoHide mCS_no_scrollbar"
				data-mcs-theme="minimal-dark" id="mCustomScrollbar1"
				style="position: relative; overflow: visible;">
				<div id="mCSB_2"
					class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
					style="max-height: none;" tabindex="0">
					<div id="mCSB_2_container"
						class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
						style="position: relative; top: 0; left: 0;" dir="ltr">
						<ul class="addprodlist">
							<li><a href="#"><div class="pay_movie_infor">
										<div class="img_product">
											<span class="thm"><img
												src="https://caching.lottecinema.co.kr//Media/WebAdmin/cc222cc25ab7487580e10143f2a4e52b.png"
												alt="포토티켓" class="mCS_img_loaded"></span>
										</div>
										<div class="bx_infor">
											<div class="badge_wrap"></div>
											<strong class="tit">포토티켓</strong>
											<div class="between_txt">
												<span><span class="pay">1,000</span> 원</span>
											</div>
										</div>
									</div></a></li>
						</ul>
					</div>
				</div>
				<div id="mCSB_2_scrollbar_vertical"
					class="mCSB_scrollTools mCSB_2_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
					style="display: none;">
					<div class="mCSB_draggerContainer">
						<div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
							style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
							<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
						</div>
						<div class="mCSB_draggerRail"></div>
					</div>
				</div>
			</div> -->
			
			
			<!-- 61번줄 밑에 있던 부분 
<div class="article article_pay_method">
	<div class="group_top">
		<h4 class="tit" style="position: relative; top: 16px;">결제수단</h4>
	</div>
	<div class="inner">
		<div class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar"
			data-mcs-theme="minimal-dark"
			style="position: relative; overflow: visible;">
			<div id="mCSB_1"
				class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
				style="max-height: none;" tabindex="0">
				<div id="mCSB_1_container"
					class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
					style="position: relative; top: 0; left: 0;" dir="ltr">
					<div class="group_discount" style="display: block;">
						<h3 class="tit_payment">할인/포인트</h3>
						<div class="tab_wrap3 reset selected">
							<div class="tab_tit case2">
								<ul>
									<li><button class="">
											L.POINT <strong class="point">25P</strong>
										</button></li>
									<li><button class="">L.POINT 카드번호</button></li>
								</ul>
							</div>
						</div>
						<div class="wrap_coupon">
							<div class="bx_cate">
								<ul class="list_pay_item cate4">
									<li id="point_vip"><button class="">
											VIP/Friends<span class="txt_cnt">0</span>
										</button></li>
									<li id="point_admission"><button class="">
											관람권<span class="txt_cnt">0</span>
										</button></li>
									<li id="point_discount"><button class="">
											할인권<span class="txt_cnt">0</span>
										</button></li>
									<li class="mline" id="point_etc"><button class="">제휴포인트/할인</button></li>
								</ul>
							</div>
						</div>
						<div class="toggle_wrap no couplechk" style="display: none;"></div>
					</div>
					<div class="group_payment">
						<h5 class="tit_payment">최종 결제수단</h5>
						<div class="bx_cate">
							<ul class="list_pay_item cate6">
								<li><button type="button" class="cate1 ">신용카드</button></li>
								<li><button type="button" class="cate2 ">엘페이</button></li>
								<li><button type="button" class="cate3 ">간편결제</button></li>
								<li><button type="button" class="cate5 ty2 ">내통장결제</button></li>
								<li><button type="button" class="cate4 ty2 ">휴대폰</button></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="mCSB_1_scrollbar_vertical"
				class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical"
				style="display: none;">
				<div class="mCSB_draggerContainer">
					<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
						style="position: absolute; min-height: 50px; height: 0px; top: 0px;">
						<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
					</div>
					<div class="mCSB_draggerRail"></div>
				</div>
			</div>
		</div>
	</div>
</div> -->