<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%>

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminFrm.css" />

<!-- 관리자 헤더 -->
<jsp:include page="/WEB-INF/views/admin/common/adminSectionHeader.jsp"></jsp:include>

<!-- 공지사항 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminNoticeNavBar.jsp"></jsp:include>
	
<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

	<div class="row justify-content-center">
		<div class="col-md-6 text-center mb-4">
			<h2 class="heading-section">공지사항</h2>
		</div>
	</div>

	<div class="container">
		<div class="total">
		<div class="insert_container">
			<div class="container">
			<form name="boardFrm"
				action="${pageContext.request.contextPath}/admin/adminNoticeEnroll.do?${_csrf.parameterName}=${_csrf.token}"
				method="POST" 
				enctype="multipart/form-data"
				onsubmit="return boardValidate();">
				
				<input type="hidden" name="memberId" value="${loginMember.id}" required readonly> 
				<input type="text" class="form-control" placeholder="제목" name="noticeTitle" id="title" style="margin-bottom: 20px;" required>
		
				<!-- upFile1 -->
				<div class="input-group mb-3" style="padding: 0px;">
					<div class="input-group-prepend" style="padding: 0px;">
						<span class="input-group-text">첨부파일1</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple="multiple"> 
						<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
					</div>
				</div>
		
				<!-- upFile2 -->
				<div class="input-group mb-3" style="padding: 0px;">
					<div class="input-group-prepend" style="padding: 0px;">
						<span class="input-group-text">첨부파일2</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="upFile" id="upFile2"> 
						<label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
					</div>
				</div>
		
				<textarea class="form-control" name="noticeContent" placeholder="내용" required></textarea>
				<br /> 
				<div style="text-align: center;">
					<input type="button" class="btn btn-secondary" value="취소" onclick="history.go(-1);" style="margin: 0;"/>
					<input type="submit" class="btn btn-info" value="저장">
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

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
      console.log(filename);
      
      // 2. label에 설정하기
      const $label = $(e.target).next(); // e.target의 다음 요소
      
      if(file != undefined) {
         $label.html(filename);
      }
      else {
         $label.html("파일을 선택하세요.");
      }
   })
});

</script>

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>