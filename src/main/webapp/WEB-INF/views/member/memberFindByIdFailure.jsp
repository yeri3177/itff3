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

<c:if test="${not empty msg}">
<script>
	alert("${msg}");
</script>
</c:if>

<!-- 메인 콘텐츠 섹션 -->
<section class="main-content">

<!-- 제목 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="tit_sec txt-center txt-white en">아이디 찾기</h2>
	</div>
</div>

<c:if test=""></c:if>
<input type="hidden" id="msg" value="${msg }" />

<p class="desc txt-center mt50" style="color:rgba(255,255,255,.5);font-size:15px">
	※ 일치하는 정보가 없습니다. 다시 입력해주세요.
</p>

	
<div class="login_con">
	<form:form action="${pageContext.request.contextPath}/member/memberFindById.do" method="POST">
			<div class="login_form_wrap">   
					<div class="form_group wid100 on">
						<div class="d_tbl">
							<span class="form_txt">
								<input type="text" name="name" id="name" style="-webkit-ime-mode:inactive;ime-mode:inactive;text-transform:lowercase;" placeholder="가입시 입력한 이름을 입력해주세요" title="이름" value="">
							</span>
						</div>
					</div>

					<div class="form_group wid100 ">  
						<div class="d_tbl">
							<span class="form_txt input_mouse">
								<input type="text" name="email" id="email" placeholder="가입시 입력한 이메일을 입력해주세요" title="휴대폰번호" enc="on" data-keypad-type="alpha" class="nppfs-npk nppfs-dynamic-field nppfs-npv" autocorrect="off" spellcheck="false" autocomplete="off" autocapitalize="off" data-keypad-next="__hide__" data-keypad-useyn-type="toggle" data-keypad-useyn-input="__KU_db4c02124ff6" nppfs-keypad-uuid="nppfs-keypad-loginPwd" style="color: rgb(0, 0, 0);" data-input-useyn-type="toggle" value="">
							</span>
						</div>
					</div>  
					<input name="SET_LOGIN_SAVE" type="checkbox" id="SET_LOGIN_SAVE" style="position: absolute; opacity: 0;" value="2">                                
				</div>

<!-- remember-me -->
<!-- 	<div> -->
<!-- 		<input type="checkbox" name="remember-me" id="remember-me" class="form-check-input" />   부트스트랩에 있는 클래스 -->
<!-- 		<label for="remember-me" class="form-check-label">Remember me</label> -->
<!-- 	</div> -->

				<div class="btn_wrap txt-center mt30">
					<input type="submit" name="imageField" class="btn btn_member_login btn-m" value="아이디 찾기" alt="아이디 찾기">
				</div>
	</form:form>
</div>

<br/>
<br/>

<div class="list_link">
	<a href="${pageContext.request.contextPath}/member/memberFindPassword.do" class="link_arrow txt-white" title="아이디/비밀번호 찾기">비밀번호 찾기 ></a>
	<a href="${pageContext.request.contextPath}/member/memberEnroll.do" class="link_arrow txt-white" title="회원가입">회원가입 ></a>
</div>

<br/>
<br/>

</section>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>