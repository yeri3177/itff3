<%@page import="com.kh.spring.sharing.model.vo.BoardComment"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.context.request.RequestContextListener"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="com.kh.spring.sharing.model.vo.Board"%>

<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAnonymous() || isAuthenticated()">



<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="티켓나눔터 상세보기" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" 
	href="${pageContext.request.contextPath }/resources/css/board/boardDetail.css" />



<!-- // 	boolean editable = false; -->
<!-- // 	SecurityContext securityContext = SecurityContextHolder.getContext(); -->
<!-- // 	Authentication authentication = securityContext.getAuthentication(); -->
	
<!-- // 	Member loginMember = (Member) authentication.getPrincipal(); -->
<!-- // 	if(loginMember != null){ -->
<!-- // 		pageContext.setAttribute("loginMember", loginMember); -->
		
<!-- // 	 	Board board = (Board) request.getAttribute("board"); -->
<!-- // 		editable = loginMember != null && ( -->
<!-- // 						  loginMember.getId().equals(board.getMemberId()) -->
<!-- // 						  ); -->
<!-- // 	} -->


<%
	boolean editable = false;
	SecurityContext securityContext = SecurityContextHolder.getContext();
	Authentication authentication = securityContext.getAuthentication();
	System.out.println(authentication.getPrincipal());
	
	Board board = (Board) request.getAttribute("board");
	
	if(authentication.getPrincipal() != "anonymousUser"){
		Member loginMember = (Member) authentication.getPrincipal();
		pageContext.setAttribute("loginMember", loginMember);
		editable = loginMember != null && (
				loginMember.getId().equals(board.getMemberId())
				);
		
	List<BoardComment> commentList = (List<BoardComment>) request.getAttribute("commentList");
}
%>


<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a 
				href="${pageContext.request.contextPath }/review/reviewList.do" 
				target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>

<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">티켓나눔터</h2>
	</div>
</div>

<div class="board">
	<div id="board-container" class="mx-auto text-center">
		<input type="hidden" name="no" value="${board.no}"
			id="boardNo" />
		<div class="sharingDetail">
		
			<input type="input" class="form-control" placeholder="제목" name="title" style = "text-align:center;"
				id="title" value="${board.title}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 : ${board.readCount}" readonly required>


				
			<div class="form-control" name="content" placeholder="내용" required>
			
				<br /><br />
				<p>${board.content} </p>
				<br /><br />
				<c:forEach items="${board.attachments}" var="attach" varStatus="vs">
					<div class="image-box">
						<img class=""
							src="${pageContext.request.contextPath}/resources/upload/board/${attach.renamedFilename}"
							alt="" />					
					</div>
				</c:forEach>
				<br /> 
			</div>
			<br />
			<br />
<sec:authorize access="isAuthenticated()">
<% 	if(editable){ %>	

			<%-- 작성자만 수정/삭제버튼이 보일수 있게 할 것 --%>
			<a href="javascript:goUpdateBoard();" 
					class="btn btn-outline-success">수정하기</a>&nbsp&nbsp&nbsp&nbsp
			<a href="javascript:goDeleteBoard();" 
					class="btn btn-outline-success">삭제하기</a>&nbsp&nbsp&nbsp&nbsp
					
<% 	} %>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="javascript:goUpdateBoard();" 
					class="btn_brd_edit btn btn-xs btn-secondary">수정하기</a>&nbsp&nbsp&nbsp&nbsp
				<a href="javascript:goDeleteBoard();" 
					class="btn_brd_del btn btn-xs btn-secondary">삭제하기</a>&nbsp&nbsp&nbsp&nbsp	
			</sec:authorize>

			<input type="button" value="목록보기" id="btn-add" class="btn btn-outline-success" onclick="goBoardList();"/>
			<br />

			
		</div>
		<br />
	</div>
</div>

<sec:authorize access="isAuthenticated()">
	<c:set var="loginMemberImage">
	   	<sec:authentication property="principal.image"/> 
	</c:set>	
	<c:set var="loginMemberId">
	    <sec:authentication property="principal.id"/>
	</c:set>	
</sec:authorize>

<!-- 로그인 했을 경우 댓글 쓰는 란이 나옴 -->
<sec:authorize access="isAuthenticated()">
<div class="card my-4">
	<div class="card-body">
		<form:form 
			action="${pageContext.request.contextPath}/sharing/boardCommentEnroll.do?${_csrf.parameterName}=${_csrf.token}"
			name="boardCommentFrm" 
			method="post" 
			class="cmt_form">
			<input type="hidden" name="writer" value="${loginMemberId}" />
			<input type="hidden" name="reviewNo" value="${board.no}" />
			<input type="hidden" name="commentLevel" value="1">
			<input type="hidden" name="commentRef" value="0">
			<div class="form-group">
				<textarea name="content" class="form-control" cols="50" rows="3" placeholder="댓글을 남겨 주세요." style="width: 100%; height: 106px; background-color:#F2F2F2;"></textarea>
			</div>
			<span class="inkpf round"><img class="inkpf_img float-left" src="${pageContext.request.contextPath}/resources/upload/member/${loginMemberImage}" alt="" /></span>
			&nbsp<button class="btn btn-Secondary float" type="submit">댓글등록</button>
		</form:form>
	</div>
</div>
</sec:authorize>
	
<div class="cmt_wrap has_top">
	<div class="cmt_list">
		<c:set var="cnt" value="0"/>  
		<c:forEach items="${commentList}" var="comment" varStatus="vs">
		
		<!-- 댓글 1단계 -->
		<c:if test="${comment.commentLevel eq 1}">
			<article class="cmt_unit level1" id="commentNo${comment.no}">
				<div class="cmt_body">	
				   <div class="media mb-4">
				       <span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${comment.member.image}" alt="" /></span>
				        <div class="media-body" style="background-color:#F2F2F2">
				           <h5 class="mt-0">${comment.member.nickname}</h5>
				           <br />
						   ${comment.content}
			       		</div>
					  	
				<div class="cmt_buttons">
					<div class="cmt_vote">
						<sec:authorize access="isAuthenticated()">
							<div class="cmt_write_option">
								<div class="bt_area bt_right">
									<button class="ib_button" type="submit">댓글</button>
								  <c:if test="${loginMemberId eq comment.writer}">
									<button class="ib_button" type="submit">삭제</button>
							      </c:if>
								</div>
							</div>
						</sec:authorize>
					</div>
				</div>
				</div>
				<div class="cmt_date_wrap text_en font_grey1">
					<span class="cmt_time"><fmt:formatDate value="${comment.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
				</div>
				</div>
			</article>			
		</c:if>
		<!-- 대댓글(2단계) -->
		<c:if test="${comment.commentLevel eq 2}">
			<article class="cmt_unit level2" id="commentNo${comment.no}">
			<div class="cmt_body">
			<div class="media mb-4">	
				 <span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${comment.member.image}" alt="" /></span>
				 <div class="media-body" style="background-color:#F2F2F2">
		           <h5 class="mt-0">${comment.member.nickname}</h5>
		           <br />
				   ${comment.content}
				 </div>
				 <div class="cmt_level2_delete">
					<div class="bt_area bt_right">
					  <c:if test="${loginMemberId eq comment.writer}">
						<button class="ib_button" type="submit">삭제</button>
				      </c:if>
					</div>
				</div>
			</div>
			<div class="cmt_date_wrap text_en font_grey1">
				<span class="cmt_time"><fmt:formatDate value="${comment.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
			</div>
					
			</div>
			
			
			<!-- //cmt_body -->
			</article>
		</c:if>
	
		</c:forEach>
		
		<!-- 댓글 삭제용 폼 -->
		<form:form 
			action="${pageContext.request.contextPath}/sharing/boardCommentDelete.do?${_csrf.parameterName}=${_csrf.token}" 
			name="reviewCommentDelFrm"
			method="POST">
			<input type="hidden" name="no" />
			<input type="hidden" name="boardNo" value="${board.no}" />
		</form:form>	
	</div>
</div>
<br />
<br />
<br />
<br />
<br />	
</sec:authorize>

<script type="text/javascript">
$(".anonymous").click((e) => {
	alert("로그인 후 이용가능합니다.");
});

//댓글 버튼 클릭하면 댓글입력창 뜸
$(".reply").click((e) => {
	
	const commentRef = $(e.target).data("no");
	const image = $(e.target).data("image");
	const id = $(e.target).data("id");
	const reviewNo = $(e.target).data("no");   <%-- data 속성에 대문자를 넣으면 안되는거같다. data-reviewNo 로 했더니 undefined 떴다. --%>
	console.log(commentRef);
	console.log(image);
	console.log(id);
	console.log(no);
	

	// 댓글 하나의 가장 바깥 영역인 article
	const $commentArticle = $(e.target).parent().parent().parent().parent();
	// console.log($commentArticle);

	// 댓글버튼 누른 댓글 다음에 입력창 추가하고 focus. 내용검사는 왜인지 안먹힌다.
	$(div)
		.insertAfter($commentArticle)
		.find("form")
		.submit((e) => {
			// 내용검사
			const $textarea = $("[name=content]", e.target); 

			if(!/^(.|\n)+$/.test($textarea.val())) {
				alert("댓글 내용을 작성해주세요.");
				$textarea.focus();
				return false;
			}	
		})
		.find("[name=content]")
		.focus();

});

function goBoardList() {
	location.href = `${pageContext.request.contextPath}/sharing/boardList.do`;
};


function goUpdateBoard() {
	const boardNo = $("[name=no]").val();
	console.log("boardNo = ", boardNo);
	location.href = `${pageContext.request.contextPath}/sharing/boardUpdate.do?no=\${boardNo}`;
}

function goDeleteBoard() {
	var delBoard = confirm("게시글을 삭제하시겠습니까?");
	if(delBoard) {
		const boardNo = $("[name=no]").val();
		console.log("boardNo = ", boardNo);
		location.href = `${pageContext.request.contextPath}/sharing/boardDelete.do?no=\${boardNo}`;
	}
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</sec:authorize>



<%-- <hr style="margin-top:30px"/>

<div class="comment-container">
	<div class="comment-editor">
		<form 
			action="<%= request.getContextPath() %>/sharing/boardCommentEnroll"
			name="boardCommentFrm"
			method="POST">
			<textarea name="content" id="" cols="60" rows="3"></textarea>
			<button id="btn-insert">등록</button>
			
			<input type="hidden" name="commentLevel" value="1" />
			<input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
			<input type="hidden" name="boardNo" value="<%= board.getNo() %>" />
			<input type="hidden" name="commentRef" value="0" />
		</form>
	</div>
</div> --%>

<!-- Comments form-->
<!-- Single comment-->
<!-- Comment with nested comments-->
<!--  
 
                    <div class="card my-4">

                        <div class="card-body">
                            <form>
                                <div class="form-group"><textarea class="form-control" rows="3" style="background-color:#F2F2F2">댓글을 남겨주세요..</textarea></div>
                                <button class="btn btn-primary float-right"  type="submit">댓글등록</button>
                            </form>
                        </div>
                    </div>
                    
                    <div class="media mb-4">
                        <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                        <div class="media-body" style="background-color:#F2F2F2">
                            <h5 class="mt-0">Commenter Name</h5>
                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                        </div>
                    </div>

                    <div class="media mb-4">
                        <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                        <div class="media-body">
                            <h5 class="mt-0">Commenter Name</h5>
                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                            <div class="media mt-4">
                                <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                                <div class="media-body">
                                    <h5 class="mt-0">Commenter Name</h5>
                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                </div>
                            </div>
                            <div class="media mt-4">
                                <img class="d-flex mr-3 rounded-circle" src="https://via.placeholder.com/50x50" alt="..." />
                                <div class="media-body">
                                    <h5 class="mt-0">Commenter Name</h5>
                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                                </div>
                            </div>
                        </div>
                    </div>
-->

