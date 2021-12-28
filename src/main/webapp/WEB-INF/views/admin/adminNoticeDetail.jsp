<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">공지사항</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<input type="hidden" name="no" value="${notice.noticeNo}" id="noticeNo" />
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				    <tr>
				      <th scope="row">제목</th>
				      <td>${notice.noticeTitle}</td>
				    </tr>
				    <tr>
				      <th scope="row">작성일</th>
				      <td><fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				    <tr>
				      <th scope="row">첨부파일</th>
				    
				    <td>
				    <div class="buttons">
					<c:forEach items="${notice.attachments}" var="attach" varStatus="vs">
						<button 
							type="button"
							class="btn btn-outline-info btn-block attach"
							value="${attach.attachNo}">${attach.originalFilename eq null ? '첨부파일 없음' : attach.originalFilename}
						</button>
					</c:forEach>
					</div>
					
					<div class="form-control" name="content" placeholder="내용" required>
					<br />
					<c:forEach items="${notice.attachments}" var="attach" varStatus="vs">
						<img src="${pageContext.request.contextPath}/resources/upload/notice/${attach.renamedFilename}" alt="" style="width: 300px; margin-bottom: 20px;" />
					</c:forEach>
					<br />
					</div>
					
				    </td>
				    
					</tr>
					<tr>
					<th scope="row">내용</th>
					<td>${notice.noticeContent}</td>
					</tr>
				  </tbody>
				</table>
		      </div>
		      

		      <div class="modal-footer">
		      	<button 
		      		type="button" 
		      		class="btn btn-success"
		      		data-toggle="modal"
					data-target="#adminNoticeUpdate"
					onclick="notice_update_btn('${notice.noticeNo}');">수정</button>
		        <button 
		        	type="button" 
		        	class="btn btn-danger" 												
		        	data-toggle="modal"
					data-target="#adminNoticeDelete"
					onclick="notice_delete_btn('${notice.noticeNo}');">삭제</button>
		      </div>
		      
<script>

$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/notice/fileDownload.do?no=\${no}`;
});

</script>