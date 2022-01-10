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

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/reviewList.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/question/questionDetail.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1 문의" name="title"/>   
</jsp:include>
 
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

<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">1:1 문의</h2>
	</div>
</div>

	<%-- <div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/review/reviewList.do">네티즌 리뷰</a>
		</h2>
	</div> --%>
	<div class="list_wrap">
		<div class="ink_list ldn" style="background-color: #FFFFFF">
	<article class="ink_atc round20 has_list">
		<header class="atc_header">
			<p class="boardTitle">${question.questionTitle}</p>		
			
			<div class="atc_info clearfix">
				<span class="atc_nickname">
					<a href="#popup_menu_area" class="member_45775485" onclick="return false">
						<img src="" alt="" title="" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">${question.memberId}
					</a>
				</span>
				<span class="text_en atc_date font_grey1"><span><fmt:formatDate value="${question.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span></span>
				
				<!-- fileDownload -->						
				<!-- <div class="buttons"> -->
					<c:forEach items="${question.attachments}" var="attach" varStatus="vs">
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
				<c:if test="${not empty question.attachments}">
					<c:forEach items="${question.attachments}" var="attach">
						<p><img src="${pageContext.request.contextPath}/resources/upload/question/${attach.renamedFilename}" alt="" style=""></p>
						<br />
					</c:forEach>
				</c:if>
				<%-- 글 작성할 때 엔터쳐서 넣은 공백문자를 살리려면 pre 태그로 감싸야 한다. --%>
				<pre>${question.questionContent}</pre>
			</div>
			<!--AfterDocument(71875352,45775485)-->		
			<div class="atc_buttons clearfix">
				<div class="bt_area bt_right" style="float: right; margin-top: 20px">
					<!-- 로그인 한 경우 -->
					<sec:authorize access="isAuthenticated()">
						<!-- sec태그가 c:if test에 안들어가서 c:set으로 변수를 새로 만들어서 대입 -->
						<c:set var="loginMemberId">
						    <sec:authentication property="principal.id"/>
						</c:set>
						<!-- 로그인 한 회원의 아이디와 현재 보고 있는 글의 작성자 아이디가 동일한 경우 글수정 글삭제 버튼 보임 -->
						<c:if test="${question.memberId eq loginMemberId}">
							<button class="ib ib_mono" onclick="location.href='${pageContext.request.contextPath}/question/questionUpdate.do?no=${question.questionNo}';" type="button">수정</button>
							<button class="ib ib_color" type="button"  data-toggle="modal" data-target="#exampleModal">삭제</button>
						</c:if>
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
							action="${pageContext.request.contextPath}/question/questionDelete.do?${_csrf.parameterName}=${_csrf.token}" 
							name="deleteQeustionFrm" 
							method="post">
							<input type="hidden" name="no" value="${question.questionNo}" />
					        <button type="submit" class="btn btn-primary">삭제</button>
				        </form:form>
				      </div>
				    </div>
				  </div>
				</div>
				
			</div>
			
		</div>
		
<%--     -------- 여기부터 댓글 --------        --%>		

	<div id="comment" class="cmt cmt_bubble">
		<div class="cmt_title">
			<h3>
				답변
			</h3>
			<!-- <span class="ink_bubble_wrap bt_cmt_write">
				<span class="ink_bubble">댓글 쓰기</span>
			</span> -->
		</div>
	<sec:authorize access="isAuthenticated()">
		<c:set var="loginMemberImage">
		   	<sec:authentication property="principal.image"/> 
		</c:set>		
	</sec:authorize>		
		
	<div class="cmt_wrap has_top">
		<div class="cmt_list">
				<c:if test="${qc ne null }">
					<article class="cmt_unit">
						<div class="cmt_header">
							<a href="#popup_menu_area" class="nickname member_25365243" onclick="return false">
								${qc.writer} 관리자
							</a>
						</div>
						<div class="cmt_body">
						<!--BeforeComment(71876047,25365243)-->
							<div class="comment_71876047_25365243 rhymix_content xe_content" data-pswp-uid="2">
								${qc.content}
							</div>
							<!--AfterComment(71876047,25365243)-->
							
							<div class="cmt_buttons">
								<div class="cmt_vote">
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<button name="commentDelete" class="btn-delete btn_brd_del btn btn-xs btn-secondary" id="commentDelete" value="${qc.no }">삭제</button>
									</sec:authorize>
								</div>
							</div>
							<div class="cmt_date_wrap text_en font_grey1">
								<span class="cmt_time"><fmt:formatDate value="${qc.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
							</div>
						</div>
					
					<!-- //cmt_body -->
					
					</article>
				</c:if>


				

				


		</div> <!-- cmt_list -->
		
	</div> <!-- cmt_wrap -->
	 	
				
	<!-- 로그인 했을 경우 댓글 쓰는 란이 나옴 -->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<c:if test="${qc eq null }">
		<div class="cmt_write cmt_write_unit">
			<form:form 
				action="${pageContext.request.contextPath}/question/questionCommentEnroll.do?${_csrf.parameterName}=${_csrf.token}"
				name="questionCommentFrm" 
				id="questionCommentFrm" 
				method="post" 
				class="cmt_form">
				<input type="hidden" name="writer" value="${loginMemberId}" />
				<input type="hidden" name="questionNo" value="${question.questionNo}" />
				<div class="cmt_write_input text_ver">
					<textarea name="content" class="cmt_textarea" cols="50" rows="4" placeholder="댓글 내용을 입력해주세요." style="width: 100%; height: 106px;"></textarea>
				</div>
				<div class="cmt_write_option">
					<div class="bt_area bt_right">
						<button class="ib ib2 ib_color" type="submit">댓글 등록</button>
					</div>
				</div>
			</form:form>
		</div>
		</c:if>
	</sec:authorize>
	
	
	

	</div> <!-- cmt --> 
	</article>
	</div>
</div>

<input type="hidden" class="ws_id" value="${review.memberId }" />
	
</section>		

<!-- 페이지 제일 위로 가는 버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<button onclick="javascript:OnBoardList();" id="to_list" title="Go to List" >목록</button>

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
	location.href = `${pageContext.request.contextPath}/question/fileDownload.do?no=\${no}`;
});


//댓글삭제
$(".btn-delete").click(function() {
	if(confirm("해당 답변을 삭제하시겠습니까?")){
		const commentNo = $("[name=commentDelete]").val();
		const questionNo = $("[name=no]").val();
		location.href = `${pageContext.request.contextPath}/question/questionCommentDelete.do?commentNo=\${commentNo}&questionNo=\${questionNo}`;
	}
});


$(document.questionCommentEnrollFrm).submit((e) => {
	// 내용검사
	// const textarea = $("[name=content]", document.boardCommentFrm);
	const $textarea = $("[name=content]", e.target); 

	if(!/^(.|\n)+$/.test($textarea.val())) {
		alert("댓글 내용을 작성해주세요.");
		$textarea.focus();
		return false;
	}
	
});

function OnBoardList() {
	location.href = `${pageContext.request.contextPath}/question/questionList.do`;
};

</script>

<!-- <script>

$('#reviewCommentFrm').submit(function(e){
    let type = '리뷰게시판';
    let target = $('.ws_id').val();
    let content = '작성하신 리뷰에 댓글이 등록되었습니다.'
    let url = '${contextPath}/notify/saveNotify.do';
    	    
    console.log(type);
    console.log(target);
    console.log(content);
    console.log(url);
    
    // 전송한 정보를 db에 저장	
    $.ajax({
        type: "post",
        url:"${pageContext.request.contextPath}/notify/saveNotify.do",
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
        	socket.send("ITFF,"+target+","+content+","+url)
//			console.log("관리자,"+target+","+content+","+url)

    });
});

</script> -->
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>