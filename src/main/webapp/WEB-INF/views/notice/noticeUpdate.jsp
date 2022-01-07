<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page	import="org.springframework.security.core.context.SecurityContext"%>
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title"/>   
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/reviewList.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/boardUpdateCommon.css" />

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/review/reviewList.do" target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->
<script src="${pageContext.request.contextPath }/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<section class="ink_board guest_mode">

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">공지사항</h2>
	</div>
</div> 
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
	<%-- <div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a>
		</h2>
	</div> --%>
	<div class="list_wrap">
		<div class="ink_list ldn" style="background-color: #FFFFFF">
			<div id="board-container">
				<form:form 
					name="noticeUpdateFrm" 
					action="${pageContext.request.contextPath}/notice/noticeUpdate.do?${_csrf.parameterName}=${_csrf.token}" 
					method="post" 
					enctype="multipart/form-data"
					onsubmit="return boardValidate();">
					<input type="hidden" name="noticeNo" value="${notice.noticeNo}" />
					<input type="text" class="form-control" placeholder="제목" name="noticeTitle" id="title" value="${notice.noticeTitle}" required>
					<input type="hidden" class="form-control" name="memberId" value="<sec:authentication property="principal.id"/>" readonly required>
					<textarea id="summernote" name="noticeContent" required>${notice.noticeContent}</textarea>
					<br />
					<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
					
					<!-- 첨부파일 있을 때 -->
					<c:if test="${notice.attachments[0].attachNo != 0 }">
						<div class="input-group mb-3" style="padding: 0px;">
							<div class="input-group-prepend" style="padding: 0px;">
								<span class="input-group-text">첨부파일</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" name="upFile"
									id="upFile1" multiple="multiple"> <label
									class="custom-file-label" for="upFile" id="fname">${notice.attachments[0].originalFilename}</label>
							</div>
							<div id="checkbox">
								<input type="checkbox" name="delFile" id="delFile"
									value="${notice.attachments[0].attachNo}" /> 
								<label for="delFile">기존파일삭제</label>
							</div>
							
							<%--기존파일삭제 누르지 않았을 경우 --%>
							<input type="hidden" name="delFile" value="0" id="delFilePlz"/>
							
						</div>
					</c:if>
			
					<!-- 첨부파일 없을 때 -->
					<c:if test="${notice.attachments[0].attachNo == 0 }">
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
					
					<br />
					<div class="bt_area bt_right">
						<button class="ib ib_color" type="submit">등록</button>
						<button class="ib ib_mono" onclick="window.history.back();return false;" type="button">취소</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</section>		
		


		
<script>
function boardValidate(){
	var $content = $("[name=noticeContent]");
	var $title = $("[name=noticeTitle]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	 else if(/^(.|\n)+$/.test($title.val()) == false) {
		   alert("제목을 입력하세요.");
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
      console.log("filename : " ,filename);
      
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

function formSubmit() {
	document.noticeUpdateFrm.submit();
}
</script>

<script>
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>