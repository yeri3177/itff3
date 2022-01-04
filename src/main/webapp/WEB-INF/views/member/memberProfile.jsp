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

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberProfile.css" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberProfile.do" target="_top">프로필사진변경</a></li>
			<li class="on_"><a href="#">예매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top" target="_top">장바구니</a></li>
			<li class="on_"><a href="#" target="_top">상품구매내역</a></li>
			<li class="on_"><a href="#" target="_top">포인트이용내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberWrittenReviewList.do" target="_top">내가쓴게시글</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/member/memberUpdate.do" target="_top">정보수정</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->


<!-- 본문 -->
<div class="join" style="padding-top: 100px; margin: 0;">
 	
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
	<div class="container">

		<h2 class="tit_sec txt-center txt-white">프로필 사진 변경</h2>
 	<div class="profile_con">
 	
 	<div class="imgAndP">
	 	<div class="img_container">
	 		<p class="img_p">변경 전</p>
		 	<div class="box">
			 	<img id="preview-image" class="profile" src="${pageContext.request.contextPath }/resources/upload/member/<sec:authentication property="principal.image"/>">
			</div>
	 	</div>
		
		<div class="img_container">
	 		<p class="img_p">변경 후</p>
		 	<div class="box">
			 	<img id="after-image" class="profile" src="${pageContext.request.contextPath }/resources/upload/member/<sec:authentication property="principal.image"/>">
			</div>
		</div> 	
 	</div>
 	
 	<br />
 	
	<form 
		id="devFrm" 
		method="POST"
		enctype="multipart/form-data">
		
		<div class="form-group row">
		  <label for="email" class="col-sm-2 col-form-label">사진 선택</label>
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
 	</div>
 	</div>


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
	