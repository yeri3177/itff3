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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board/reviewDetail.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="네티즌 리뷰 - ${review.reviewTitle}" name="title"/>   
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
			<li class="on_"><a href="#" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="#" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<section class="ink_board guest_mode">
	<div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/review/reviewList.do">네티즌 리뷰</a>
		</h2>
	</div>
	<div class="list_wrap">
		<div class="ink_list ldn" style="background-color: #FFFFFF">
	<article class="ink_atc round20 has_list">
		<header class="atc_header">
			<p class="boardTitle">${review.reviewTitle}</p>		
			
			<div class="atc_info clearfix">
				<span class="atc_nickname">
					<span class="inkpf color round small">
						<img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${review.member.image}" alt="">
					</span>
					<a href="#popup_menu_area" class="member_45775485" onclick="return false">
						<img src="" alt="" title="" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">${review.member.nickname}
					</a>
				</span>
				<span class="text_en atc_date font_grey1"><span><fmt:formatDate value="${review.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span></span>
				<div class="atc_info_right text_en font_grey1">
					<span class="count_read"><img src="${pageContext.request.contextPath}/resources/upload/board/조회수 아이콘.png" style="position: relative; top: 4px; right: 3px;" alt="" /><i class="fas fa-eye" title="조회 수"></i>${review.readCount}</span>
					
					<!-- 좋아요 수 ajax로 변환시키려는데 span 안에 이미지태그 들어가있으니까 .text() 쓰기가 곤란해서 이미지태그를 밖으로 뺐다. -->
					&nbsp;&nbsp;	
					<img src="${pageContext.request.contextPath}/resources/upload/board/추천수 아이콘.png" style="position: relative; top: 5px; right: 2px;" alt="" /><i class="fas fa-heart" title="추천 수"></i><span class="count_vote pt_col" style="margin-left: 0;">${review.recommend}</span>	
					<span class="count_cmt pt_col2"><img src="${pageContext.request.contextPath}/resources/upload/board/댓글수 아이콘.png" style="position: relative; top: 5px; right: 2px; margin-left: 0;" alt="" /><i class="fas fa-comment-dots" title="댓글"></i>${review.reviewCommentCount}</span>
				</div>
			</div>
		</header>
		<div class="atc_body">
								
				
			<!--BeforeDocument(71875352,45775485)-->
			<div class="document_71875352_45775485 rhymix_content xe_content" data-pswp-uid="1">
				<c:if test="${not empty review.attachments}">
					<c:forEach items="${review.attachments}" var="attach">
						<p><img src="${pageContext.request.contextPath}/resources/upload/board/${attach.renamedFilename}" alt="" style=""></p>
						<br />
					</c:forEach>
				</c:if>
				<%-- 글 작성할 때 엔터쳐서 넣은 공백문자를 살리려면 pre 태그로 감싸야 한다. --%>
				<pre>${review.reviewContent}</pre>
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
						<c:if test="${review.member.id eq loginMemberId}">
							<button class="ib ib_mono" onclick="location.href='${pageContext.request.contextPath}/review/reviewUpdate.do?reviewNo=${review.reviewNo}';" type="button">수정</button>
							<button class="ib ib_color" type="button"  data-toggle="modal" data-target="#exampleModal">삭제</button>
						</c:if>
					</sec:authorize>
				</div>
				<sec:authorize access="isAuthenticated()">
				<div class="atc_vote">
					<button class="bt_vote vote_area" id="heartButton" type="button" style="border: none">좋아요<span class="voted_count text_en heartButton">${review.recommend}</span></button>
				</div>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
				<div class="atc_vote">
					<button class="bt_vote vote_area" type="button" style="border: none" onclick="alert('로그인 해주세요.');">좋아요<span class="voted_count text_en heartButton">${review.recommend}</span></button>
				</div>
				</sec:authorize>
				
				
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
							action="${pageContext.request.contextPath}/review/reviewDelete.do?${_csrf.parameterName}=${_csrf.token}" 
							name="deleteReviewFrm" 
							method="post">
							<input type="hidden" name="reviewNo" value="${review.reviewNo}" />
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
			댓글 <span class="pt_col text_en cmt_count">${review.reviewCommentCount}</span>
		</h3>
		<span class="ink_bubble_wrap bt_cmt_write">
			<span class="ink_bubble">댓글 쓰기</span>
		</span>
	</div>
	<div class="cmt_notice"><i class="fas fa-microphone"></i>
	정치,종교 관련 언급 절대 금지입니다. <br>
	상대방의 의견에 반박, 비아냥, 조롱 금지입니다. <br>
	영화는 개인의 취향이니, 상대방의 취향을 존중하세요. <br>
	</div>
	<!-- //cmt_notice -->
		
	<%-- 
		이미지 src에 <sec:authentication property="principal.image"/> 이게 안들어가서 변수로 지정했다. 그런데 이게 다른데에 있으면 로그인 안 한 상태로
		reviewDetail에 들어왔을때 principal에서 image를 읽을 수 없다고 에러가 났다. 그래서 이 코드를 <sec:authorize access="isAuthenticated()">
		이거 안에 넣었더니 해결됐다.  
	--%>
	<sec:authorize access="isAuthenticated()">
		<c:set var="loginMemberImage">
		   	<sec:authentication property="principal.image"/> 
		</c:set>		
	</sec:authorize>		
		
	<div class="cmt_wrap has_top">
		<div class="cmt_list">
			<%-- 
				댓글 1등 2등 3등 매기려면 어떻게 해야 할까 생각하다가 나온 답. c set으로 변수를 만들고 commentLevel이 1일 때 
				변수를 1씩 증가시킨다. 그리고 변수가 1 2 3일때 각 등수별 클래스를 붙여주니까 계획대로 됐다.
				숫자는 그냥 0 하면 될 줄 알았는데 "0" 해야하는거였다. 숫자고 자시고 간에 value= 다음엔 쌍따옴표 해야하는듯 
			--%>
			<c:set var="cnt" value="0"/>  
			<c:forEach items="${commentList}" var="comment" varStatus="vs">
			
				<!-- 댓글 1단계 -->
				<c:if test="${comment.commentLevel eq 1}">
					<c:set var="cnt" value="${cnt + 1}"></c:set>
					<article class="cmt_unit" id="commentNo${comment.no}">
						<div class="inkpf_wrap">
							<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${comment.member.image}" alt="" /></span>
							<c:choose>
								<c:when test="${cnt eq 1}">
									<span class="cmt_rank cmt_rank1">1등</span>
								</c:when>
								<c:when test="${cnt eq 2}">
									<span class="cmt_rank cmt_rank2">2등</span>
								</c:when>
								<c:when test="${cnt eq 3}">
									<span class="cmt_rank cmt_rank3">3등</span>
								</c:when>
							</c:choose> 				
						</div>
						<div class="cmt_header">
							<a href="#popup_menu_area" class="nickname member_25365243" onclick="return false">
								${comment.member.nickname}
							</a>
							<!-- 글 작성자의 댓글이면 작성자 표시 -->
							<c:if test="${review.memberId eq comment.writer}">
								<span class="writer pt_bg2">작성자</span>
							</c:if>
						</div>
						<div class="cmt_body">
						<!--BeforeComment(71876047,25365243)-->
							<div class="comment_71876047_25365243 rhymix_content xe_content" data-pswp-uid="2">
								${comment.content}
							</div>
							<!--AfterComment(71876047,25365243)-->
							
							<div class="cmt_buttons">
								<div class="cmt_vote">
									<sec:authorize access="isAuthenticated()">
										<a class="bt bt2 reply" href="javascript:void(0)" data-no="${comment.no}" data-image="${loginMemberImage}" data-id="${loginMemberId}" data-reviewno="${review.reviewNo}" style=" border-radius: 5px;">
											댓글
										</a>
										<c:if test="${loginMemberId eq comment.writer}">
											<a class="bt bt2 deleteComment" href="javascript:void(0)" data-no="${comment.no}" style="border-radius: 5px;">
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
							</div>
							<div class="cmt_date_wrap text_en font_grey1">
								<span class="cmt_time"><fmt:formatDate value="${comment.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
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
						<div class="cmt_header">
							<a href="#popup_menu_area" class="nickname member_25365243" onclick="return false">
								${comment.member.nickname}
							</a>
							<!-- 글 작성자의 댓글이면 작성자 표시 -->
							<c:if test="${review.memberId eq comment.writer}">
								<span class="writer pt_bg2">작성자</span>
							</c:if>
						</div>
						<div class="cmt_body">
						<!--BeforeComment(71876047,25365243)-->
							<!-- 원 댓글 작성자 닉네임 표시 -->
							<c:if test="${comment.upperCommentWriter != null}">
								<div class="parent">
									<img src="${pageContext.request.contextPath}/resources/upload/board/upperCommentWriter 아이콘.png" alt="" style="position: relative; top: 4px;"/> 
									${comment.upperCommentWriter}
								</div>
							</c:if>
							<div class="comment_71876047_25365243 rhymix_content xe_content" data-pswp-uid="2">
								${comment.content}
							</div>
							<!--AfterComment(71876047,25365243)-->
							
							
							<div class="cmt_buttons">
								<div class="cmt_vote">
									<sec:authorize access="isAuthenticated()">
										<a class="bt bt2 reply2" href="javascript:void(0)" data-no="${comment.no}" data-image="${loginMemberImage}" data-id="${loginMemberId}" data-reviewno="${review.reviewNo}" style=" border-radius: 5px;">
											댓글
										</a>
										<c:if test="${loginMemberId eq comment.writer}">
											<a class="bt bt2 deleteComment" href="javascript:void(0)" data-no="${comment.no}" style="border-radius: 5px;">
												삭제
											</a>
										</c:if>
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
									<a class="bt bt2 anonymous" href="javascript:void(0)" >
										댓글
									</a>
									</sec:authorize>
									
								</div>
							</div>
							<div class="cmt_date_wrap text_en font_grey1">
								<span class="cmt_time"><fmt:formatDate value="${comment.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
							</div>
						</div>
					
					<!-- //cmt_body -->
					
					</article>
				</c:if>


				<!-- 3단계 -->
				<c:if test="${comment.commentLevel eq 3}">
					<article class="cmt_unit level3" id="commentNo${comment.no}">
						<div class="inkpf_wrap">
							<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${comment.member.image}" alt="" /></span>
						</div>
						<div class="cmt_header">
							<a href="#popup_menu_area" class="nickname member_25365243" onclick="return false">
								${comment.member.nickname}
							</a>
							<!-- 글 작성자의 댓글이면 작성자 표시 -->
							<c:if test="${review.memberId eq comment.writer}">
								<span class="writer pt_bg2">작성자</span>
							</c:if>
						</div>
						<div class="cmt_body">
						<!--BeforeComment(71876047,25365243)-->
							<!-- 원 댓글 작성자 닉네임 표시 -->
							<c:if test="${comment.upperCommentWriter != null}">
								<div class="parent">
									<img src="${pageContext.request.contextPath}/resources/upload/board/upperCommentWriter 아이콘.png" alt="" style="position: relative; top: 4px;"/> 
									${comment.upperCommentWriter}
								</div>
							</c:if>
							<div class="comment_71876047_25365243 rhymix_content xe_content" data-pswp-uid="2">
								${comment.content}
							</div>
							<!--AfterComment(71876047,25365243)-->
							
							
							<div class="cmt_buttons">
								<div class="cmt_vote">
									<sec:authorize access="isAuthenticated()">
										<c:if test="${loginMemberId eq comment.writer}">
											<a class="bt bt2 deleteComment" href="javascript:void(0)" data-no="${comment.no}" style="border-radius: 5px;">
												삭제
											</a>
										</c:if>
									</sec:authorize>
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
			action="${pageContext.request.contextPath}/review/reviewCommentDelete.do?${_csrf.parameterName}=${_csrf.token}" 
			name="reviewCommentDelFrm"
			method="POST">
			<input type="hidden" name="no" />
			<input type="hidden" name="memberId" value="${loginMemberId}" />
			<input type="hidden" name="reviewNo" value="${review.reviewNo}" />
		</form:form>			

		</div> <!-- cmt_list -->
		
	</div> <!-- cmt_wrap -->
	 	
				
	<!-- 로그인 했을 경우 댓글 쓰는 란이 나옴 -->
	<sec:authorize access="isAuthenticated()">
		<div class="cmt_write cmt_write_unit">
			<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/${loginMemberImage}" alt="" /></span>
			<form:form 
				action="${pageContext.request.contextPath}/review/reviewCommentEnroll.do?${_csrf.parameterName}=${_csrf.token}"
				name="reviewCommentFrm" 
				method="post" 
				class="cmt_form">
				<input type="hidden" name="writer" value="${loginMemberId}" />
				<input type="hidden" name="reviewNo" value="${review.reviewNo}" />
				<input type="hidden" name="commentLevel" value="1">
				<input type="hidden" name="commentRef" value="0">
				<div class="cmt_write_input text_ver">
					<textarea name="content" class="cmt_textarea" cols="50" rows="4" placeholder="댓글 내용을 입력해주세요." style="width: 100%; height: 106px;"></textarea>
				</div>
				<div class="cmt_write_option">
					<span class="write_option"></span>
					<div class="bt_area bt_right">
						<button class="ib ib2 ib_color" type="submit">댓글 등록</button>
					</div>
				</div>
			</form:form>
		</div>
	</sec:authorize>
	
	
	<!-- 로그인 안 한 경우 댓글입력란 자리에 표시될 것 -->
	<sec:authorize access="isAnonymous()">
		<div class="cmt_write cmt_write_unit no_grant">
			<div class="cmt_not_permitted" style="font-size: 14px">
				<img src="${pageContext.request.contextPath}/resources/upload/board/댓글수 아이콘.png" style="position: relative; top: 5px; right: 2px;" alt="" /> 권한이 없습니다. &nbsp;&nbsp;<a class="ink_link2" href="${pageContext.request.contextPath}/member/memberLogin.do" >로그인</a>
			</div>
		</div>
	</sec:authorize>

	<div class="ink_message ink_warn cmt_delete">
		<div>
			<h3>댓글 삭제</h3>
			<button class="bt_close bt_xclose" type="button"><svg viewBox="0 0 1024 1024"><title>close</title><path class="path1" d="M548.203 537.6l289.099-289.098c9.998-9.998 9.998-26.206 0-36.205-9.997-9.997-26.206-9.997-36.203 0l-289.099 289.099-289.098-289.099c-9.998-9.997-26.206-9.997-36.205 0-9.997 9.998-9.997 26.206 0 36.205l289.099 289.098-289.099 289.099c-9.997 9.997-9.997 26.206 0 36.203 5 4.998 11.55 7.498 18.102 7.498s13.102-2.499 18.102-7.499l289.098-289.098 289.099 289.099c4.998 4.998 11.549 7.498 18.101 7.498s13.102-2.499 18.101-7.499c9.998-9.997 9.998-26.206 0-36.203l-289.098-289.098z"></path></svg></button>
			<form class="inner" action="/" method="get" onsubmit="return procFilter(this, delete_comment)"><input type="hidden" name="error_return_url" value="/movietalk/71875352?category=61633579"><input type="hidden" name="act" value="dispBoardContent">
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
	</div>
	</div> <!-- cmt --> 
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


//로그인 안 한 상태에서 답글버튼 클릭시 alert 뜸
$(".anonymous").click((e) => {
	alert("로그인 해주세요.");
});

//댓글 버튼 클릭하면 댓글입력창 뜸
$(".reply").click((e) => {
	<%-- 
		전에 댓글 했듯이 이 함수 제일 밑에 '답글버튼 한번 클릭하고나면 더이상 작동하지 않게 하기' 를 해놨었는데, 이래놓으니까 답글창 끈 다음 다시 켜려고 해도 안 켜지게 됐다.
		그래서 그걸 지우고 이 함수 제일 처음에 답글 dom을 삭제하는 코드를 넣었더니 의도대로 답글창 껐다 켰다 할 수 있게 됐다. 답글창 하나 켜진 상태에서 다른 답글창 켜면
		기존 답글창 꺼지는 것도 이걸로 해결됐다.
	 --%>
	$(".cmt_write_re").remove();
	
	const commentRef = $(e.target).data("no");
	const image = $(e.target).data("image");
	const id = $(e.target).data("id");
	const reviewNo = $(e.target).data("reviewno");   <%-- data 속성에 대문자를 넣으면 안되는거같다. data-reviewNo 로 했더니 undefined 떴다. --%>
	console.log(commentRef);
	console.log(image);
	console.log(id);
	console.log(reviewNo);
	
	const div = `<div class="cmt_write_unit cmt_write_re" id="cmt_write_re" style="display: block;">
		<form:form 
			action="${pageContext.request.contextPath}/review/reviewCommentEnroll.do"
			name="reviewCommentEnrollFrm"
			method="post" 
			class="cmt_form" 
			style="height: auto;">
			<input type="hidden" name="writer" value="\${id}" />
			<input type="hidden" name="reviewNo" value="\${reviewNo}" />
			<input type="hidden" name="commentLevel" value="2">
			<input type="hidden" name="commentRef" value="\${commentRef}">
			<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/\${image}" alt="" /></span>
			<div class="cmt_write_input text_ver">
				<textarea class="cmt_textarea" name="content" id="editor_2" placeholder="댓글 내용을 입력해주세요." style="width: 100%;" required></textarea>
			</div>
			<div class="cmt_write_option">
				<div class="bt_area bt_right">
					<button class="ib ib2 ib_mono bt_close" type="button" onclick='$(".cmt_write_re").remove();'>취소</button>
					<button class="ib ib2 ib_color" type="submit">댓글 등록</button>
				</div>
			</div>
		</form:form>
	</div>`;
		
		console.log(div);
		console.log($(div));
		
		
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

//대댓글의 댓글버튼
$(".reply2").click((e) => {
	$(".cmt_write_re").remove();
	
	const commentRef = $(e.target).data("no");
	const image = $(e.target).data("image");
	const id = $(e.target).data("id");
	const reviewNo = $(e.target).data("reviewno");   
	console.log(commentRef);
	console.log(image);
	console.log(id);
	console.log(reviewNo);
	
	const div = `<div class="cmt_write_unit cmt_write_re" id="cmt_write_re" style="display: block;">
		<form:form 
			action="${pageContext.request.contextPath}/review/reviewCommentEnroll.do"
			method="post" 
			class="cmt_form" 
			style="height: auto;">
			<input type="hidden" name="writer" value="\${id}" />
			<input type="hidden" name="reviewNo" value="\${reviewNo}" />
			<input type="hidden" name="commentLevel" value="3">
			<input type="hidden" name="commentRef" value="\${commentRef}">
			<span class="inkpf round"><img class="inkpf_img" src="${pageContext.request.contextPath}/resources/upload/member/\${image}" alt="" /></span>
			<div class="cmt_write_input text_ver">
				<textarea class="cmt_textarea" name="content" id="editor_2" placeholder="댓글 내용을 입력해주세요." style="width: 100%;" required></textarea>
			</div>
			<div class="cmt_write_option">
				<div class="bt_area bt_right">
					<button class="ib ib2 ib_mono bt_close" type="button" onclick='$(".cmt_write_re").remove();'>취소</button>
					<button class="ib ib2 ib_color" type="submit">댓글 등록</button>
				</div>
			</div>
		</form:form>
	</div>`;
		
		console.log(div);
		console.log($(div));
		
	
		const $commentArticle = $(e.target).parent().parent().parent().parent();
		// console.log($commentArticle);
		
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


//댓글삭제
$(".deleteComment").click(function() {
	if(confirm("댓글을 삭제하시겠습니까?")){
		var $frm = $(document.reviewCommentDelFrm);
		var no = $(this).data("no");
		console.log(no);
		$frm.find("[name=no]").val(no);
		$frm.submit();
	}
});


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


// 좋아요 누른 아이디면 좋아요버튼 호버했을때처럼 보이게 함
$(document).ready(function () {
	 var heartval = ${heartCheck};
	 
	 if(heartval > 0) {
         console.log(heartval);
         $(".heartButton").prop('name', heartval);
         $(".voted_count").css("border-left-color", "#ef7676");
         $("#heartButton")
         		.css("background-color", "#ec5e5e")
         		.css("color", "#FFF");
     }
     else {
         console.log(heartval);
         $(".heartButton").prop('name', heartval)
		 $(".voted_count").css("border-left-color", "#f9d2d2");
         $("#heartButton")
         		.css("background-color", "#fbdfdf")
				.css("color", "#ec5e5e");
     }
		 
	 // 좋아요 눌렀을때
	 $("#heartButton").on("click", function () {
		 // 게시글 번호, 로그인 한 회원 아이디, 이 회원이 이 글에 좋아요를 누른 상태면 1, 아니면 0을 sendData에 담음
		 // script 안에선 밖에서 사용할 수 있던 el변수들이 안되던데, 아래의 방법으로는 되더라. 이게 뭔지는 잘 모르겠다.
         var sendData = {'reviewNo' : ${review.reviewNo},'heart' : $(".heartButton").prop('name'), 'memberId' : '${loginMemberId}'};
		 
		 // 이 글의 현재 좋아요 수를 가져와서 숫자형으로 변환
         var heartCnt = Number($(".heartButton").html());
         /* console.log(sendData);
         console.log(heartCnt); */
         
         /*  
         	좋아요 상태가 1인 경우 : 
        	 	- db에서 이 아이디와 게시글의 좋아요 정보를 삭제
        	 	- 이 글의 전체 좋아요 수를 1 빼서 업데이트
        	 	- 이 페이지의 좋아요 수 표시되는 두 곳에서 1 빼서 표시
        	 	- 좋아요 버튼의 css를 버튼 누르지 않은 상태로 되돌림
        	 	
        	 좋아요 상태가 0인 경우 :
        		- 1인 경우의 반대로 함
     	 */
         $.ajax({
             url : "${pageContext.request.contextPath}/review/heartButton.do?${_csrf.parameterName}=${_csrf.token}",
             type :'POST',
             data : sendData,
             success : function(data){
            	 $(".heartButton").prop('name',data);
                 if(data == 1) {
                	 /* console.log("heart is");
                	 console.log(data); */
                	 $(".heartButton").html(heartCnt + 1);
                	 $(".count_vote").html(heartCnt + 1);
                	 $(".voted_count").css("border-left-color", "#ef7676");
                     $("#heartButton")
                     		.css("background-color", "#ec5e5e")
                     		.css("color", "#FFF");
                 }
                 else{
                	 /* console.log("heart is");
                	 console.log(data); */
                	 $(".heartButton").html(heartCnt - 1);
                	 $(".count_vote").html(heartCnt - 1);
                	 $(".voted_count").css("border-left-color", "#f9d2d2");
                     $("#heartButton")
                     		.css("background-color", "#fbdfdf")
            				.css("color", "#ec5e5e");
                 }

             }
         });
     });
});
</script>

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



<!-- 댓글 영역 바로 위의 </div> 위에 올라가는 추천인 목록	
		<div id="voted_who">
			<div class="atc_who bg_grey1 scroll_wrap show">
				<h3>추천인 <span class="text_en pt_col">9</span></h3>
				<div class="scroll-wrapper inner scrollbar-macosx" style="position: relative;"><div class="inner scrollbar-macosx scroll-content" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 105px;">
					<ul class="scroll_x">
										<li>
																		<span class="inkpf color round"><img src="//img.extmovie.com/files/member_extra_info/profile_image/705/382/039/39382705.jpg?20190927225610" alt="율독" class="inkpf_img"></span><br><span class="vote_nickname">율독</span>
					</li>
										<li>
																		<span class="inkpf color round"></span><br><span class="vote_nickname">re</span>
					</li>
										<li>
																		<span class="inkpf color round"><img src="//img.extmovie.com/files/member_extra_info/profile_image/811/734/043/43734811.jpg?20190227160434" alt="Landa" class="inkpf_img"></span><br><span class="vote_nickname">Landa</span>
					</li>
										<li>
																		<span class="inkpf color round"><img src="//img.extmovie.com/files/member_extra_info/profile_image/489/855/070/70855489.jpg?20211201191509" alt="개추머신" class="inkpf_img"></span><br><span class="vote_nickname">개추머신</span>
					</li>
										<li>
																		<span class="inkpf color round"><img src="//img.extmovie.com/files/member_extra_info/profile_image/451/306/061/61306451.jpg?20210222030617" alt="강꼬" class="inkpf_img"></span><br><span class="vote_nickname">강꼬</span>
					</li>
										<li>
																		<span class="inkpf color round"></span><br><span class="vote_nickname">peacherry</span>
					</li>
										<li>
																		<span class="inkpf color round"><img src="//img.extmovie.com/files/member_extra_info/profile_image/752/066/027/27066752.jpg?20210427012155" alt="환풍기" class="inkpf_img"></span><br><span class="vote_nickname">환풍기</span>
					</li>
										<li>
																		<span class="inkpf color round"><img src="//img.extmovie.com/files/member_extra_info/profile_image/938/758/021/21758938.jpg?20170828135054" alt="텐더로인" class="inkpf_img"></span><br><span class="vote_nickname">텐더로인</span>
					</li>
										<li>
																		<span class="inkpf color round"></span><br><span class="vote_nickname">데드몽키</span>
					</li>
										</ul>
				</div><div class="scroll-element scroll-x"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="width: 96px;"></div></div></div><div class="scroll-element scroll-y"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar" style="height: 95px;"></div></div></div></div>
			</div>		</div> -->
