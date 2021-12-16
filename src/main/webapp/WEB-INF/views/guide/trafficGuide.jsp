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
			<li class="on_"><a
				href="${pageContext.request.contextPath }/guide/openCloseGuide.do"
				target="_top">개·폐막식 안내</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/guide/ticketGuide.do"
				target="_top">티켓 안내</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/guide/theaterGuide.do"
				target="_top">상영관</a></li>
			<li class="current"><a
				href="${pageContext.request.contextPath }/guide/trafficGuide.do"
				target="_top">교통 안내</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">교통 안내</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div id="cont" class="cont_sub">


	<div class="container">
		<div class="tab_basic">
			<ul class="tab_ul">
				<li class="on 1_0"><a
					href="/kor/addon/10000001/page.asp?page_num=23733" target="_top">메가박스
						KH극장</a></li>
			</ul>
		</div>
	</div>


	<div>

		<div class="container">
			<!--//START: CONTENTS AREA-->
			<div class="traffic">
				<div id="map" style="width:100%;height:350px;"></div>
				
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.49904818396395, 127.03313483800216), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 강남구 테헤란로14길 6', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width: 150px; text-align: center; padding: 6px 0;">KH극장 강남점</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    

</script>

				<div class="add_wrap">
					<p class="tbl_box_tit2">KH극장</p>

					<p class="add ">서울특별시 강남구 테헤란로14길 6 2F, 3F, 4F, 5F, 6F</p>
				</div>

				<div class="row traffic_box">
					<div class="col-md-4 col-xs-12">
						<p class="traffic_tit txt-primary">지하철</p>

						<ul class="traffic_list">
							<li>2호선 역삼역 <strong>3번 출구 100m</strong></li>
						</ul>
					</div>

					<div class="col-md-4 col-xs-12">
						<p class="traffic_tit txt-primary">버스</p>

						<ul class="traffic_list">
							<li>역삼역.포스코P&S타워 정류장 하차<br> <br> 간선버스 146, 740, 341, 360<br>
								1100, 1700, 2000, 7007, 8001
							</li>
							<li>
								<p>&nbsp;</p>
							</li>
						</ul>
					</div>

					<div class="col-md-4 col-xs-12">
						<p class="traffic_tit txt-primary">주차 안내</p>

						<ul class="traffic_list">
							<li><strong>KH극장</strong></li>
							<li><strong>주차요금</strong> <br> 
							<span class="desc">2시간 
								2,000원 (티켓 소지시)<br> ※ 1,600원 할인된 금액, 2시간 이후 5분당 150원 추가
							</span> <br></li>
						</ul>
					</div>
				</div>
			</div>
			<!--//END: CONTENTS AREA-->
		</div>
		<!-- /container -->

	</div>
	<!-- //contents -->
</div>

<!-- //container -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>