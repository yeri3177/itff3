<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="프로그램" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/program/programSearch.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<script>
	function programSearch() {
		const program = $("[name=SearchQuery]").val();
		if(/^(.|\n)+$/.test(program) == false){
		      alert("검색어를 입력하세요");
		      return false;
      	}
		location.href = `${pageContext.request.contextPath}/program/programFinder.do?program=\${program}`;
	}
	
	
	
</script>


<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_">
				<a href="${pageContext.request.contextPath }/program/openClose.do" target="_top">개·폐막작</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath }/program/ai.do" target="_top">인공지능</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/security.do">보안·암호학</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/deepRunning.do" target="_top">가상현실·딥 러닝</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/bigData.do" target="_top">빅 데이터·컴퓨팅</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/flatform.do" target="_top">플랫폼·사물 인터넷</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/debugging.do" target="_top">사고력·디버깅</a>
			</li>
			<li class="on_">
				<a href="${pageContext.request.contextPath}/program/programSearch.do" target="_top" style="font-weight: bold;">#작품검색</a>
			</li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->
<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">#작품검색</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->



<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>



<div class="search_wrap">
	<div class="inp_search_wrap" style="display:inline-flex;">
		<input name="SearchQuery" id="SearchQuery" type="text" size="30" value="${program }" class="inp_search text ac_input" placeholder="영화명을 입력하세요." title="검색어를 입력하세요" style="display:block;">
		
		<button class="sbtn" onclick="programSearch()">
			<img src="https://www.biff.kr/kor/img/program/btn_search.png" alt="검색" class="wview">
		</button>
		<!-- 음성인식 구현 -->
		<button id="start">
			<ion-icon name="mic"></ion-icon>
		</button>
	</div>
</div>

<script>
//const speech = new webkitSpeechRecognition;
if(!("webkitSpeechRecognition" in window)) {
	alert("음성인식 지원은 크롬에서만 가능합니다.");
	
} else {
	const speech = new webkitSpeechRecognition;
	
	document.getElementById("start").addEventListener("click", () => {
		speech.start();
	})
	
	/* document.getElementById("stop").addEventListener("click", () => {
		speech.stop();
	}) */
	
	speech.addEventListener("result", (event) => {
		console.log(event);
		const {transcript} = event["results"][0][0]
		console.log(transcript);
		//document.getElementById("transcript").innerHTML = transcript;
		$('#SearchQuery').val(transcript);
	})
	
}
</script>



	<br /><br /><br />


<c:if test="${not empty movieList }">
	<div class="schedule">
		<div class="container_">
			<table class=" tbl_schedule2 wid100">
				<thead>
					<tr>
						<th class="en">Title</th>
						<th class="en">Director</th>
						<th class="en">Grade</th>
						<th class="en">Event</th>
					</tr>
					<!-- <tr>
					</tr> -->
				</thead>
				<tbody>
					<c:forEach var="program" items="${movieList }" varStatus="vs">
					<tr>
						<th class="time en">${program.titleKor}
						<br /> <p id="titleEng">${program.titleEng }</p> 
						</th>
						<td class="theater">${program.director }</td>
						<td class="film_tit">
							<c:if test="${program.ageLimit eq '12 +'}">
								<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_12_x2.png" style="width:40px" alt="관람가"> 
							</c:if>
							<c:if test="${program.ageLimit eq '15 +'}">
								<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_15_x2.png" style="width:40px" alt="관람가"> 
							</c:if>
							<c:if test="${program.ageLimit eq '19 +'}">
								<img src="https://siwff.or.kr/kor/img/cont/schedule/ico_18_x2.png" style="width:40px" alt="관람가"> 
							</c:if>
							
							<img src="https://siwff.or.kr/kor/img/cont/schedule/A.png" style="width:40px" alt="언어">&nbsp;
						</td>
						<td class="event">
							<button type="button" name="${program.movieId }">
								<img src="https://siwff.or.kr/kor/img/cont/schedule/gogogo_x2.png" >
							</button>
						</td>
					</tr>				
					</c:forEach>
				</tbody>
			</table>
	
		</div>
	</div>
	

		<div class="pagenation">${pagebar}</div>
</c:if>
	
<script>
	$("[name=movie-001]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/iRobot.do?movieId=001`;
	})
	$("[name=movie-002]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/eagleEye.do?movieId=002`;
	})
	$("[name=movie-003]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/aiSynopsis.do?movieId=003`;
	})
	$("[name=movie-004]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/password.do?movieId=004`;
	})
	$("[name=movie-005]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/gattaca.do?movieId=005`;
	})
	$("[name=movie-006]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/thirteen.do?movieId=006`;
	})
	$("[name=movie-007]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/matrix.do?movieId=007`;
	})
	$("[name=movie-008]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/her.do?movieId=008`;
	})
	$("[name=movie-009]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/citizenFour.do?movieId=009`;
	})
	$("[name=movie-010]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/casinoRoyale.do?movieId=010`;
	})
	$("[name=movie-011]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/missionImpossible.do?movieId=011`;
	})
	$("[name=movie-012]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/erin.do?movieId=012`;
	})
	$("[name=movie-013]").click((e) => {
		location.href = `${pageContext.request.contextPath}/program/synopsis/looper.do?movieId=013`;
	})

	
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	