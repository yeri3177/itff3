<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">게시글 상세</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<input type="hidden" name="no" value="${review.reviewNo}" id="reviewNo" />
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				    <tr>
				      <th scope="row" style="width: 100px;">제목</th>
				      <td>${review.reviewTitle}</td>
				    </tr>
				    <tr>
				      <th scope="row">작성일</th>
				      <td><fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				    <tr>
				      <th scope="row">첨부파일</th>
				    
				    <td>
				    <div class="buttons">
					<c:forEach items="${review.attachments}" var="attach" varStatus="vs">
						<button 
							type="button"
							class="btn btn-outline-info btn-block attach"
							value="${attach.attachNo}">${attach.originalFilename eq null ? '첨부파일 없음' : attach.originalFilename}
						</button>
					</c:forEach>
					</div>
					
					<div class="form-control" name="content" placeholder="내용" required>
					<br />
					<c:forEach items="${review.attachments}" var="attach" varStatus="vs">
						<img src="${pageContext.request.contextPath}/resources/upload/board/${attach.renamedFilename}" alt="" style="width: 300px; margin-bottom: 20px;" />
					</c:forEach>
					<br />
					</div>
					
				    </td>
				    
					</tr>
					<tr>
					<th scope="row">내용</th>
					<td>${review.reviewContent}</td>
					</tr>
				  </tbody>
				</table>
		      </div>
		      
		      <div class="modal-footer">
		        <button 
		        	type="button" 
		        	class="btn btn-outline-secondary"												
		        	data-toggle="modal"
					data-target="#adminreviewDelete"
					onclick="review_delete_btn('${review.reviewNo}');">삭제</button>
		      </div>
		      
<script>

$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/admin/fileDownload.do?no=\${no}`;
});

</script>