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
	<jsp:param value="영화 리뷰" name="title"/>   
</jsp:include>

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
			<li class="on_"><a href="#" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="#" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/reviewList.css" />

<section class="ink_board guest_mode">
	<div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/review/reviewList.do">영화리뷰</a>
		</h2>
	</div>
	<div class="list_wrap">
		<div class="ink_list ldn" style="background-color: #FFFFFF">
			<div id="board-container">
				<form:form 
					name="reviewUpdateFrm" 
					action="${pageContext.request.contextPath}/review/reviewUpdate.do?${_csrf.parameterName}=${_csrf.token}" 
					method="post" 
					enctype="multipart/form-data"
					onsubmit="return boardValidate();">
					<input type="hidden" name="reviewNo" value="${review.reviewNo}" />
					<input type="text" class="form-control" placeholder="제목" name="reviewTitle" id="title" value="${review.reviewTitle}" required>
					<input type="hidden" class="form-control" name="memberId" value="<sec:authentication property="principal.id"/>" readonly required>
					<textarea class="form-control" name="reviewContent" required>${review.reviewContent}</textarea>
					<br />
					<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
					<!-- 글 가져오는 쿼리가 첨부파일 없어도 모두 null로 해서 한줄 가져오는 상태라서 c:if review.attachments != null 하는 의미가 없다. 그래서 attachNo가 0이 아닌 경우로 했다. -->
					<c:forEach items="${review.attachments}" var="attach" varStatus="vs">
						<c:if test="${attach.attachNo ne 0}">
							<div class="input-group mb-3" style="padding:0px;">
							  <div class="input-group-prepend" style="padding:0px;">
							    <span class="input-group-text">첨부파일${vs.count}</span>
							  </div>
							  <div class="custom-file">
							    <input type="file" class="custom-file-input" name="upFile" id="upFile1${vs.count}" data-no="${vs.count}" multiple>
							    <label class="custom-file-label" for="upFile1">${attach.originalFilename}</label>
							  </div>
							  <div class="delFileArea" style="margin-left: 12px;">
								<input type="checkbox" name="delFile" id="delFile${vs.count}" value="${attach.attachNo}" style="position: relative; top: 11px;"/>
								<label for="delFile" style="position: relative; top: 11px;">기존파일삭제</label>
							  </div>
							</div>
						</c:if>
					</c:forEach>
					
					<div class="input-group mb-3" style="padding:0px;">
					  <div class="input-group-prepend" style="padding:0px;">
					    <span class="input-group-text">새 첨부파일</span>
					  </div>
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile2" >
					    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
					  </div>
					  <div class="delFileArea" style="margin-left: 12px; width: 81.95px;">
					  </div>
					</div>
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
		

<style>
section#main-content {
    background-color: #E6E6E6;
    height: auto;
}
div#board-container{
	width:800px; 
	margin:0 auto; 
	text-align:center;
	padding-top: 40px;	
}
textarea.form-control {
	height: 300px;
}
div#board-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}
.ib {
    height: 42px;
    line-height: 42px;
    padding: 0 20px;
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    font-size: 14px;
    z-index: 1;
    border: none;
    color: white;
}
.ib_mono {
    color: #555;
    background-color: #EEE;
}
.bt_right .ib {
    margin-left: 3px;
    vertical-align: middle;
}
.bt_area {
	padding-bottom: 20px; 
}

</style>
		
<script>
function boardValidate(){
	var $content = $("[name=content]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

$(() => {
	$("[name=upFile]").change((e) => {
		// 1. 파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name;   // optional chaining : 객체가 undefined인 경우에도 오류가 나지 않는다.
		console.log(e.target);
		console.log(filename);
		
		// 2. label에 설정하기
		const $label = $(e.target).next();   // 다음 형제요소
		if(file != undefined)
			$label.html(filename);
		else
			$label.html("파일을 선택하세요.");
	
		// 기존파일 삭제 체크박스 관련
		const $file = $(e.target);
		const no = $file.data("no");
		if($file.val() != "") {
			// 파일을 새로 선택한 경우
			console.log($(`#delFile\${no}`));
			$(`#delFile\${no}`)
				.prop("checked", true)
				.hide()
				.next()
				.hide();
		}
		else {
			// 파일선택을 취소한 경우
			console.log($(`#delFile\${no}`));
			$(`#delFile\${no}`)
				.prop("checked", false)
				.show()
				.next()
				.show();
		}	

	});	
});

function formSubmit() {
	document.reviewUpdateFrm.submit();
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>