<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
    SecurityContext securityContext = SecurityContextHolder.getContext();
    Authentication authentication = securityContext.getAuthentication();
    Member loginMember = (Member) authentication.getPrincipal();
    pageContext.setAttribute("loginMember", loginMember);
%>

<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항 수정" name="title" />
</jsp:include>
<style>
div#board-container{width:400px; margin:0 auto; text-align:center;}
div#board-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}

</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a 
				href="${pageContext.request.contextPath }/review/reviewList.do" 
				target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>


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
		const filename = file?.name;   
		console.log(e.target);
		console.log(filename);
		
		// 2. label에 설정하기
		const $label = $(e.target).next();  
		if(file != undefined)
			$label.html(filename);
		else
			$label.html("파일을 선택하세요.");
	

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

<br />
<br />
<br />
<br />
<br />
<br />
<br />

<div class="ink_list ldn" style="background-color: #FFFFFF">
<div id="board-container">
	<form 
		name="boardFrm"
		action="${pageContext.request.contextPath}/sharing/boardUpdate.do?${_csrf.parameterName}=${_csrf.token}"
		method="POST" 
		enctype="multipart/form-data"
		onsubmit="return boardValidate();">
		<input type="hidden" class="form-control" name="no" value="${board.no}">
		<input type="text" class="form-control" name="memberId" value="${loginMember.id}" readonly required>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <label class="input-group-text" for="inputGroupSelect01">종류</label>
		  </div>
		
		  <select class="custom-select" id="inputGroupSelect01" name="category" >
		    <option value="${board.category}" selected>${board.category == 'P' ? '티켓구함' : (board.category == 'S' ? '티켓양도' : '티켓교환') }</option>		    
		    <option value="P">티켓구함</option>
		    <option value="S">티켓양도</option>
		    <option value="R">티켓교환</option>
		  </select>
		</div>	
		<input type="text" class="form-control" placeholder="제목" name="title" id="title" value="${board.title}" required>
		
		<c:forEach items="${board.attachments}" var="attach" varStatus="vs">
			<c:if test="${attach.attachNo ne 0 }">
			<div class="input-group mb-3" style="padding:0px;">
				<div class="input-group-prepend" style="padding:0px;">
				  <span class="input-group-text">첨부파일</span>
				</div>
				<div class="custom-file">
				  <input type="file" class="custom-file-input" name="upFile" id="upFile" multiple>
				  <label class="custom-file-label" for="upFile1">${board.attachments[0].originalFilename}</label>
				</div>
		   		<div class="delFileArea" style="margin-left: 12px;">
				  <input type="checkbox" name="delFile" id="delFile${vs.count}" value="${attach.attachNo}" style="position: relative; top: 11px;"/>
				  <label for="delFile" style="position: relative; top: 11px;">기존파일삭제</label>
			    </div>
				</div>
			</c:if>
		</c:forEach>
		
		<c:if test="${board.attachments[0].attachNo == 0}">
			<div class="input-group mb-3" style="padding:0px;">
			  <div class="input-group-prepend" style="padding:0px;">
			    <span class="input-group-text">첨부파일</span>
			  </div>
			  <div class="custom-file">
			    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
			    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
			  </div>
			</div>
		</c:if>
		
	    <textarea class="form-control" name="content" placeholder="내용" rows="8" cols="50" required>${board.content}</textarea>
		<br />
		<br />
		<br />
		<br />
		<input type="button" value="취소하기" onclick="history.go(-1);" class="btn btn-outline-success" />&nbsp&nbsp&nbsp&nbsp
		<input type="submit" class="btn btn-outline-success" value="저장하기" >
	</form>
	<br />
	<br />
	<br />
	<br />
</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

