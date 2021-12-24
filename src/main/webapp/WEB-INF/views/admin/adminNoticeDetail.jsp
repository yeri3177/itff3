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
				      <td>${notice.regDate}</td>
				    </tr>
				    <tr>
				      <th scope="row">첨부파일</th>
				    
				    <td>
				    <div class="buttons">
					<c:forEach items="${notice.attachments}" var="attach" varStatus="vs">
						<button 
							type="button"
							class="btn btn-outline-success btn-block attach"
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
		      
		      <!-- 포인트 이력 
    		  <div class="modal-body">
		        <h5 class="detail-modal-title" id="exampleModalLabel">포인트 이력</h5>
					<table class="table">
					  <thead>
					  <c:choose>
					  <c:when test="${not empty list}">
					    <tr>
					      <th scope="col" style="color:#212121;">이력번호</th>
					      <th scope="col" style="color:#212121;">날짜</th>
					      <th scope="col" style="color:#212121;">내용</th>
					      <th scope="col" style="color:#212121;">내역</th>
					      <th scope="col" style="color:#212121;">포인트</th>
					    </tr>
					  </c:when>
					  <c:otherwise>
					  	<p style="margin-top: 20px;">포인트 내역이 없습니다.</p>
					  </c:otherwise>
					  </c:choose>

					  </thead>
					  <tbody>
					  <c:forEach items="${list }" var="list">
					    <tr>
					      <th scope="row">${list.historyNo }</th>
					      <td><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></td>
					      <td>${list.reason }</td>
					      <td>${list.change }</td>
					      <td><fmt:formatNumber value="${list.point }" pattern="#,###" /></td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
		      </div>
		      -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      	<!-- 
		      	<button 
		      		type="button" 
		      		class="btn btn-primary"
		      		data-toggle="modal"
					data-target="#adminMemberPoint"
					onclick="memberPoint_btn('${member.id}');">포인트 지급</button>
		        <button 
		        	type="button" 
		        	class="btn btn-success" 												
		        	data-toggle="modal"
					data-target="#adminMemberUpdate"
					onclick="memberUpdate_btn('${member.id}');">회원 정보 수정</button>
		      	 -->
		      </div>
		      
<script>

$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/notice/fileDownload.do?no=\${no}`;
});

</script>