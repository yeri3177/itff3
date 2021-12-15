<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />

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
				href="/kor/addon/10000001/page.asp?page_num=2792" target="_top">
					개요</a></li>
			<li class="on_"><a
				href="/kor/addon/10000001/page.asp?page_num=3359" target="_top">시상/심사위원</a></li>
			<li class="on_"><a
				href="/kor/addon/10000001/page.asp?page_num=2793" target="_top">심사위원장 인사말</a></li>
			<li class="on_"><a
				href="/kor/addon/10000001/page.asp?page_num=2795" target="_top">포스터</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->


<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>