<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/guide/guide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/openCloseGuide.do" target="_top">개·폐막식 안내</a></li>
			<li class="current"><a href="${pageContext.request.contextPath }/guide/ticketGuide.do" target="_top">티켓 안내</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/theaterGuide.do" target="_top">상영관</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/trafficGuide.do" target="_top">교통 안내</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">티켓 안내</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
<div class="total_row">
<div class="row row_line">
		<div class="col-md-12 col-xs-12 ">


			<h4 class="tit-sec mb20">예매 및 현장구매</h4>

				<ul class="list_basic">
					 <li>개막식ㆍ폐막식 예매: 1.7(금) 14:00 오픈 – 온라인에서만 가능</li>
					 <li> <strong class="txt-red">정보기술영화제 개폐막식은 다음의 내용이 확인되어야 입장이 가능합니다.</strong>
					</li><li> 예방접종 2차 완료자 : 
						<ul>
							<li> 접종 완료 이후 2주가 지나야 함. 예방접종완료를 확인할 수 있는 증명 (예방접종 증명서 발급 또는 전자예방접종증명 COOV) </li>
						</ul>
					</li>
					<li> 예방접종  미완료 : 
						<ul>
							<li>개막일 기준 72시간 이내(개막기준 : 1월 7일~9일 폐막기준 : 1월 12~14일)의 PCR음성 확인 증명 (PCR음성확인증명서 또는 PCR음성확인 문자)</li>
						</ul>
					</li>
						<strong class="txt-red">※ 위 조건에 부합되지 않으면 티켓이 있어도 입장 하실 수 없습니다.</strong>
					
					 <li>일반상영작 예매: 1.5(수) 14:00 오픈 – 온라인, ITFF 매표소</li>
				 </ul>

				 	<p class="desc">※ ITFF 매표소는 영화제 기간에만 오픈</p>
					
					<div class="table-responsive mt10">
						<table class="tbl tbl_basic txt_center" summary="티켓 예매 장소 안내">
														 
						<colgroup>
							<col width="15%">
							<col width="18%">
							<col width="12%">
							<col width="">
							<col width="18%">
							<col width="18%">
						</colgroup>							  
						<thead>
						  <tr>
						    <th>구분</th>
						    <th colspan="2">위치</th>
						    <th>운영기간</th>
						    <th>운영시간</th>
						    <th>결제수단</th>
						  </tr>
						</thead>
						<tbody>
						  <tr>
						    <td>온라인</td>
						    
						    <td colspan="2">티켓 예매 페이지</td>
						    <td>1.5~1.14</td>
						    <td>24시간<br>(시작일 제외)</td>
						    <td>신용카드<br>체크카드</td>
						  </tr>
						  <tr>
						    <td rowspan="8">ITFF 매표소</td>
						    <td rowspan="8" colspan="2">KH극장 강남점</td>
						    <td>1.5~7<br>1.12~14</td>
						    <td>09:00~20:30</td>
						    <td rowspan="8">신용카드<br>체크카드<br>현금</td>
						  </tr>
						  <tr>
						    <td>10.8~11</td>
						    <td>07:30~20:30</td>
						  </tr>
						</tbody>
						</table>
					</div>
			</div><b><b>
	</b></b></div>

<b><b>


	<div class="row row_line">
		<div class="col-md-12 col-xs-12 ">

			<h4 class="tit-sec mb20">가격</h4>
					
					<div class="table-responsive mt10">
						<table class="tbl tbl_basic txt_center" summary="티켓 예매 장소 안내">
														 
							<colgroup>
								<col width="50%">
								<col width="50%">
							</colgroup>							  
							<thead>
							  <tr>
							    <th>개막식ㆍ폐막식</th>
							    <th>일반상영작</th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
							    <td>￦10,000</td>
							    <td>￦10,000</td>
							    
							  </tr>
							</tbody>
						</table>
					</div>
			</div>
	</div><!-- // row -->

	<div class="row row_line">
		<div class="col-md-12 col-xs-12 ">

			<h4 class="tit-sec mb20">할인규정</h4>

				<ul class="list_basic">
					<li>경로우대: 3,000원 할인 (만65세인 1956년생 이상, 신분증 지참 필수)</li>
					<li>장애인: 3,000원 할인 (복지카드 지참 필수)</li>
					<li>KH극장 유료회원: 3,000원 할인 (개·폐막식 제외한 KH극장 상영작에 한함)</li>
				 </ul>

				<p class="desc primary ">※ 모든 할인은 오프라인 ITFF매표소에서만 적용 가능</p>

		</div>
	</div><!-- // row -->

	<div class="row row_line">
		<div class="col-md-12 col-xs-12 ">

			<h4 class="tit-sec mb20">개인 정보 수집 및 관리</h4>

				<ul class="list_basic">
					 <li>개정 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 온라인으로 예매한 티켓을 현장 매표소에서 발권 받을 때 본인 확인 용도로 개인 정보를 이용할 수 없습니다.
					  따라서, 예매 시 발급되는 예매번호를 제시해야만 종이 티켓 발권이 가능합니다. 개인 정보의 경우 본인 확인 절차를 위한 최소한의 용도로만 활용됩니다.
					</li>
					 <li>티켓 예매 시 수집하는 개인 정보는 질병관리본부의 요청 또는 합당한 사유가 있을 때에만 공개하며, 저장된 시점으로부터 4주 후 자동파기됩니다.</li>
				 </ul>		
		</div>
	</div><!-- // row -->

	<div class="row row_line">
		<div class="col-md-12 col-xs-12 ">

			<h4 class="tit-sec mb20">유의사항</h4>

				<ul class="list_basic">
					<li>전 좌석을 온라인 예매로 판매합니다. 단, 온라인 예매로 매진되지 않은 작품에 한해 현장 판매합니다.</li>
					<li>별도의 현장 판매분이 준비되어 있지 않아 온라인 예매가 매진일 경우, 현장 매표소에서도 예매가 불가합니다.</li>
					<li>상영작 당 1인 2매까지 예매할 수 있습니다.</li>
					<li>모바일 티켓을 사용하시면 간편하고 빠르게 입장 가능하며, 상영 종료 후 현장 매표소에서 종이 티켓으로 발권 가능합니다.</li>
					<li>캡처된 모바일 티켓의 경우 상영관 입장이 불가합니다.</li>
					<li>발권된 종이 티켓은 분실, 훼손 등 어떤 이유라도 재발권이 불가합니다.</li>
					<li>PC 브라우저에서 팝업 차단이 되어있을 경우, 휴대전화 소액결제창이 나오지 않기 때문에 팝업 차단을 해제해 주십시오.</li>
					<li>청소년관람불가 영화의 경우, 고등학교에 재학중인 자를 포함하여 미성년자(만 18세 미만)는 보호자를 동반하여도 입장이 불가합니다.</li>
					<li>만 5세 미만의 어린이는 부모가 동반하여도 입장 불가합니다.</li>
				 </ul>

		</div>
	</div><!-- // row -->

	<div class="row row_line" style="border-bottom:0;">
		<div class="col-md-12 col-xs-12 ">

			<h4 class="tit-sec mb20">취소 및 환불</h4>

				<ul class="list_basic">
					<li>예매ㆍ발권한 티켓의 취소 및 환불 방법은 아래와 같습니다.
					
							<ul>
								<li>모바일 티켓: 티켓 예매 페이지(ticket.biff.kr) → 예매내역 확인/취소 → 로그인 → 예매내역 → 상영작 클릭 → 예매취소</li>
								<li>종이 티켓: 현장 매표소 방문만 가능</li>
							</ul>
					</li>
					<li>영화 상영 시작 30분 전까지 취소 및 환불이 가능합니다.</li>
					<li>상영 일정이 변경되거나 취소된 경우는 수수료 없이 행사 기간 내에 취소 및 환불이 가능합니다.</li>
				 </ul>
			<p class="desc">
				※ 개ㆍ폐막식 티켓의 취소 및 환불은 온라인에서만 가능합니다.<br>
				※ 현장 예매 시 카드로 결제한 티켓을 취소할 때는 결제한 카드를 필히 지참하셔야 합니다.<br>
				※ 카드 예매권으로 현장 예매한 티켓은 취소가 불가합니다.
			</p>

			
		</div>
	</div>

</b></b>
</div>
<!-- //container -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>