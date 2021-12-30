<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page	import="org.springframework.security.core.context.SecurityContext"%>

<fmt:requestEncoding value="utf-8" />	<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="네티즌 리뷰 - ${notice.noticeTitle}" name="title"/>   
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/noticeList.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/noticeDetail.css" />

<style>
.btn-outline-success {
    color: #000000;
    background-color: transparent;
    background-image: none;
    border-color: #00000000;
    float: right;
}

.btn-block {
    display: inline;
    width: auto;
}

.btn-outline-success:hover {
    color: #000;
    background-color: #f7f7f7;
    border-color: #f7f7f7;
}

.btn-outline-success.focus, .btn-outline-success:focus {
    box-shadow: 0 0 0 0.2rem rgb(247 247 247);
}

.btn-outline-success:not(:disabled):not(.disabled):active {
	color: #000;
    background-color: #f7f7f7;
    border-color: #f7f7f7;
}


</style>

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
			<li class="on_"><a href="${pageContext.request.contextPath}/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<section class="ink_board guest_mode">
	<div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a>
		</h2>
	</div>
	<div class="list_wrap">
		<div class="ink_list ldn" style="background-color: #FFFFFF">
	<article class="ink_atc round20 has_list">
		<header class="atc_header">
			<p class="boardTitle">${notice.noticeTitle}</p>		
			
			
			
			<div class="atc_info clearfix">
				<span class="text_en atc_date font_grey1"><span><fmt:formatDate value="${notice.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span></span>
				<!-- fileDownload -->						
				<!-- <div class="buttons"> -->
					<c:forEach items="${notice.attachments}" var="attach" varStatus="vs">
						<button type="button"
							class="btn btn-outline-success btn-block attach"
							value="${attach.attachNo}">${attach.originalFilename}</button>
					</c:forEach>
				<!-- </div> -->
			</div>
		</header>
		<div class="atc_body">
				
				
			<!--BeforeDocument(71875352,45775485)-->
			<div class="document_71875352_45775485 rhymix_content xe_content" data-pswp-uid="1">
				<c:if test="${not empty notice.attachments}">
					<c:forEach items="${notice.attachments}" var="attach">
						<p><img src="${pageContext.request.contextPath}/resources/upload/notice/${attach.renamedFilename}" alt="" style=""></p>
						<br />
					</c:forEach>
				</c:if>
				<pre>${notice.noticeContent}</pre>
			</div>
			<!--AfterDocument(71875352,45775485)-->		
			<div class="atc_buttons clearfix">
				<div class="bt_area bt_right" style="float: right; margin-top: 20px">
					<!-- 로그인 한 경우 -->
					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button class="ib ib_mono" onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdate.do?no=${notice.noticeNo}';" type="button">수정</button>
							<button class="ib ib_color" type="button"  data-toggle="modal" data-target="#exampleModal">삭제</button>
						</sec:authorize>
					</sec:authorize>
				</div>
				
				
				<!-- 글 삭제 버튼 클릭시 나타나는 Modal -->
				<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered to modal-dialo">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h3 class="modal-title" id="exampleModalLabel">글을 삭제하려고 합니다.</h3>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        정말 삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        
						<form:form 
							action="${pageContext.request.contextPath}/notice/noticeDelete.do?${_csrf.parameterName}=${_csrf.token}" 
							name="deleteNoticeFrm" 
							method="post">
							<input type="hidden" name="no" value="${notice.noticeNo}" />
					        <button type="submit" class="btn btn-primary">삭제</button>
				        </form:form>
				      </div>
				    </div>
				  </div>
				</div>
				
			</div>
			
		</div>
		

	</article>
	</div>
</div>
	
</section>		

<!-- 페이지 제일 위로 가는 버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<button onclick="location.herf=history.go(-1);" id="to_list" title="Go to List" >목록</button>

<script type="text/javascript">
//페이지 제일 위로 가는 버튼
//Get the button:
mybutton = document.getElementById("myBtn");

//When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	mybutton.style.opacity = 1;
	} else {
	mybutton.style.opacity = 0;
	}
}

//When the user clicks on the button, scroll to the top of the document
function topFunction() {
document.body.scrollTop = 0; // For Safari
document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

$(".attach").click((e) => {
	const no = $(e.target).val();
	console.log(no);
	location.href = `${pageContext.request.contextPath}/notice/fileDownload.do?no=\${no}`;
});


</script>

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>