<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 메인 콘텐츠 섹션 -->
<section class="main-content">

<div class="input-form">
	<form>
	  <div class="mb-3">
	    <label for="exampleInputEmail1" class="form-label">아이디</label>
	    <input type="text" name="id" class="form-control" id="exampleInputId" aria-describedby="emailHelp">
	  </div>
	  <div class="mb-3">
	    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
	    <input type="password" name="password" class="form-control" id="exampleInputPassword">
	  </div>
	  <div class="mb-3 form-check">
	    <input type="checkbox" class="form-check-input" id="exampleCheck1">
	    <label class="form-check-label" for="exampleCheck1">아이디 저장</label>
	  </div>
	  <button type="submit" class="btn btn-primary">로그인</button>
	</form>
</div>

<br/>
<br/>

	<div class="sub-content">
		<ul class="sub-content">
			<li class="sub-content"><a href="${pageContext.request.contextPath}/member/memberSearch">아이디/비밀번호 찾기</a></li>
			<li class="sub-content"><a href="${pageContext.request.contextPath}/member/memberEnroll">회원가입</a></li>
		</ul>
	</div>

<br/>
<br/>

<p>
아이디가 없으신 분은 회원가입 후 이용하실 수 있습니다. <br>
아이디/비밀번호를 분실하신 경우, 아이디/비밀번호 찾기를 이용해 주시기 바랍니다. <br> 
공용 PC를 이용하시는 경우 보안을 위하여 반드시 로그아웃 해주시기 바랍니다.
</p>

</section>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>