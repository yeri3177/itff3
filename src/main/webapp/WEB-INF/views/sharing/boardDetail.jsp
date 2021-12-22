<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 상세보기" name="title"/>
</jsp:include>

<style>
div#board{margin:20px 20px 20px 20px;}
div#board-container{width:400px;}
input, button, textarea {margin-bottom:15px;}
button { overflow: hidden; }
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}
</style>
<br />
<br />
<br />
<br />
<br />
<div id="board">
	<div id="board-container" class="mx-auto text-center">
		<input type="text" class="form-control" 
			   placeholder="제목" name="title" id="title" 
			   value="${board.title}" required>
		<input type="text" class="form-control"  
			   name="memberId" 
			   value="${board.memberId}" readonly required>
	
		<c:forEach items="${board.attachments}" var="attach" varStatus="vs">
			<button type="button" 
					class="btn btn-outline-success btn-block attach"
					value="${attach.attachNo}">
				첨부파일${vs.count} - ${attach.originalFilename}	
			</button>
		</c:forEach>
		  
	    <textarea class="form-control" name="content" 
	    		  placeholder="내용" required>${board.content}</textarea>
	    <input type="number" class="form-control" name="readCount" title="조회수"
			   value="${board.readCount}" readonly>
		<input type="datetime-local" class="form-control" name="regDate" 
			   value='<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd'T'HH:mm"></fmt:formatDate>'>   <!-- datetime-local이 원하는 포맷이 이거라서 패턴을 여기에 맞게 써줌. 'T'의 홑따옴표는 이스케이핑이라고 함 -->   
	</div>
</div>
<script>
$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
});
</script>
<br />
<br />
<br />
<br />
<br />

<script>
$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/board/fileDownload.do?no=\${no}`;
})
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
