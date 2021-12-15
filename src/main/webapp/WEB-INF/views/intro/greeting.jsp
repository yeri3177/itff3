<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/intro/greeting.css" />

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
				href="${pageContext.request.contextPath }/intro/outline.do" target="_top">
					개요</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/intro/program.do" target="_top">프로그램 소개</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/intro/greeting.do" target="_top" style="font-weight: bold;">집행위원장
					인사말</a></li>
			<li class="on_"><a
				href="/kor/addon/10000001/page.asp?page_num=2795" target="_top">포스터</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">집행위원장 인사말</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div class="page page1-2">
			

	
<!--//START: CONTENTS AREA-->

<div class="container">
<div class="conwid80">
	<div class="row">
		<div class="col-md-12 col-xs-12  ">
		
		
				<div class="greeting_box txt-center">
					<p class="greeting_tit">전대미문의 팬데믹이 여전히 우리를 옥죄고 있습니다.<br>
					하지만 이제 우리는 조금씩 다시 움직이며 생의 역동을 되찾아가고 있습니다.
					</p>
					<p class="greeting mt30 txt-center">
						앞서 이 땅을 살았던 이들은 훨씬 혹독한 곤경 속에서도 놀이의 신명과 창작의 기쁨을 잊지 않았습니다.<br> 
						영화는 인류가 만든 가장 보편적인 여흥이자 예술입니다. <br>
						그리고 영화제는 세상 곳곳의 영화들이 마음껏 소리치고 비상하고 유희하는 바다입니다.<br> 
						지난해 최소한의 규모로 치러진 정보기술영화제는<br> 올해 방역이 허용하는 범위 안에서
						세상의 많은 영화와 영화인들의 활기찬 난장으로 꾸리려 합니다. <br>  
						다시 떠나는 영화의 바다 항해에 함께 해주시기를 두근거리는 마음으로 소망합니다. 
					</p>
				</div>

				</div>
				<div class="mt20">
					<p class="txt-head txt-center">
					집행위원장 최형구
					</p>
				</div>

		</div><!-- // col-md-12 col-xs-12 -->

	</div><!-- // row -->
</div><!-- // conwid80 -->
</div>



<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>