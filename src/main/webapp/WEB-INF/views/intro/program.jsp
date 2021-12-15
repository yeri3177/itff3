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
	href="${pageContext.request.contextPath }/resources/css/intro/program.css" />

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
				href="${pageContext.request.contextPath }/intro/program.do" target="_top" style="font-weight: bold;">프로그램 소개</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath }/intro/greeting.do" target="_top">집행위원장
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
		<h2 class="en">프로그램 소개</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<div id="cont" class="cont_sub">

	<div>

		<div class="container">
			<div class="program_wrap">
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<div class="tbl_box_tit2 border-secondary txt-secondary mt50">2022&nbsp;프로그램</div>
					</div>

					<div class="col-md-8 col-xs-12">
						<div class="tbl_box_tit2 mt50">인공지능(Artificial Intelligence)</div>

						<p class="desc">사람과 같은 모습으로 생각하고 행동하면 어떻게 될까? 
						아마 사람이 만들었지만 그들은 단기간에 인간보다 더 영리해지고 많은 생각을 할 것이다. 
						좋은 사람, 나쁜 사람이 존재하듯 그들 또한 스스로 생각하며 나누어지는 세상에서 우리는 그들과 공존할 수 있을까라는 상상을 해보게 된다.</p>

						<div class="tbl_box_tit2 mt50">보안 / 암호학(Security / Cryptography)</div>

						<p class="desc">암호학은 과거에 국인들이 주로 사용했다면 이제는 IT기업이 다양한 암호학을 연구하고 있다.
						더욱더 강력한 암호화 기술, 보안 기술이 전쟁에서가 아닌 이젠 일상에서 모든 사람들에게 필요로 한 시점이기에 오늘도 누군가는 계속 연구한다.
						보안 기술을 강화 시키려는 자와 무력화 시키려는 자의 두뇌 싸움은 지금 이 시간에도 계속되고 있을 것이다.</p>

						<div class="tbl_box_tit2 mt50">가상 현실 / 딥 러닝(Virtual Reality / Deep Learning)</div>

						<p class="desc">내 집, 내 방에서 해외여행도 하고 데이트도 하는 등 나만의 세상을 만들어 신이 되는 경험을 할 수 있는 날이 멀지 않았다. 
						고령화 사회가 되고 가상 현실이 일반화가 되는 미래에는 우리 몸은 캡슐에 들어가서 잠자고 가상 세계에서 집을 사고 일을 하는 날이 올지도 모른다는 상상을 해본다.</p>

						<div class="tbl_box_tit2 mt50">빅 데이터 / 컴퓨팅(Computing / Big Data)</div>

						<p class="desc">기업들 혹은 누군가는 인터넷에 접속한 우리의 기록들을 모두 기록하고, 그 기록을 바탕으로 내가 어떤 사람인지 어떤 일을 진행하려고 하는지 예상하고 준비하고 있다.
						그리고 이미 이를 기반으로 아주 자연스럽게 우리 생활 속에 들어오고 있다. </p>

						<div class="tbl_box_tit2 mt50">플랫폼 / 사물 인터넷 (Platform / IoT: Internet of Things)</div>

						<p class="desc">우리의 삶을 편하게 해줄 수도 있지만 우리를 곤란하게 만들 수 있는 분야다.
						어딜 가든 날 알아보고 간편하게 필요한 걸 얻을 수도 있겠지만, 반대로 누군가 날 쉽게 감시하고 그 들이 만들어 둔 울타리에서 벗어나지 못할 수도 있게 된다.</p>

						<div class="tbl_box_tit2 mt50">사고력 / 디버깅 (Thoughts / Debugging)</div>

						<p class="desc">살아가다 보면 많은 시행착오와 기복이 발생한다. 
						우리의 인생 문제도 디버깅 된다면 얼마나 좋을 것인가?라는 의미로 선정해 보았다.
						디버깅에 대한 새로운 시각을 영화라는 매체 위에 풀어낸 작품들이 모였다.</p>

					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- //contents -->
</div>



<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>