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
			<li class="current"><a href="${pageContext.request.contextPath }/guide/covid.do" target="_top">코로나19 예방 수칙</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/openCloseGuide.do" target="_top">개·폐막식 안내</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/ticketGuide.do" target="_top">티켓 안내</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/theaterGuide.do" target="_top">상영관</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/guide/trafficGuide.do" target="_top">교통 안내</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">코로나19 예방 수칙</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div class="page page6-1">
			
<!--//START: CONTENTS AREA-->

<div class="container" style="text-align: center; margin-bottom: 100px;">
	<img src="https://i.imgur.com/dIat5sB.jpg" alt="코로나19 예방 수칙" />
</div>

<!--//END: CONTENTS AREA-->

</div>

<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>