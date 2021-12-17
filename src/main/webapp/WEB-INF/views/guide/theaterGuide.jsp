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
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/ticketGuide.do" target="_top">티켓 안내</a></li>
			<li class="current"><a href="${pageContext.request.contextPath }/guide/theaterGuide.do" target="_top">상영관</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/trafficGuide.do" target="_top">교통 안내</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">상영관</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div class="total_row">
<div class="row row_line">
	<div class="col-md-12 col-xs-12 ">

		<h4 class="tit-sec mb20">방역수칙</h4>
		<p class="desc-l primary mb10">정보기술영화제는 코로나바이러스감염증 확산 방지를 위해 다음과
			같은 방역수칙을 적용하오니, 적극 동참하여 주시기 바랍니다.</p>

		<ul class="list_basic">
			<li>행사장 내에서 마스크 착용은 필수이며, 미착용 시 입장이 불가합니다. 영화 관람 중에도 반드시 마스크를
				올바르게 착용해주시기 바랍니다.</li>
			<li>체온 측정 시 두 차례 이상 37.5도 이상이면 상영관 입장이 제한됩니다.</li>
			<li>상영관 내 좌석 간 거리두기를 시행하오니 반드시 예매한 좌석에 착석을 부탁드립니다.</li>
			<li>상영관 내에는 뚜껑이 있는 생수 및 음료를 제외한 음식물 반입이 불가합니다.</li>
			<li>영화제 스태프와 자원봉사자의 안내 및 진행에 적극적인 협조를 부탁드립니다.</li>

		</ul>

	</div>
</div>

<div class="row row_line hide">
	<div class="col-md-12 col-xs-12 ">

		<h4 class="tit-sec mb20">좌석운영</h4>

		<ul class="list_basic">
			<li>지정좌석제로 운영됩니다.</li>
			<li>‘정시입장제 완화’로 상영 시작 후 15분까지 입장이 가능합니다. 그러나 상영 시작 이후에 입장하는 모든
				경우, 지정좌석이 보장되지 않습니다.<br>
				<p class="desc txt-primary bold">※ 상영 후 진행되는 ‘게스트와의 만남(GV)’ 입장
					시에도 지정좌석 보장되지 않습니다.</p>
			</li>

		</ul>

	</div>
</div>

<div class="row mt50 mb80 line_box2">
	<div class="col-md-12 col-xs-12 ">

		<h4 class="tit-sec mb20">정시 입장 및 지정좌석 착석 안내</h4>

		<p class="desc-l mt20 ">
			정보기술영화제는 정시상영을 원칙으로 운영하고 있으며, 방역수칙 준수와 더불어 원활한 영화 관람을 위해 상영 시작 전에
			입장하여 주시기를 부탁드립니다.<br> 또한 영화제를 찾아오시는 관객분들께서 최대한 영화를 많이 관람하실 수 있도록
			상영 시작 후 15분까지는 입장할 수 있도록 배려하고 있으며, 반드시 예매한 지정좌석에 착석해 주시기 바랍니다.


		</p>

		<h4 class="tit-sec mt40 mb20">개인정보 수집 및 관리</h4>

		<ul class="list_basic">
			<li>개정 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 온라인으로 예매한 티켓을 현장 매표소에서 발권
				받을 때 본인 확인 용도로 개인 정보를 이용할 수 없습니다. 따라서, 예매 시 발급되는 예매번호를 제시해야만 종이 티켓
				발권이 가능합니다. 개인 정보의 경우 본인 확인 절차를 위한 최소한의 용도로만 활용됩니다.</li>
			<li>티켓 예매와 출입명부 작성 시 수집하는 개인정보는 질병관리본부의 요청 또는 합당한 사유가 있을 때에만
				공개하며, 저장된 시점으로부터 4주 후 자동 파기됩니다.</li>

		</ul>

	</div>
</div>

<div class="row mt50 mb50">
	<div class="col-md-12 col-xs-12 ">

		<h4 class="tit-sec mb20">주차 안내</h4>
		<h4 class="txt-sub2 bold mt30 mb10">KH극장 (운영시간 08:00 ~ 23:00)</h4>

		<ul class="list_basic mb30">
			<li>주차요금
				<ul>
					<li>기본요금: 30분 이내 출차 시 무료, 초과 시 30분당 1,000원(정상요금 적용)</li>
					<li>영화제 관객: 1편당 4시간 무료 ※ 영화의전당 외 타 상영관 티켓은 적용 불가</li>
					<li>일일 요금: 15,000원</li>
					<li>할인 요금(50% 할인): 경차, 장애인, 국가유공자, 다자녀가정 가족사랑카드등재자, 선택요일제 참여차랑</li>
				</ul>
			</li>
		</ul>
	</div>
</div>

</div>

<!-- //container -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>