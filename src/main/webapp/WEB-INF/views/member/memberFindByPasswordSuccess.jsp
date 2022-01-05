<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberLogin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 메인 콘텐츠 섹션 -->
<section class="main-content">

<!-- 제목 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="tit_sec txt-center txt-white en">비밀번호 찾기</h2>
	</div>
</div>

<p class="desc txt-center mt50" style="color:rgba(255,255,255,.5);font-size:15px">
	※ 가입 시 입력한 이메일에 임시 비밀번호를 전송했습니다. 확인해주세요.
</p>

	
<br/>
<br/>

<div class="list_link">
	<a href="${pageContext.request.contextPath}/member/memberFindId.do" class="link_arrow txt-white" title="아이디/비밀번호 찾기">아이디 찾기 ></a>
	<a href="${pageContext.request.contextPath}/member/memberEnroll.do" class="link_arrow txt-white" title="회원가입">회원가입 ></a>
</div>

<br/>
<br/>

</section>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>