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


<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/summernote/summernote-lite.css">
<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1문의" name="title"/>   
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/noticeForm.css" />
<!-- reviewList.css도 이용했기 때문에 필요함 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/reviewList.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

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
			<h2 class="en" style="margin: 0;">1:1 문의</h2>
		</div>
	</div> 
	<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

	<%-- <div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/question/questionList.do">1:1 문의</a>
		</h2>
	</div> --%>
	<div class="list_wrap">
		<div class="ink_list ldn" style="background-color: #FFFFFF">
			<div id="board-container">
				<form:form 
					name="boardFrm" 
					action="${pageContext.request.contextPath}/question/questionEnroll.do?${_csrf.parameterName}=${_csrf.token}" 
					method="post" 
					enctype="multipart/form-data"
					onsubmit="return boardValidate();">
					<input type="text" class="form-control" placeholder="제목" name="questionTitle" id="title" required>
					<input type="hidden" name="admin" class="admin" value="admin" />
					<input type="hidden" class="form-control" name="memberId" value="<sec:authentication property="principal.id"/>" readonly required>
					<!-- <textarea class="form-control" name="questionContent" placeholder="내용" required></textarea> -->
  						<textarea id="summernote" name="questionContent" required></textarea>
					<br />
					<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">첨부파일</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
					    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
					  </div>
					</div>
					
					<br />
					<div class="bt_area bt_right">
						<button class="ib ib_mono" onclick="window.history.back();return false;" type="button">취소</button>
						<button class="ib ib_color" type="submit" id="qa">등록</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</section>		
		
<script>

$('#qa').click(function(e){
    let type = '1:1문의';
    let target = $('.admin').val();
    let content = '새로운 문의사항이 등록되었습니다.'
    let url = '${contextPath}/notify/saveNotify.do';
    	    
    console.log(type);
    console.log(target);
    console.log(content);
    console.log(url);
    
    // 전송한 정보를 db에 저장	
    $.ajax({
        type: "post",
        url:"${pageContext.request.contextPath}/question/saveNotify.do",
        dataType: "text",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        data: {
            target: target,
            content: content,
            type: type,
            url: url
        },
        beforeSend : function(xhr) {   
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success:    // db전송 성공시 실시간 알림 전송
            // 소켓에 전달되는 메시지
            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
        	socket.send("관리자,"+target+","+content+","+url)
//			console.log("관리자,"+target+","+content+","+url)

    });
});

</script>

<script>
/* textarea에도 required 속성을 적용 가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
function boardValidate(){
   var $content = $("[name=questionContent]");
   var $title = $("[name=questionTitle]");
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