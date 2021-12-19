<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

	<h1>메일인증페이지</h1>
	<div>남은시간 : <div id="demo"/></div>
	<form action="">
		<input type="text" value="인증코드"/>	
	</form>
<script>
var time = 600; //기준시간 작성
var min = ""; //분
var sec = ""; //초

//setInterval(함수, 시간) : 주기적인 실행
var x = setInterval(function() {
	//parseInt() : 정수를 반환
	min = parseInt(time/60); //몫을 계산
	sec = time%60; //나머지를 계산

	document.getElementById("demo").innerHTML = min + "분" + sec + "초";
	time--;

	//타임아웃 시
	if (time < 0) {
		clearInterval(x); //setInterval() 실행을 끝냄
		document.getElementById("demo").innerHTML = "인증시간이 지났습니다.";
	}
}, 1000);
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		