<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page
	import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- taglib은 공유되지 않으니 jsp마다 작성할 것 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%>
<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의사항 수정" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/board/boardUpdateCommon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="#" target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->
<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">1:1 문의</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<script>

/* textarea에도 required 속성을 적용 가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
function boardValidate(){
   var $content = $("[name=content]");
   if(/^(.|\n)+$/.test($content.val()) == false){
      alert("내용을 입력하세요");
      return false;
   }
   return true;
}

/* 첨부파일 선택 시 파일명 보이게  */
$(() => {
   $("[name=upFile]").change((e) => {
      
      // 1. 파일명 가져오기
      const file = $(e.target).prop("files")[0];
      const filename = file?.name; // ?: optional chaining 객체가 undefined 경우에도 오류가 나지 않음
      
      console.dir(e.target);
      console.log("filename : ", filename);
      
      // 2. label에 설정하기
      const $label = $(e.target).next(); // e.target의 다음 요소
      
      if(file != undefined) {
         $label.html(filename);
         $(delFile)
			.prop("checked", true);
      }
      else {
         $label.html("파일을 선택하세요.");
      }
      
   
   })
});



</script>

<div id="board-container">
	<form name="boardFrm"
		action="${pageContext.request.contextPath}/question/questionUpdate.do?${_csrf.parameterName}=${_csrf.token}"
		method="POST" enctype="multipart/form-data"
		onsubmit="return boardValidate();">
		
		<input type="hidden" name="questionNo" value="${question.questionNo}" /> <input
			type="hidden" name="memberId" value="${loginMember.id}" required
			readonly> <input type="text" class="form-control"
			name="questionTitle" id="title" value="${question.questionTitle}" required>

		<!-- input: file소스: https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->


			<!-- 첨부파일 있을 때 -->
			<c:if test="${question.attachments[0].attachNo != 0 }">
				<div class="input-group mb-3" style="padding: 0px;">
					<div class="input-group-prepend" style="padding: 0px;">
						<span class="input-group-text">첨부파일</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="upFile"
							id="upFile1" multiple="multiple"> 
						<label class="custom-file-label" for="upFile" id="fname">${question.attachments[0].originalFilename}</label>
					</div>
					<div id="checkbox">
						<input type="checkbox" name="delFile" id="delFile"
							value="${question.attachments[0].attachNo}" /> 
						<label for="delFile">기존파일삭제</label>
					</div>
					
					<%--기존파일삭제 누르지 않았을 경우 --%>
					<input type="hidden" name="delFile" value="0" id="delFilePlz"/>
					
				</div>
			</c:if>

			<!-- 첨부파일 없을 때 -->
			<c:if test="${question.attachments[0].attachNo == 0 }">
				<div class="input-group mb-3" style="padding: 0px;">
					<div class="input-group-prepend" style="padding: 0px;">
						<span class="input-group-text">첨부파일</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="upFile"
							id="upFile1" multiple="multiple"> <label
							class="custom-file-label" for="upFile" id="fname">파일을
							선택하세요.</label>
					</div>
					
					<input type="hidden" name="delFile" value="0" id="delFilePlz"/>
					
				</div>
			</c:if>

		<textarea class="form-control" name="questionContent" required>${question.questionContent}</textarea>

		<br /> 
		<input type="button" value="취소" onclick="history.go(-1);"class="cancelBtn" /> 
		<input type="submit" class="btn btn-outline-success" value="저장">
	</form>
</div>

<script>

/* $("[name=upFile]").change(e => {
	
}); */

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

