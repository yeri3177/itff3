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
			<li class="current "><a
				href="${pageContext.request.contextPath }/guide/openCloseGuide.do" target="_top" style="font-weight: bold;">
					개·폐막식 안내</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/guide/ticketGuide.do" target="_top">티켓 안내</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">개·폐막식 안내</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div class="page page6-1">
			

	
<!--//START: CONTENTS AREA-->

<div class="container">
	<div class="row row_line">
		<div class="col-md-12 col-xs-12">
			<h4 class="tit-sec mb30">개막식 타임테이블</h4>
			<div class="table-responsive mt10">
				<table class="tbl tbl_basic txt_center">
					<colgroup>
						<col width=" 20%">
						<col width=" 20%">
					</colgroup>
					<thead class="">
						<tr>
							<th>시간</th>
							<th>구분</th>
						
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>17:00 ~ 18:00</td>
							<td>관객 / 게스트 입장</td>
							
						</tr>
						<tr>
							<td>18:00 ~ 19:10</td>
							<td>공식행사</td>
							
						</tr>
						<tr>
							<td>19:10 ~ 20:00</td>
							<td>개막작 상영</td>
						</tr>
					</tbody>
					
				</table>
			</div>
		</div>
	</div>

	<div class="row row_line">
		<div class="col-md-12 col-xs-12">
			<p class="tit-sec mb30">개·폐막식 참석안내</p>
			<ul class="list_basic2">
				<li>- 코로나로 인해 좌석간 거리두기가 실시되오니 양해 부탁드립니다.</li>
				<li>- 코로나로 인해 음식물은 반입이 불가합니다.(뚜껑이 있는 무알콜 음료, 물 제외)</li>
				<li>- 영화 상영 시 사진 및 촬영이 불가합니다.</li>
				<li>- 반드시 지정된 좌석에 착석 바랍니다.</li>
			</ul>
		</div>
	</div>

	<div class="row row_line">
		<div class="col-md-12 col-xs-12">
			<p class="tit-sec mb30">개·폐막식 방역 안내</p>
			<p class="desc-l mb10">제1회 정보기술영화제 개막식의 안전한 진행을 위해 아래와 같이 방역을 실시하오니 관객여러분들의 협조 부탁드립니다.</p>
			<p class="desc-l mb10">*부산국제영화제 개폐막식은 다음의 내용이 확인되어야 입장이 가능합니다.</p>
			
			<ul class="list_basic">
			<!-- 	<li> <strong class="txt-red">개폐막 행사 입장시 코로나 백신 예방접종 2차 완료 또는 PCR 검사 증명 필히 지참 하셔야 합니다.</strong>
					<ul>
						<li>예방접종 2차 완료자 : 접종 완료 이후 2주가 지나야 함.예방접종완료를 확인할 수 있는 증명 (예방접종 증명서 발급 또는 전자예방접종증명 COOV) </li>
						<li>예방접종 미완료 : 개막일 기준 72시간 이내(개막기준 : 10월3일~5일 폐막기준 : 10월 12~14일)의 PCR음성 확인 증명 (PCR음성확인증명서 또는 PCR음성확인 문자)</li>
					</ul>
				</li> -->
				<li> 예방접종 2차 완료자 : 
					<ul>
						<li> 접종 완료 이후 2주가 지나야 함. 예방접종완료를 확인할 수 있는 증명 (예방접종 증명서 발급 또는 전자예방접종증명 COOV) </li>
					</ul>
				</li>
				<li> 예방접종  미완료 : 
					<ul>
						<li>개막일 기준 72시간 이내(개막기준 : 1월 7일~9일 폐막기준 : 1월 12~14일)의 PCR음성 확인 증명 (PCR 음성확인증명서 또는 PCR 음성확인 문자)</li>
					</ul>
				</li>
				<li> 체온측정 : 37.5도 이상일 경우 입장이 제한됩니다.</li>
				<li> 방문등록 : 전자출입명부 작성(QR 또는 안심콜)을 하셔야만 입장이 가능합니다.</li>
			</ul>

			<span class="txt-red">※ 위 조건에 부합되지 않으면 티켓이 있어도 입장 하실 수 없습니다.</span>
		</div>
	</div>
</div>

<!--//END: CONTENTS AREA-->

</div>

<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>