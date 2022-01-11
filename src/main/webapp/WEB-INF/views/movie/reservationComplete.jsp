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
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->


	<h3 class="hidden">결제완료</h3>
	<div class="article article_payment_fin ">
		<div class="group_top">
			<h4 class="tit" style="position: relative; top: 16px;">결제완료</h4>
		</div>
		<div class="inner">
			<div class="payment_fin_wrap">
				<div class="top_notice_ic ty1">
					<strong><sec:authentication property="principal.name"/> 회원님, 결제가 성공적으로 완료되었습니다.</strong>
				</div>
				<div class="reserve_result_wrap">
					<div class="infor_wrap">
						<div class="bx_thm">
							<img
								src="${pageContext.request.contextPath}/resources/upload/poster/${param3.movieImage}"
								alt="">
						</div>
						<div class="group_infor">
							<dl>
								<dt style="font-weight: normal;">예매번호</dt>
								<dd>
									<strong class="txt_num">${reservation.movieReservationId}</strong>
								</dd>
							</dl>
							<dl>
								<dt style="font-weight: normal;">상영일시</dt>
								<dd>
									${reservation.startDate}<span>&nbsp;${reservation.startTime}&nbsp;시작</span>
								</dd>
								<dt style="font-weight: normal;">상영관</dt>
								<dd>${reservation.theaterId}관</dd>
								<dt style="font-weight: normal;">관람인원</dt>
								<dd>일반 ${param3.count}인</dd>
								<dt style="font-weight: normal;">좌석</dt>
								<dd>${reservation.selectedSeat}</dd>
							</dl>
							<!-- <button type="button" class="btn_col1 ty5">휴대폰으로 바로티켓 받기</button> -->
						</div>
					</div>
					<div class="payment_wrap new2020">
						<div class="group_price case1" style="width: 160px;">
							<dl>
								<dt>주문금액</dt>
								<dd>
									<strong><fmt:formatNumber value="${param3.totalBefore}" pattern="#,###" /></strong>원
								</dd>
							</dl>
						</div>
						<div class="group_price case2" style="width: 202px;">
							<dl class="minus">
								<dt>할인금액</dt>
								<dd>
									<strong><fmt:formatNumber value="${param3.usedPoint}" pattern="#,###" /></strong>원
								</dd>
							</dl>
						</div>
						<div class="group_price case3" style="width: 240px;">
							<dl>
								<dt>총 결제 금액</dt>
								<dd>
									<strong><fmt:formatNumber value="${param3.totalAfter}" pattern="#,###" /></strong>원
								</dd>
							</dl>
							<!-- <div class="pay_method">
								<dl class="sml">
									<dt>결제방법</dt>
									<dd>
										<span class="txt_card1 ty1">신용카드</span>
									</dd>
									<dt>카드번호</dt>
									<dd class="sml last">BC 910020******6684</dd>
								</dl>
							</div> -->
						</div>
					</div>
				</div>
				<ul class="list_txt sml">
					<li><strong>온라인 예매 및 추가상품 구매 취소는 상영 시작 20분 전까지 온라인에서
							가능합니다.</strong></li>
					<li><strong>상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.</strong></li>
					<li><strong>반드시 전체 취소만 가능하며, 예매나 추가상품중 부분 취소는 불가능합니다.</strong></li>
					<li>예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이 날 수 있습니다.</li>
					<li>개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다. 꼭 예매번호를 확인해 주세요.</li>
					<li>구매한 상품은 마이페이지 &gt; 예매내역에서 확인 및 사용할 수 있습니다.</li>
				</ul>
				<div class="btn_btm_wrap mb50 pb50">
					<a href="${pageContext.request.contextPath}/member/memberMovieReservation.do" class="btn_col3 ty5">예매내역 확인</a>
					<!-- <a href="#none"	class="btn_col2 ty5">스토어 바로가기</a> -->
					<a href="${pageContext.request.contextPath}" class="btn_col1 ty5">홈으로 바로가기</a>
				</div>
			</div>
		</div>
	</div>

<input type="hidden" class="ws_id" value="${reservation.memberId }" />
<input type="hidden" class="ws_movie" value="${reservation.titleKor }" />

<script>

$( document ).ready(function() {
    let type = '영화예매';
    let target = $('.ws_id').val();
    let movie = $('.ws_movie').val();
    let content = '[ITFF] ['+ movie +'] 예매가 완료되었습니다.'
    let url = '${contextPath}/notify/saveNotify.do';
    	    
    console.log(type);
    console.log(target);
    console.log(content);
    console.log(url);
    
    // 전송한 정보를 db에 저장	
    $.ajax({
        type: "post",
        url:"${pageContext.request.contextPath}/notify/saveNotify.do",
        dataType: "text",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        data: {
            target: target,
            content: content,
            type: type,
            url: url
        },
        beforeSend : function(xhr) {   
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success:    // db전송 성공시 실시간 알림 전송
            // 소켓에 전달되는 메시지
            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
        	socket.send("ITFF,"+target+","+content+","+url)
//			console.log("관리자,"+target+","+content+","+url)

    });
});

</script>