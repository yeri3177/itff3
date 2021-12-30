<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- taglib은 공유되지 않으니 jsp마다 작성할 것 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1 문의" name="title"/>
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/question/questionForm.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/review/reviewList.do" target="_top">네티즌리뷰</a></li>
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
<!-- <div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">1:1 문의 </h2>
	</div>
</div> -->
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

<sec:authorize access="isAuthenticated()">


<div class="container_">

	<div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/question/questionList.do">1:1 문의</a>
		</h2>
	</div>

	<div class="cont">
		<div class="container_">
		
			<form 
				name="boardFrm" 
				method="post" 
				action="${pageContext.request.contextPath}/question/questionEnroll.do?${_csrf.parameterName}=${_csrf.token}"
				enctype="multipart/form-data"
				onsubmit="return boardValidate();">
				<input type="hidden" name="memberId" value="<sec:authentication property="principal.id"/>">
				<!-- <input type="hidden" name="strBoardBg" value="">
				<input type="hidden" name="bitHtmlBr" value="0">
				<input type="hidden" name="strSessionID" value="503737302">	
				<input name="strHomepage" type="hidden" id="strHomepage" value="" size="40" maxlength="64">
				<input name="bitCook" type="hidden" class="no_Line" id="bitCook" value="1"> -->
		
				<div class="wz_write">
		
					<!-- <div class="chk_box">
						<div class="chk-primary">
							<input name="bitSecret" type="checkbox" id="bitSecret" value="1" title="비밀글" data-null="not">
							<label for="bitSecret">
							<span></span>비밀글</label>
						</div>
					</div> -->
		
					<div class="write_top">
						<div class="inp_tit_wrap">
							<input name="questionTitle" type="text" id="strSubject" class="inp_tit" maxlength="64" placeholder="제목을 입력해 주세요.">
						</div>
					</div>
		
					<dl class="info_question">
						<dt>
							<label class="lab_info" for="email">
								이름
							</label>
						</dt>
						<dd>
							<div class="wrap_item wrap_id click_event">
								<input type="text" class="inp_txt" name="strName" id="strName" value="<sec:authentication property="principal.name"/>" size="40" maxlength="64" readonly>
							</div>
						</dd>
					</dl>
					<dl class="info_question">
						<dt>
							<label class="lab_info" for="email">
								이메일 주소
							</label>
						</dt>
						<dd>
							<div class="wrap_item wrap_id click_event">
								<input type="text" class="inp_txt" name="strEmail" id="strEmail" value="<sec:authentication property="principal.email"/>" size="40" maxlength="64" readonly>
							</div>
						</dd>
					</dl>
			
					<div class="write_bd" style="min-height:300px;margin-top:10px">
						<textarea name="questionContent" cols="70" rows="16" id="strContent" style="display:block; width:100%"></textarea>
					</div>
		
					<div class="file_wrap">
						<div class="desc bold mb10">파일 선택</div>
		
						<!-- 파일 선택 폼 -->
						<div class="input-group mb-3" style="padding: 0px;">
							<div class="input-group-prepend" style="padding: 0px;">
								<span class="input-group-text">첨부파일1</span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" name="upFile"
									id="upFile1" multiple="multiple"> <label
									class="custom-file-label" for="upFile1">파일을 선택하세요</label>
							</div>
						</div>
						<!-- //파일 선택 폼 -->
					</div>
		
					<div class="txt-center" id="writeButton">
						<input type="submit" class="btn btn-m btn-primary" value="저장"> &nbsp;&nbsp;
						<a href="javascript:history.go(-1);" class="btn btn-m btn-secondary">취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
		
		
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</sec:authorize>	
