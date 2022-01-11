    <%@page import="com.kh.spring.sharing.model.vo.BoardComment"%>
<%@page import="com.kh.spring.sharing.model.vo.Board"%>
<%@page import="java.util.List"%>
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

<fmt:requestEncoding value="utf-8" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
	
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sharing/boardList.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sharing/boardDetail.css" />


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

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="티켓나눔터 상세보기" name="title"/>   
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
			<li class="on_"><a href="${pageContext.request.contextPath }/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 해당 페이지 큰 글씨 -->
	<div class="sub_title_wrap">
		<div class="container">
			<h2 class="en">티켓나눔터</h2>
		</div>
	</div> 
	<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
<div class="ink_board guest_mode">
	<div class="list_wrap">
		<div class="ink_list ldn" style="background-color: #FFFFFF">
	<div class="ink_atc round20 has_list">
		<div class="atc_header">
			<p class="boardTitle">${board.title}</p>		
			
			<div class="atc_info clearfix">
				<span class="atc_nickname">
					
					<a href="#popup_menu_area" class="member_45775485" onclick="return false">
						<img src="" alt="" title="" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">${board.member.nickname}
					</a>
				</span>
				<span class="text_en atc_date font_grey1"><span><fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span></span>
				<div class="atc_info_right text_en font_grey1">
					<span class="count_read"><i class="fas fa-eye" title="조회 수"></i>조회수 ${board.readCount}</span>					
				</div>
			</div>
		</div>
		<div class="atc_body">
		<div class="content">
			<p style="text-align:center;">${board.content} </p>
				<br /><br />
				<c:forEach items="${board.attachments}" var="attach" varStatus="vs">
					<div class="image-box">
						<center>
							<img class="" src="${pageContext.request.contextPath}/resources/upload/board/${attach.renamedFilename}" alt="" />
						</center>				
					</div>
				</c:forEach>
				<br /><br />
	
		</div>	
			<div class="atc_buttons clearfix"></div>
		</div>
		
<%--     -------- 여기부터 댓글 --------        --%>		

		<div id="comment" class="cmt cmt_bubble">
			<div class="cmt_title">
				<div class="btn_wrapper">
					<sec:authorize access="isAuthenticated()">
				<% 	if(editable){ %>	
		
					<%-- 작성자만 수정/삭제버튼이 보일수 있게 할 것 --%>
					<!-- <a href="javascript:goUpdateBoard();" 
							class="btn btn-outline-success">수정하기</a> -->
					<button class="btn_brd_edit btn btn-xs btn-secondary" 
							onclick="location.href='${pageContext.request.contextPath}/sharing/boardUpdate.do?no=${board.no}';" 
							type="button">수정하기</button>&nbsp&nbsp
					<!-- <a href="javascript:goDeleteBoard();" 
							class="btn btn-outline-success">삭제하기</a> -->
					<button class="btn btn-outline-success" 
							type="button"  
							onclick="deleteBoard()">삭제하기</button>&nbsp&nbsp
							
				<% 	} %>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<!-- <a href="javascript:goUpdateBoard();" 
							class="btn_brd_edit btn btn-xs btn-secondary">수정하기</a> -->
						<button class="btn_brd_edit btn btn-xs btn-secondary" 
							onclick="location.href='${pageContext.request.contextPath}/sharing/boardUpdate.do?no=${board.no}';" 
							type="button">수정하기</button>&nbsp&nbsp
						
						<a href="javascript:goDeleteBoard();" 
							class="btn_brd_del btn btn-xs btn-secondary" onclick="deleteBoard()">삭제하기</a>&nbsp&nbsp&nbsp&nbsp	
					</sec:authorize>
		
					</sec:authorize>
					<input type="button" value="목록보기" id="btn-add" class="btn btn-outline-success" onclick="goBoardList();"/>
				</div>
			</span>
			</div>
	<!-- //cmt_notice -->
		
	<sec:authorize access="isAuthenticated()">
		<c:set var="loginMemberImage">
		   	<sec:authentication property="principal.image"/> 
		</c:set>
		<c:set var="loginMemberId">
	    	<sec:authentication property="principal.id"/>
		</c:set>		
	</sec:authorize>		
		
	<div class="cmt_wrap has_top">
		<div class="cmt_list">
			<c:forEach items="${commentList}" var="comment" varStatus="vs">
			
				<!-- 댓글 1단계 -->
				<c:if test="${comment.commentLevel eq 1}">
					
					<article class="cmt_unit" id="commentNo${comment.no}">
						<div class="inkpf_wrap">
							<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${comment.member.image}" alt="" /></span>				
						</div>
						<div class="cmt_header" style="margin-bottom: 6px;">
							<a href="#popup_menu_area" class="nickname member_25365243" onclick="return false">
								${comment.member.nickname}
							</a>
						</div>
						<div class="cmt_body">
						<!--BeforeComment(71876047,25365243)-->
							<div class="comment_71876047_25365243 rhymix_content xe_content" data-pswp-uid="2">
								${comment.content}
							</div>
							<div class="cmt_buttons">
								<div class="cmt_vote">
									<sec:authorize access="isAuthenticated()">
										<a class="bt bt2 reply" href="javascript:void(0)" data-no="${comment.no}" data-image="${loginMemberImage}" data-id="${loginMemberId}" data-boardno="${board.no}" data-commentRef="1" style=" border-radius: 2.5px;">
											댓글
										</a>
										<c:if test="${loginMemberId eq comment.writer}">
											<a class="bt bt2 deleteComment" href="javascript:void(0)" data-no="${comment.no}" style="border-radius: 2.5px;">
												삭제
											</a>
										</c:if>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
									<a class="bt bt2 anonymous" href="javascript:void(0)">
										댓글
									</a>
									</sec:authorize>
								</div>
							<div class="font_grey1">
								<span class="cmt_time"><fmt:formatDate value="${comment.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
							</div>
							</div>
						</div>
					
					<!-- //cmt_body -->
					
					</article>
				</c:if>


				<!-- 대댓글(2단계) -->
				<c:if test="${comment.commentLevel eq 2}">
					<article class="cmt_unit level2" id="commentNo${comment.no}">
						<div class="inkpf_wrap">
							<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${comment.member.image}" alt="" /></span>
						</div>
						<div class="cmt_header" style="margin-bottom: 6px;">
							<a href="#popup_menu_area" class="nickname member_25365243" onclick="return false">
								${comment.member.nickname}
							</a>
						</div>
						<div class="cmt_body">
						<!--BeforeComment(71876047,25365243)-->
							<div class="comment_71876047_25365243 rhymix_content xe_content" data-pswp-uid="2">
								${comment.content}
							</div>
							<div class="cmt_buttons">
								<div class="cmt_vote">
									<sec:authorize access="isAuthenticated()">
										<a class="bt bt2 reply" href="javascript:void(0)" data-no="${comment.no}" data-image="${loginMemberImage}" data-id="${loginMemberId}" data-boardno="${board.no}" data-commentRef="1" style=" border-radius: 2.5px;">
											댓글
										</a>
										<c:if test="${loginMemberId eq comment.writer}">
											<a class="bt bt2 deleteComment" href="javascript:void(0)" data-no="${comment.no}" style="border-radius: 2.5px;">
												삭제
											</a>
										</c:if>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
									<a class="bt bt2 anonymous" href="javascript:void(0)">
										댓글
									</a>
									</sec:authorize>
								</div>
							<div class="font_grey1">
								<span class="cmt_time"><fmt:formatDate value="${comment.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
							</div>
							</div>
						</div>
					<!-- //cmt_body -->
					</article>
				</c:if>
			</c:forEach>
			<br /><br />
		<!-- 댓글 삭제용 폼 -->
		<form:form 
			action="${pageContext.request.contextPath}/sharing/boardCommentDelete.do?${_csrf.parameterName}=${_csrf.token}" 
			name="boardCommentDelFrm"
			method="POST">
			<input type="hidden" name="no" />
			<input type="hidden" name="boardNo" value="${board.no}" />
		</form:form>			

		</div> <!-- cmt_list -->
		
	</div> <!-- cmt_wrap -->
	 	
	<!-- 게시글 삭제용 폼 -->		
	<form:form 
		action="${pageContext.request.contextPath}/sharing/boardDelete.do?${_csrf.parameterName}=${_csrf.token}"
		name="deleteBoardFrm"
		method="POST">
		<input type="hidden" name="no" value="${board.no}" />
	</form:form>			
				
	<!-- 로그인 후 댓글쓰기 가능 -->
	<sec:authorize access="isAuthenticated()">
		<div class="cmt_write cmt_write_unit">
			<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${loginMemberImage}" alt="" /></span>
			<form:form 
				action="${pageContext.request.contextPath}/sharing/boardCommentEnroll.do?${_csrf.parameterName}=${_csrf.token}"
				name="boardCommentFrm" 
				method="post" 
				id="ws_comment_frm1"
				class="cmt_form">
				<input type="hidden" name="writer" class="writer" value="${loginMemberId}" />
				<input type="hidden" name="boardNo" value="${board.no}" />
				<input type="hidden" name="commentLevel" value="1">
				<input type="hidden" name="commentRef" value="0">
				<div class="cmt_write_input text_ver">
					<textarea name="content" class="cmt_textarea" cols="50" rows="4" placeholder="댓글 내용을 입력해주세요." style="width: 100%; height: 106px;"></textarea>
				</div>
				<div class="cmt_write_option">
					<span class="write_option"></span>
					<div class="bt_area bt_right">
						<button class="ib ib2 ib_color" type="submit" style="border-radius: 3.5px;">댓글 등록</button>
					</div>
				</div>
			</form:form>
		</div>
	</sec:authorize>
	
	
	<!-- 로그인 안 한 경우 댓글입력란 자리에 표시될 것 -->
	<%-- <sec:authorize access="isAnonymous()">
		<div class="cmt_write cmt_write_unit no_grant">
			<div class="cmt_not_permitted" style="font-size: 14px">
				<img src="${pageContext.request.contextPath}/resources/upload/board/댓글수 아이콘.png" style="position: relative; top: 5px; right: 2px;" alt="" /> 권한이 없습니다. &nbsp;&nbsp;<a class="ink_link2" href="${pageContext.request.contextPath}/member/memberLogin.do" >로그인</a>
			</div>
		</div>
	</sec:authorize> --%>

	<%-- <div class="ink_message ink_warn cmt_delete">
		<div>
			<h3>댓글 삭제</h3>
			<button class="bt_close bt_xclose" type="button"><svg viewBox="0 0 1024 1024"><title>close</title><path class="path1" d="M548.203 537.6l289.099-289.098c9.998-9.998 9.998-26.206 0-36.205-9.997-9.997-26.206-9.997-36.203 0l-289.099 289.099-289.098-289.099c-9.998-9.997-26.206-9.997-36.205 0-9.997 9.998-9.997 26.206 0 36.205l289.099 289.098-289.099 289.099c-9.997 9.997-9.997 26.206 0 36.203 5 4.998 11.55 7.498 18.102 7.498s13.102-2.499 18.102-7.499l289.098-289.098 289.099 289.099c4.998 4.998 11.549 7.498 18.101 7.498s13.102-2.499 18.101-7.499c9.998-9.997 9.998-26.206 0-36.203l-289.098-289.098z"></path></svg></button>
			<form 
				class="inner" 
				action="${pageContext.request.contextPath}/sharing/boardCommentDelete.do?${_csrf.parameterName}=${_csrf.token}" 
				method="get" 
				onsubmit="return procFilter(this, delete_comment)">
				<input type="hidden" name="error_return_url" value="/movietalk/71875352?category=61633579"><input type="hidden" name="act" value="dispBoardContent">
				<input type="hidden" name="mid" value="movietalk">
				<input type="hidden" name="document_srl" value="71875352">
				<input type="hidden" name="comment_srl" value="">
				<p class="message_target">"<span class="nickname"></span>님의 댓글"</p>
				<p class="message_text">이 댓글을 삭제하시겠습니까?</p>
				<div class="bt_area bt_duo">
					<button class="ib ib_mono bt_close" type="button">취소</button><button class="ib ib_color" onclick="deleteSubmit(this);" type="submit">확인</button>
				</div>
			</form>
		</div>
	</div> --%>
	</div> <!-- cmt --> 
	</div> <!-- class="ink_atc round20 has_list" -->
	</div>
</div>
	
</div>	

<input type="hidden" class="ws_id" value="${board.memberId }" />

<script>

$("#ws_comment_frm1").submit(function(e){
    let type = '티켓나눔터';
    let target = $(".ws_id").val();
    let content = '[티켓나눔터] 작성하신 글에 댓글이 등록되었습니다.'
    let url = '${contextPath}/notify/saveNotify.do';
    let writer = $(".writer").val();
    	    
    console.log(type);
    console.log(target);
    console.log(content);
    console.log(url);
    
    // 글 작성자와 댓글 작성자가 같으면 알림 보내지 않게
    if(target == writer) {
    	target = null;
    }
    
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

</script>	

<script>
$(".anonymous").click((e) => {
	alert("로그인 해주세요.");
});

// 댓글 삭제
$(".deleteComment").click(function(e){
	console.log(this);
	console.log(e.target);
	console.log(e.target === this);
	
	if(confirm("해당 댓글을 삭제하시겠습니까?")){
		var $frm = $(document.boardCommentDelFrm);
		/* var no = $(this).val(); */
		var no = $(this).data("no");
		console.log(no);
		$frm.find("[name=no]").val(no);
		$frm.submit();
	}
});

</script>

<script>
// 댓글 등록
$(".reply").click((e) => {
	console.log("reply 버튼 클릭되었음");
	$(".cmt_write_re").remove();
	
	const commentRef = $(e.target).data("no");
	const image = $(e.target).data("image");
	const id = $(e.target).data("id");
	const boardNo = $(e.target).data("boardno");   <%-- data 속성에 대문자를 넣으면 안되는거같다. data-reviewNo 로 했더니 undefined 떴다. --%>
	
	console.log(commentRef);
	console.log(image);
	console.log(id);
	console.log(boardNo);
	
	
	const div = `<div class="cmt_write_unit cmt_write_re" id="cmt_write_re" style="display: block;">
		<form:form 
			action="${pageContext.request.contextPath}/sharing/boardCommentEnroll.do"
			name="boardCommentEnrollFrm"
			method="post" 
			class="cmt_form" 
			style="height: auto;">
			<input type="hidden" name="writer" value="\${id}" />
			<input type="hidden" name="boardNo" value="\${boardNo}" />
			<input type="hidden" name="commentLevel" value="2">
			<input type="hidden" name="commentRef" value="\${commentRef}">
			<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/\${image}" alt="" /></span>
			<div class="cmt_write_input text_ver">
				<textarea class="cmt_textarea" name="content" id="editor_2" placeholder="댓글 내용을 입력해주세요." style="width: 100%;" required></textarea>
			</div>
			<div class="cmt_write_option">
				<div class="bt_area bt_right">
					<button class="ib ib2 ib_color" type="submit" style="border-radius: 3.5px;">댓글 등록</button>
					<button class="ib ib2 ib_mono bt_close" type="button" onclick='$(".cmt_write_re").remove();' style="border-radius: 3.5px;">취소</button>
				</div>
			</div>
		</form:form>
	</div>`;
	
	console.log(div);
	console.log($(div));
	
	const $commentArticle = $(e.target).parent().parent().parent().parent();
	
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
})

$(document.reviewCommentEnrollFrm).submit((e) => {
	// 내용검사
	// const textarea = $("[name=content]", document.boardCommentFrm);
	const $textarea = $("[name=content]", e.target); 

	if(!/^(.|\n)+$/.test($textarea.val())) {
		alert("댓글 내용을 작성해주세요.");
		$textarea.focus();
		return false;
	}
	
});

function goBoardList() {
	location.href = `${pageContext.request.contextPath}/sharing/boardList.do`;
};


/* function goUpdateBoard() {
	const boardNo = $("[name=no]").val();
	console.log("boardNo = ", boardNo);
	location.href = `${pageContext.request.contextPath}/sharing/boardUpdate.do?no=\${boardNo}`;
};
 */
/* function goDeleteBoard() {
	var delBoard = confirm("게시글을 삭제하시겠습니까?");
	if(delBoard) {
		const boardNo = $("[name=no]").val();
		console.log("boardNo = ", boardNo);
		location.href = `${pageContext.request.contextPath}/sharing/boardDelete.do?no=\${boardNo}`;
	}
}; */

const deleteBoard = () => {
	if(confirm("정말 이 게시물을 삭제하시겠습니까?")){
		$(document.deleteBoardFrm).submit();
	}
};

</script>


<script type="text/javascript">

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    
