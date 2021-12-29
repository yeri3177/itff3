<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%>


		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">1:1 문의</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<input type="hidden" name="questionNo1" value="${question.questionNo}" id="questionNo" />
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				  
				    <tr>
				      <th scope="row">제목</th>
				      <td>${question.questionTitle}</td>
				    </tr>

				    <tr>
				      <th scope="row">작성자</th>
				      <td>${question.memberId}<input type="hidden" name="" class="memberId" value="${question.memberId }" /></td>
				    </tr>
				    
				    <tr>
				      <th scope="row">작성일시</th>
				      <td><fmt:formatDate value="${question.regDate }" pattern="yyyy-MM-dd HH:ss:dd"/></td>
				    </tr>
				    
				    <tr>
				      <th scope="row">첨부파일</th>
				    
					    <td>
					    <div class="buttons">
						<c:forEach items="${question.attachments}" var="attach" varStatus="vs">
							<button 
								type="button"
								class="btn btn-outline-info btn-block attach"
								value="${attach.attachNo}">${attach.originalFilename eq null ? '첨부파일 없음' : attach.originalFilename}
							</button>
						</c:forEach>
						</div>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><c:forEach items="${question.attachments}" var="attach"
								varStatus="vs">
								<img
									src="${pageContext.request.contextPath}/resources/upload/question/${attach.renamedFilename}"
									alt="" style="width: 300px; margin-bottom: 20px;" />
							</c:forEach> 
							${question.questionContent}
						</td>
					</tr>

				  </tbody>
				</table>
		      </div>
		      
		      <div class="comment-container" style="background-color: whitesmoke; padding: 20px; display: flex; justify-content: space-between; align-items: center;">

				<c:if test="${qc ne null }">
					<table id="tbl-comment">
						<tbody>
							<tr class="level1">
								<td>
									<sub class="comment-writer">[관리자 답변]</sub> 
									<sub class="comment-date">
									<fmt:formatDate value="${qc.regDate}" pattern="yyyy.MM.dd" /></sub> 
									<br>
									<span>
									${qc.content }
									</span> 
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<button name="commentDelete" class="btn btn-outline-danger btn-delete" id="commentDelete" value="${qc.no }" style="font-size: 13px; background-color: white;">답변삭제</button>
					</div>
				</c:if>

				<c:if test="${qc eq null }">
					<div class="form-group" style="width: 100%;">
					 	<label for="exampleFormControlTextarea1">답변</label>
						<form 
							action="${pageContext.request.contextPath }/admin/adminQuestionCommentEnroll.do?${_csrf.parameterName}=${_csrf.token}" 
							name="boardCommentFrm" 
							method="POST" 
							style="display: flex;">
							<input type="text" name="content" class="form-control" id="exampleFormControlTextarea1"></input>
							<!-- <input type="hidden" name="no" value=""> -->
							<input type="hidden" name="writer" value="${loginMember.id}">
							<input type="hidden" name="questionNo" value="${question.questionNo}">
							<!-- <input type="hidden" name="regDate" value="0"> -->
							<button type="submit" id="question_btn" class="btn btn-outline-dark" style="font-size: 14px; background-color: white;">등록</button> 							
						</form>
					</div>
				</c:if>
			</div>
		      
<script>

$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/admin/fileDownload.do?no=\${no}`;
});

$(document.boardCommentFrm).submit((e) => {
	const $textarea = $("[name=content]", e.target);
	if(!/^(.|\n)+$/.test($textarea.val())){
		alert("댓글 내용을 작성해주세요.");
		$textarea.focus();
		return false;
	}
	return true;
})

$('.btn-delete').click(function (e){
	if(confirm("해당 답변을 삭제하시겠습니까?")) {
		const commentNo = $("[name=commentDelete]").val();
		const questionNo = $("[name=questionNo1]").val();
		location.href = `${pageContext.request.contextPath}/admin/adminQuestionCommentDelete.do?commentNo=\${commentNo}&questionNo=\${questionNo}`;
		
	}
})

</script>

<script>

	$('#question_btn').click(function(e){
	    let modal = $('.modal-content').has(e.target);
	    let type = '70';
	    let target = modal.find('.memberId').val();
	    let content = '문의하신 글에 답변이 등록되었습니다.'
	    let url = '${contextPath}/admin/saveNotify.do';
	    
	    // 전송한 정보를 db에 저장	
	    $.ajax({
	        type: "post",
	        url:"${pageContext.request.contextPath}/admin/saveNotify.do",
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

	    });
	    modal.find('.modal-body textarea').val('');	// textarea 초기화
	});

</script>