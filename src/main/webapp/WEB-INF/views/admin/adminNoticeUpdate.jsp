<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
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
		        <h4 class="modal-title" id="exampleModalLabel">공지사항 수정</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>

			<div>
				<form 
				name="boardFrm"
				action="${pageContext.request.contextPath}/admin/adminNoticeUpdate.do?${_csrf.parameterName}=${_csrf.token}"
				method="POST" 
				enctype="multipart/form-data">
				
		      <div class="modal-body">
		      	<input type="hidden" name="noticeNo" value="${notice.noticeNo}" id="noticeNo" />
		      	<input type="hidden" name="memberId" value="${loginMember.id}" required />
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				    <tr>
				      <th scope="row">제목</th>
				      <td><input type="text" class="form-control" name="noticeTitle" id="title" value="${notice.noticeTitle}" required></td>
				    </tr>
				    <tr>
				      <th scope="row">작성일</th>
				      <td><fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				    <tr>
				      <th scope="row">첨부파일</th>
				    <td>
				    
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

				    </td>				    
					</tr>
					
					<tr>
					<th scope="row">내용</th>
					<td><textarea class="form-control" name="noticeContent" required>${notice.noticeContent}</textarea></td>
					</tr>
					
				  </tbody>
				</table>
		      </div>

		      <div class="modal-footer">
		      	<input type="submit" class="btn btn-success" value="수정">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		      </form>
			</div>
		      
<script>

$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/notice/fileDownload.do?no=\${no}`;
});

</script>

<script>

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

</script>