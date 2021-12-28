<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/guide/guide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">프로필 사진 추가/수정/삭제</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->

<!-- 본문 -->

<style>
div#demo-container{
	text-align: center;
	width:550px;
}
.box{
	width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
    margin : auto;
}
.profile{
	width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>

<div id="demo-container" 
	 class="border border-secondary mx-auto p-3 rounded">
 	
<%-- 	<!-- 프로필사진 -->
 	<c:choose>
		<!-- 멤버의 프로필 사진이 있을 때 -->
		<c:when test="${empty image }">
			<div class="box">
			 	<img id="preview-image" class="profile" width="300px" height="300px" src="${pageContext.request.contextPath }/resources/images/member/common-profile-image.png">
			</div>
		</c:when>
		<!-- 멤버의 프로필사진이 없을 때 -->
		<c:otherwise>
			<div class="box">
			 	<img id="preview-image" class="profile" width="300px" height="300px" src="https://static.nid.naver.com/images/web/user/default.png">
			</div>
		</c:otherwise>
	</c:choose>
 --%>
	<!-- 프로필사진 -->
 	<!-- 멤버의 프로필 사진이 있을 때 -->
 	<div class="box">
 		<p>before</p>
	 	<img id="preview-image" class="profile" src="${pageContext.request.contextPath }/resources/upload/member/<sec:authentication property="principal.image"/>">
	</div>
 	
 	<div class="box">
 		<p>after</p>
	 	<img id="after-image" class="profile" src="${pageContext.request.contextPath }/resources/upload/member/<sec:authentication property="principal.image"/>">
	</div>
 	
 	<br />
 	
	<form 
		id="devFrm" 
		method="POST"
		enctype="multipart/form-data">
		<div class="form-group row">
		  <label for="email" class="col-sm-2 col-form-label">사진을 넣어주세요</label>
		  <div class="col-sm-10">
		    <input type="file" class="form-control" id="input-image" name="upFile" accept="image/*">
		  </div>
		</div>
		
	<!-- 전송버튼  -->
	<div class="list-group">
	  <button type="button" onclick="submitProcess('changeImage');" class="list-group-item list-group-item-action">사진변경</button>
	  <button type="button" onclick="submitProcess('deleteImage');" class="list-group-item list-group-item-action">사진삭제</button>
	  <button type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberDetail.do';" class="list-group-item list-group-item-action">뒤로가기</button>
	</div>
	
	</form>
</div>

<br />
<br />
<br />
<script>
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
       
        const reader = new FileReader()
        
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("after-image")
            previewImage.src = e.target.result
        }
        
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})

const submitProcess = (name) => {
	$(devFrm)
		.attr("action", `${pageContext.request.contextPath}/member/\${name}.do?${_csrf.parameterName}=${_csrf.token}`)
		.submit();
};
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	