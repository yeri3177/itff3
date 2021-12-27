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

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영화 리뷰 - ${review.reviewTitle}" name="title"/>   
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
			<a href="${pageContext.request.contextPath}/review/reviewList.do">영화리뷰</a>
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
						<img class="inkpf_img" src="" alt="">
					</span>
					<a href="#popup_menu_area" class="member_45775485" onclick="return false">
						<img src="" alt="" title="" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">${review.member.nickname}
					</a>
				</span>
				<span class="text_en atc_date font_grey1"><span><fmt:formatDate value="${review.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span></span>
				<div class="atc_info_right text_en font_grey1">
					<span class="count_read"><img src="${pageContext.request.contextPath}/resources/upload/board/조회수 아이콘.png" style="position: relative; top: 4px; right: 3px;" alt="" /><i class="fas fa-eye" title="조회 수"></i>${review.readCount}</span>	
					<span class="count_vote pt_col"><img src="${pageContext.request.contextPath}/resources/upload/board/추천수 아이콘.png" style="position: relative; top: 5px; right: 2px;" alt="" /><i class="fas fa-heart" title="추천 수"></i>${review.recommend}</span>	
					<span class="count_cmt pt_col2"><img src="${pageContext.request.contextPath}/resources/upload/board/댓글수 아이콘.png" style="position: relative; top: 5px; right: 2px;" alt="" /><i class="fas fa-comment-dots" title="댓글"></i>0 </span>
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
			${review.reviewContent}
		</div>
		<!--AfterDocument(71875352,45775485)-->		
		<div class="atc_buttons clearfix">
			<!-- <div class="atc_buttons_etc">
				<span class="ink_bubble_wrap">
					<button class="bt_report ib ib_monoC has_bubble" type="button" onclick="inkPop('atc_report')">
						<i class="fas fa-exclamation-triangle only" title="신고"></i>
					</button>
					<span class="ink_bubble">신고</span>
				</span>
				<span class="ink_bubble_wrap">
					<button class="bt_share ib ib_monoC has_bubble" type="button" onclick="inkPop('atc_share')">
						<i class="fas fa-share only" title="공유"></i>
					</button>
					<span class="ink_bubble">공유</span>
				</span>
				<span class="ink_bubble_wrap">
					<button class="bt_scrap ib ib_monoC has_bubble" type="button" onclick="doCallModuleAction('member','procMemberScrapDocument','71875352')">
						<i class="fas fa-star only" title="스크랩"></i>
					</button>
					<span class="ink_bubble">스크랩</span>
				</span>											
			</div> -->
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
			<div class="atc_vote">
				<button class="bt_vote vote_area" type="button" style="border: none" onclick="insertWarn('로그인 해주세요.')">좋아요<span class="voted_count text_en">${review.recommend}</span></button>
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
			        <%-- 댓글 삭제용 폼. 댓글의 번호를 BoardCommentDelete 서블릿으로 전달한다. --%>	
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
		
<!-- 추천인 목록	<div id="voted_who">
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
			
		</div>
		
		<div id="comment" class="cmt cmt_bubble">
			<div class="cmt_title">
		<h3>
			댓글 <span class="pt_col text_en cmt_count">10</span>
		</h3>
		<span class="ink_bubble_wrap bt_cmt_write">
			<span class="ink_bubble">댓글 쓰기</span>
		</span>
	</div>
	<div class="cmt_notice"><i class="fas fa-microphone"></i>
	추천+댓글을 달면 포인트가 더 올라갑니다 <br>
	정치,종교 관련 언급 절대 금지입니다 <br>
	상대방의 의견에 반박, 비아냥, 조롱 금지입니다 <br>
	영화는 개인의 취향이니, 상대방의 취향을 존중하세요 <br>
	</div>
	<!-- //cmt_notice -->
		
	<div class="cmt_wrap has_top">
		<div class="cmt_list">
			<article class="cmt_unit" id="comment_71876047">
				<div class="inkpf_wrap">
					<span class="inkpf round"></span>
					<span class="cmt_rank cmt_rank1">1등</span>				
				</div>
				<div class="cmt_header">
					<a href="#popup_menu_area" class="nickname member_25365243" onclick="return false">
						데드몽키
					</a>
		
				</div>
				<div class="cmt_body">
				<!--BeforeComment(71876047,25365243)-->
					<div class="comment_71876047_25365243 rhymix_content xe_content" data-pswp-uid="2">
						<p>a24 영화들이 비슷한 느낌인거 같아요</p>
						<p>개인적으로 취향이라 다 재밌게 보고있습니다.</p>
					</div>
					<!--AfterComment(71876047,25365243)-->
					<div class="cmt_buttons">
						<div class="cmt_vote">
							<a class="bt bt2" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')">
								댓글
							</a>
							<div class="bt_wrap">
								<button class="text_en bt bt_vote" type="button" onclick="insertWarn('권한이 없습니다.')" title="추천">
									<i class="fas fa-heart"></i> 
									<span class="voted_count">+2</span>
								</button>
								<!-- <span class="writer_vote ink_bubble_wrap">
									<span class="has_bubble">
										<span class="inkpf round has_bubble">
											<img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/485/775/045/45775485.jpg?20210215165429" alt="말랑주니">
										</span>
										<span class="icon_stak">
											<i class="fas fa-heart pt_col stak1"></i>
											<i class="fas fa-heart stak2"></i>
										</span>
									</span>
									<span class="ink_bubble">글쓴이 추천</span>
								</span>					 -->		
							</div>
						</div>
					</div>
					<div class="cmt_date_wrap text_en font_grey1">
						<span class="cmt_time"><fmt:formatDate value="${review.regDate}" pattern="yyyy.MM.dd HH:mm"></fmt:formatDate></span>
					</div>
				</div>
				
				<!-- //cmt_body -->
				
			</article>
			
			<article class="cmt_unit reply" id="comment_71881314">
				<div class="inkpf_wrap">
					<span class="inkpf round">
						<img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/485/775/045/45775485.jpg?20210215165429" alt="profile image">
					</span>									
				</div>
				<div class="cmt_header">
					<a href="#popup_menu_area" class="nickname member_45775485" onclick="return false">
						
						말랑주니
					</a>
					<span class="writer pt_bg2">작성자</span>										
			
				</div>
				
				<div class="cmt_body">
					<div class="parent">
						<i class="fas fa-comment-dots"></i> 데드몽키
					</div>	
					<!--BeforeComment(71881314,45775485)-->	
					<div class="comment_71881314_45775485 rhymix_content xe_content" data-pswp-uid="3">
						저 그린나이트 보고 전작이 좀 궁금해지더라구요
					</div>
					<!--AfterComment(71881314,45775485)-->		
					<div class="cmt_buttons">
						<div class="cmt_vote">
							<a class="bt bt2" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')">댓글</a>
							<div class="bt_wrap">
								<button class="text_en bt bt_vote" type="button" onclick="insertWarn('권한이 없습니다.')" title="추천">
									<i class="fas fa-heart"></i>
									<span class="voted_count">+1</span>
								</button>																				
							</div>
						</div>
					</div>
					<div class="cmt_date_wrap text_en font_grey1">
						<span class="cmt_time">20:13</span>
						<div class="cmt_date">1일 전 </div>
					</div>
				</div>
				<!-- //cmt_body -->
			</article>
																																																								<article class="cmt_unit" id="comment_71876082">
				<div class="inkpf_wrap">
					<span class="inkpf round"><img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/938/758/021/21758938.jpg?20170828135054" alt="profile image"></span>					<span class="cmt_rank cmt_rank2">2등</span>				</div>
				<div class="cmt_header">
																				<a href="#popup_menu_area" class="nickname member_21758938" onclick="return false">텐더로인</a>															<div class="cmt_ctrl_wrap ctrl_wrap">
						<button class="bt_cmt_ctrl bt_ctrl" type="button" onclick="openCtrl(this)"><i class="fas fa-ellipsis-h" title="댓글 메뉴"></i></button>						<div class="cmt_ctrl ctrl_body">
															<a class="bt" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')"><i class="fas fa-comment-dots"></i> 댓글</a>														
																					
													</div>
					</div>
									</div>
				<div class="cmt_body">
																														<!--BeforeComment(71876082,21758938)--><div class="comment_71876082_21758938 rhymix_content xe_content" data-pswp-uid="4"><p>아직까진 올해 저의 최고작입니다.&nbsp;<a href="https://extmovie.com/movietalk/67368000">https://extmovie.com/movietalk/67368000</a></p>

<p>그리고 A24는&nbsp;작품 타율이 아주 좋습니다.</p></div><!--AfterComment(71876082,21758938)-->										<div class="cmt_buttons"><div class="cmt_vote">
														<a class="bt bt2" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')">댓글</a>
																												<div class="bt_wrap">
																<button class="text_en bt bt_vote" type="button" onclick="insertWarn('권한이 없습니다.')" title="추천"><i class="fas fa-heart"></i> <span class="voted_count">+3</span></button>																<!-- <span class="writer_vote ink_bubble_wrap"><span class="has_bubble"><span class="inkpf round has_bubble"><img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/485/775/045/45775485.jpg?20210215165429" alt="말랑주니"></span><span class="icon_stak"><i class="fas fa-heart pt_col stak1"></i><i class="fas fa-heart stak2"></i></span></span><span class="ink_bubble">글쓴이 추천</span></span> -->							</div>
													</div></div>
																				<div class="cmt_date_wrap text_en font_grey1">
												<span class="cmt_time">17:01</span>
												<div class="cmt_date">1일 전 </div>
					</div>
									</div><!-- //cmt_body -->
			</article>
																																																		<article class="cmt_unit reply" id="comment_71881343">
				<div class="inkpf_wrap">
					<span class="inkpf round"><img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/485/775/045/45775485.jpg?20210215165429" alt="profile image"></span>									</div>
				<div class="cmt_header">
																				<a href="#popup_menu_area" class="nickname member_45775485" onclick="return false"><img src="https://extmovie.com/modules/point/icons/xeicon_coa/13.gif" alt="[레벨:13]" title="포인트:16019point (33%), 레벨:13/99" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">말랑주니</a>					<span class="writer pt_bg2">작성자</span>										<div class="cmt_ctrl_wrap ctrl_wrap">
						<button class="bt_cmt_ctrl bt_ctrl" type="button" onclick="openCtrl(this)"><i class="fas fa-ellipsis-h" title="댓글 메뉴"></i></button>						<div class="cmt_ctrl ctrl_body">
															<a class="bt" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')"><i class="fas fa-comment-dots"></i> 댓글</a>														
																					
													</div>
					</div>
									</div>
				<div class="cmt_body">
																				<div class="parent"><i class="fas fa-comment-dots"></i> 텐더로인</div>
																									<!--BeforeComment(71881343,45775485)--><div class="comment_71881343_45775485 rhymix_content xe_content" data-pswp-uid="5">우어.....리뷰란 어떻게 써야하는지 배우고 갑니다... 잘 읽어봤어요 해석도 좋네요👍👍</div><!--AfterComment(71881343,45775485)-->										<div class="cmt_buttons"><div class="cmt_vote">
														<a class="bt bt2" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')">댓글</a>
																												<div class="bt_wrap">
																<button class="text_en bt bt_vote" type="button" onclick="insertWarn('권한이 없습니다.')" title="추천"><i class="fas fa-heart"></i> <span class="voted_count">0</span></button>																							</div>
													</div></div>
																				<div class="cmt_date_wrap text_en font_grey1">
												<span class="cmt_time">20:14</span>
												<div class="cmt_date">1일 전 </div>
					</div>
									</div><!-- //cmt_body -->
			</article>
																																																								<article class="cmt_unit" id="comment_71876108">
				<div class="inkpf_wrap">
					<span class="inkpf round"><img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/752/066/027/27066752.jpg?20210427012155" alt="profile image"></span>					<span class="cmt_rank cmt_rank3">3등</span>				</div>
				<div class="cmt_header">
																				<a href="#popup_menu_area" class="nickname member_27066752" onclick="return false"><img src="https://extmovie.com/modules/point/icons/xeicon_coa/29.gif" alt="[레벨:29]" title="포인트:103742point (74%), 레벨:29/99" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">환풍기</a>															<div class="cmt_ctrl_wrap ctrl_wrap">
						<button class="bt_cmt_ctrl bt_ctrl" type="button" onclick="openCtrl(this)"><i class="fas fa-ellipsis-h" title="댓글 메뉴"></i></button>						<div class="cmt_ctrl ctrl_body">
															<a class="bt" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')"><i class="fas fa-comment-dots"></i> 댓글</a>														
																					
													</div>
					</div>
									</div>
				<div class="cmt_body">
																														<!--BeforeComment(71876108,27066752)--><div class="comment_71876108_27066752 rhymix_content xe_content" data-pswp-uid="6">결말에서 진짜... 머리가 띵했어요...</div><!--AfterComment(71876108,27066752)-->										<div class="cmt_buttons"><div class="cmt_vote">
														<a class="bt bt2" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')">댓글</a>
																												<div class="bt_wrap">
																<button class="text_en bt bt_vote" type="button" onclick="insertWarn('권한이 없습니다.')" title="추천"><i class="fas fa-heart"></i> <span class="voted_count">+1</span></button>																<!-- <span class="writer_vote ink_bubble_wrap"><span class="has_bubble"><span class="inkpf round has_bubble"><img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/485/775/045/45775485.jpg?20210215165429" alt="말랑주니"></span><span class="icon_stak"><i class="fas fa-heart pt_col stak1"></i><i class="fas fa-heart stak2"></i></span></span><span class="ink_bubble">글쓴이 추천</span></span> -->							</div>
													</div></div>
																				<div class="cmt_date_wrap text_en font_grey1">
												<span class="cmt_time">17:02</span>
												<div class="cmt_date">1일 전 </div>
					</div>
									</div><!-- //cmt_body -->
			</article>
																																																		<article class="cmt_unit reply" id="comment_71881355">
				<div class="inkpf_wrap">
					<span class="inkpf round"><img class="inkpf_img" src="//img.extmovie.com/files/member_extra_info/profile_image/485/775/045/45775485.jpg?20210215165429" alt="profile image"></span>									</div>
				<div class="cmt_header">
																				<a href="#popup_menu_area" class="nickname member_45775485" onclick="return false"><img src="https://extmovie.com/modules/point/icons/xeicon_coa/13.gif" alt="[레벨:13]" title="포인트:16019point (33%), 레벨:13/99" class="xe_point_level_icon" style="vertical-align:middle;margin-right:3px;">말랑주니</a>					<span class="writer pt_bg2">작성자</span>										<div class="cmt_ctrl_wrap ctrl_wrap">
						<button class="bt_cmt_ctrl bt_ctrl" type="button" onclick="openCtrl(this)"><i class="fas fa-ellipsis-h" title="댓글 메뉴"></i></button>						<div class="cmt_ctrl ctrl_body">
															<a class="bt" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')"><i class="fas fa-comment-dots"></i> 댓글</a>														
																					
													</div>
					</div>
									</div>
				<div class="cmt_body">
																				<div class="parent"><i class="fas fa-comment-dots"></i> 환풍기</div>
																									<!--BeforeComment(71881355,45775485)--><div class="comment_71881355_45775485 rhymix_content xe_content" data-pswp-uid="7">전 왜 다들 그린나이트 찬양했는지 결말 보고 진짜 아 이거네..대박이다 했습니다ㅜ</div><!--AfterComment(71881355,45775485)-->										<div class="cmt_buttons"><div class="cmt_vote">
														<a class="bt bt2" href="javascript:void(0)" onclick="insertWarn('권한이 없습니다.')">댓글</a>
																												<div class="bt_wrap">
																<button class="text_en bt bt_vote" type="button" onclick="insertWarn('권한이 없습니다.')" title="추천"><i class="fas fa-heart"></i> <span class="voted_count">0</span></button>																							</div>
													</div></div>
																				<div class="cmt_date_wrap text_en font_grey1">
												<span class="cmt_time">20:15</span>
												<div class="cmt_date">1일 전 </div>
					</div>
									</div><!-- //cmt_body -->
			</article>
		
													
		</div> <!-- cmt_list -->
	</div> <!-- cmt_wrap -->
		
	<div class="cmt_write cmt_write_unit">
								<span class="inkpf round"></span>
				<form action="/" method="post" class="cmt_form" onsubmit="return procFilter(this, insert_comment)" editor_sequence="71875352"><input type="hidden" name="error_return_url" value="/movietalk/71875352"><input type="hidden" name="act" value="dispBoardContent">
			<input type="hidden" name="mid" value="movietalk">
			<input type="hidden" name="document_srl" value="71875352">
			<input type="hidden" name="comment_srl" value="">
			<input type="hidden" name="content" value="">
						<div class="cmt_write_input text_ver">
								<input type="hidden" name="use_html" value="Y">
				<input type="hidden" id="htm_71875352" value="n">
				<textarea class="cmt_textarea" id="editor_71875352" cols="50" rows="4" placeholder="댓글 내용을 입력해주세요." style="width: 100%; height: 106px;"></textarea>
				<script type="text/javascript">
					editorStartTextarea(71875352, "content", "comment_srl");
				</script>
							</div>
			<div class="cmt_write_option">
														
													<span class="write_option"></span>
				<div class="bt_area bt_right">
					<button class="ib ib2 ib_color" type="submit">댓글 등록</button>
				</div>
			</div>
		<input type="hidden" name="_rx_csrf_token" value="R0lUx30MWkU0XVZh"></form>
					</div>

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
<script type="text/javascript">
//<![CDATA[
function cEvent(){
	jQuery(function($){
		var cmt = $("#comment"),
		cmt_unit = cmt.find("article.cmt_unit"),
		cmt_write = cmt.find(">div.cmt_write"),
		cmt_write_re = $("#cmt_write_re"),
		cmt_form = cmt_write.find(">form");
		
		cmt_form.find("div.text_ver").on( 'keyup', 'textarea', function (e){
			$(this).css('height', 'auto' );
			$(this).height( this.scrollHeight - 30);
		});
		
		cmt_unit.find("a.bt_recomment").click(function(){
			if(cmt_write_re.find("div.stk_cmt_reply").find(">.display-toggle").length == 0){
				cmt_write_re.find("div.stk_cmt_reply").find(">.stk_display").addClass("display-toggle");
			}
			cmt_write_re.find(">.cmt_form").css("height","auto");
		});
				var cmt_ctrl = cmt_unit.find("div.ctrl_wrap");
		cmt_ctrl.find("a.bt").click(function(){
			var ctrl_body = $(this).closest(".ctrl_body");
			ctrl_body.parent().css("z-index","5");
			ctrl_body.slideUp(200);
			ctrl_body.siblings(".bt_cmt_ctrl").removeClass("active");
			ctrl_body.siblings(".ctrl_dummy").remove();
		});
					});
}
cEvent();
function openCtrl(button){
	var $this = jQuery(button);
	$this.parent().css("z-index","99");
	$this.toggleClass("active");
	$this.next().slideToggle(200);
	$this.before("<div class='ctrl_dummy' onclick='closeCtrl(this)'></div>");
}
function closeCtrl(button){
	var $this = jQuery(button);
	$this.parent().css("z-index","5");
	$this.siblings("button.bt_ctrl").removeClass("active");
	$this.siblings("div.ctrl_body").slideUp(200);
	$this.remove();
}
function commentReload2(target_srl, source) {
	var reqUrl = current_url.setQuery('mid', current_mid, 'document_srl', target_srl),
	cmt_title = jQuery("#comment").find(">div.cmt_title"),
	cmt_count = Number(cmt_title.find(".cmt_count").text());
	jQuery("#ink_loading").show();
	jQuery("#cmt_write_re").appendTo(jQuery('#comment')).hide();
	jQuery.ajax ({
		url:reqUrl,
		dataType:'html',
		success: function(data) {
			jQuery("#ink_loading").fadeOut(200);
			var a = jQuery(data),
			b = a.find('#comment').find(">div.cmt_wrap").html(),
			c = a.find("#comment").find(".cmt_count").html();
			jQuery("#comment").find(">div.cmt_wrap").html(b);
			jQuery("#comment").find(".cmt_count").html(c);
		},complete: function() {
			cEvent();
			var cmt_countN = Number(cmt_title.find(".cmt_count").text());
			if(cmt_countN > cmt_count){
				jQuery("#comment").find(".cmt_alert").css("display","inline-block").html("새 댓글이 <span class='pt_col'>"+(cmt_countN-cmt_count)+"</span>개 있습니다.");
			}else{
				jQuery("#comment").find(".cmt_alert").css("display","inline-block").html("새 댓글이 없습니다.").delay(1000).fadeOut(200);
			}
			jQuery("#ink_done").fadeIn(200);
			setTimeout(function(){
		    	jQuery('#ink_done').fadeOut(500);
			},400);
		}
	});
}
//]]>
</script>
	
		

<style>
.text_en {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
    font-weight: 400;
}
button {
	border: none;
}
section#main-content {
    background-color: #E6E6E6;
    height: auto;
}
div#board-container{
	width:800px; 
	margin:0 auto; 
	text-align:center;
	padding-top: 40px;	
}
textarea.form-control {
	height: 300px;
}
div#board-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#board-container label.custom-file-label{text-align:left;}
.ib {
    height: 42px;
    line-height: 42px;
    padding: 0 20px;
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    font-size: 14px;
    z-index: 1;
    border: none;
    color: white;
}
.ib_mono {
    color: #555;
    background-color: #EEE;
}
.bt_right .ib {
    margin-left: 3px;
    vertical-align: middle;
}
.cmt_write_option {
    position: relative;
    margin-top: 10px;
    height: 30px;
}
.containerN .atc_header p {
    padding: 20px 25px;
}
.atc_header p {
    padding: 20px 25px;
    font-size: 18px;
    line-height: 160%;
    margin: 0;
    font-weight: normal;
}
.atc_info {
    padding: 0 25px;
    line-height: 44px;
    font-size: 13px;
    background-color: #f7f7f7;
}
.atc_info_right {
    float: right;
}
.atc_info>span {
    display: inline-block;
    vertical-align: middle;
}
.inkpf.color {
    background-color: #e5e5e5;
}
.atc_nickname .inkpf {
    vertical-align: middle;
    margin-right: 5px;
}
.inkpf.color {
    background-color: #edf6f2;
    background-image: url(../images/profile_color.png);
}
.inkpf.small {
    width: 30px;
    height: 30px;
}
.inkpf.round {
    border-radius: 50%;
}
.bg_grey1, .inkpf, .ib_mono3, .ii.ii2, .ink_dropdown .bt, .ink_message>div>h3, .ink_message .bt_area {
    background-color: #f7f7f7;
}
.inkpf {
    display: inline-block;
    width: 40px;
    height: 40px;
    background: url(../images/profile.png) no-repeat center center;
    background-size: cover;
    overflow: hidden;
    vertical-align: middle;
    background-color: #f7f7f7;
}
.inkpf_img {
    width: 100%;
    height: auto;
}
img, video {
    max-width: none;
    max-height: 600px;
}
a, button, input[type=button] {
    transition-property: color, background-color, border-color;
    transition-duration: 0.3s;
}
a {
    text-decoration: none;
    outline: none;
    color: #000;
}
.font_grey1, .font_grey1 a, .ib_mono3, .ib i.only {
    color: #777;
}
.atc_date, .atc_ip {
    margin-left: 15px;
}
.atc_info_right>span {
    margin-left: 10px;
}
.fa, .fas {
    font-weight: 900;
}
.fa, .far, .fas {
    font-family: "Font Awesome 5 Free";
}
.fa, .fab, .fad, .fal, .far, .fas {
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    display: inline-block;
    font-style: normal;
    font-variant: normal;
    text-rendering: auto;
    line-height: 1;
}
.pt_col, .c_module, .c_module a {
    color: #ec5e5e !important;
}
.pt_col2, .c_module2, .c_module2 a {
    color: #222 !important;
}
.atc_info_right .count_cmt, .atc_info_right .count_file {
    cursor: pointer;
}
.atc_font {
    display: inline-block;
    position: relative;
    margin-left: 10px;
}
.atc_body {
    padding: 25px;
}
.atc_body .xe_content {
    padding: 30px 40px 35px 40px;
}
body, table, input, button, .ink_wrap .xe_content, .text_en {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
    font-weight: 400;
}
.atc_body .xe_content {
    margin: -25px;
    padding: 25px;
}
.atc_body .xe_content {
    font-size: 16px;
    line-height: 180%;
}
.atc_body .xe_content p, .atc_body .xe_content div, .atc_body .xe_content span {
    line-height: 180%;
}
.atc_vote {
    float: left;
    margin-top: 25px;
}
.atc_vote .bt_vote {
    background-color: #fbdfdf;
}
.atc_buttons_etc {
    float: right;
    margin-top: 25px;
}
.atc_buttons_etc .ink_bubble_wrap {
    display: inline-block;
    margin-left: 5px;
}
.ink_bubble_wrap {
    position: relative;
    display: inline-block;
}

.list_icon.new, .paging .bt_page a.active, .atc_vote .bt_vote, .cmt_buttons .cmt_vote .bt_vote {
    color: #ec5e5e;
}
.cmt_bubble .cmt_buttons .bt2 {
    font-size: 12px;
}
.cmt_bubble .cmt_buttons .bt2 {
    display: inline-block;
    padding: 0 8px;
    margin-right: 3px;
    line-height: 24px;
    vertical-align: middle;
}

.cmt_bubble .cmt_buttons .bt {
    background-color: #FFF;
}
.atc_vote .bt_vote {
    margin-right: 5px;
}
.atc_vote button {
    border-radius: 10px;
}
.atc_vote button {
    display: inline-block;
    height: 36px;
    line-height: 36px;
    padding: 0 15px;
}
body, table, input, button, .ink_wrap .xe_content, .text_en {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
    font-weight: 400;
}
input, button, textarea, table {
    font-size: 14px;
}
a, button, input[type=button] {
    transition-property: color, background-color, border-color;
    transition-duration: 0.3s;
}
button {
    padding: 0;
    background: none;
    cursor: pointer;
    margin: 0;
    border: none;
}
input, button, textarea, table {
    outline: none;
}
body, table, input, textarea, select, button {
    font-family: sans-serif;
    font-size: 12px;
}
.atc_vote .bt_vote .voted_count {
    border-left: 1px solid #f9d2d2;
}
.atc_vote .voted_count {
    display: inline-block;
    padding-left: 15px;
    margin-left: 15px;
    transition-property: border-color;
    transition-duration: 0.3s;
}
button {
    appearance: auto;
    -webkit-writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    box-sizing: border-box;
    background-color: -internal-light-dark(rgb(239, 239, 239), rgb(59, 59, 59));
    margin: 0em;
    padding: 1px 6px;
    border-width: 2px;
    /* border-style: outset; */
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}

.cmt_title {
    padding: 15px 25px;
    background-color: #f7f7f7;
    position: relative;
}
.cmt_title h3 {
    font-size: 14px;
    display: inline-block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding: 0;
    margin: 0;
    font-weight: normal;
}
.pt_col, .c_module, .c_module a {
    color: #ec5e5e !important;
}
.cmt_notice {
    margin: 25px 25px 0;
    padding: 15px 15px 15px 45px;
    border-radius: 20px;
    line-height: 160%;
       position: relative;
    min-height: 40px;
    box-sizing: border-box;
}
.cmt_notice i {
    left: 18px;
    top: 15px;
    position: absolute;
    font-size: 18px;
}
.cmt_bubble .cmt_wrap {
    padding: 25px 25px 0;
}
.cmt_bubble .cmt_unit:first-of-type {
    margin-top: 0;
}
.cmt_bubble .cmt_unit {
    padding-left: 45px;
    margin-top: 25px;
}
.cmt_unit {
    position: relative;
}
.cmt_bubble .inkpf_wrap {
    width: 40px;
}
.cmt_bubble .inkpf_wrap {
    position: absolute;
    left: 0;
    top: 0;
    text-align: center;
}
.inkpf.round {
    border-radius: 50%;
}
.cmt_bubble .cmt_unit:not(.no_profile) .cmt_rank {
    position: absolute;
    left: -5px;
    top: -5px;
    margin-right: 0;
    padding: 0;
    width: 22px;
    height: 22px;
    line-height: 22px;
    border-radius: 50%;
}
.cmt_unit .cmt_rank {
    font-size: 10px;
}
.cmt_unit .cmt_rank {
    padding: 3px 5px 3px 21px;
}
.cmt_unit .cmt_rank1 {
    background-color: #D4AF37;
}
.cmt_unit .cmt_rank2 {
    background-color: #A9A9A9;
}
.cmt_unit .cmt_rank3 {
    background-color: #B08D55;
}
.cmt_unit .cmt_rank {
    display: inline-block;
    position: relative;
    margin-right: 3px;
    border-radius: 5px;
    color: #FFF;
    vertical-align: bottom;
}
.cmt_bubble .cmt_header {
    padding-left: 13px;
    font-size: 13px;
}
.cmt_bubble .cmt_header {
    padding-bottom: 5px;
}
.cmt_unit .nickname {
    font-weight: bold;
}
.cmt_bubble .cmt_ctrl_wrap {
    display: inline-block;
    position: relative;
    z-index: 5;
}
.paging .bt_page, .list_wrap .extra_table th, .ldw .list_unit, .ink_gallery .list_thumb, .atc_history .history_date, .atc_ex th, .ink_memo .list_wrap .inkpf, .memo_form_dummy .bt_write_memo, .cmt_title, .cmt_notice, .cmt_bubble .cmt_body, .cmt .page_line, .cmt_basic .cmt_buttons .bt, .cmt_write_input textarea, .stk_display {
    background-color: #f7f7f7;
}
.cmt_bubble .cmt_body {
    min-width: 249px;
    max-width: calc(100% - 80px);
    padding: 14px 20px;
    border-radius: 15px;
}
.cmt_bubble .cmt_body {
    position: relative;
    display: inline-block;
    box-sizing: border-box;
    vertical-align: bottom;
}
.cmt_bubble .cmt_body .xe_content {
    font-size: 15px;
    line-height: 160%;
}
body, table, input, button, .ink_wrap .xe_content, .text_en {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
    font-weight: 400;
}
.cmt_body .xe_content {
    font-size: 15px;
    line-height: 160%;
}
.ink_wrap .xe_content, .ink_wrap table {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
}
.xe_content {
    word-break: break-all;
}
.xe_content, .rhymix_content {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
    font-size: 16px;
    line-height: 160%;
    word-break: normal;
    word-wrap: break-word;
}
.xe_content p, .rhymix_content p {
    margin: 0 0 0px 0;
    line-height: 160%;
}
.cmt_buttons {
    position: relative;
    height: 24px;
    margin-top: 10px;
}
.cmt_buttons .bt_wrap {
    display: inline-block;
    border-radius: 5px;
    vertical-align: middle;
}
.cmt_bubble .cmt_unit.reply {
    margin-left: 45px;
}
.cmt_bubble .cmt_unit {
    padding-left: 45px;
    margin-top: 25px;
}
.cmt_unit {
    position: relative;
}
.cmt_bubble .cmt_date_wrap {
    font-size: 12px;
}
.cmt_bubble .cmt_date_wrap {
    position: absolute;
    left: 100%;
    bottom: 0;
    margin-left: 5px;
    vertical-align: bottom;
    white-space: nowrap;
}
.cmt_buttons .bt_wrap .bt:last-of-type {
    margin-right: 0;
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}
.cmt_buttons .bt_wrap .bt:first-of-type {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}

.list_icon.new, .paging .bt_page a.active, .atc_vote .bt_vote, .cmt_buttons .cmt_vote .bt_vote {
    color: #ec5e5e;
}
.cmt_unit .writer {
    padding: 0 8px;
    font-size: 10px;
    line-height: 16px;
}
.cmt_unit .writer {
    display: inline-block;
    margin-left: 3px;
    border-radius: 10px;
    vertical-align: bottom;
}

.pt_bg2 {
    background-color: #222 !important;
}
.pt_bg, .pt_bg2 {
    color: #FFF !important;
}
.cmt_write_unit {
    padding: 25px 0 25px 45px;
    margin: 0 25px;
}
.cmt_write_unit {
    position: relative;
}
.cmt_write_unit .inkpf {
    top: 25px;
}
.cmt_write_unit .inkpf {
    position: absolute;
    left: 0;
}
form {
    display: block;
    margin-top: 0em;
}
body, table, input, button, .ink_wrap .xe_content, .text_en {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
    font-weight: 400;
}
input, button, textarea, table {
    font-size: 14px;
}
input, button, textarea, table {
    outline: none;
    margin: 0;
}
.cmt_write_input textarea, .stk_display {
    background-color: #f7f7f7;
}
.cmt_write_input textarea {
    padding: 15px;
    font-family: inherit;
    font-size: 16px;
    border-radius: 15px;
}
.cmt_write_input textarea {
    width: 100%;
    box-sizing: border-box;
    border: none;
    transition-property: background-color;
    transition-duration: 0.3s;
    overflow: hidden;
    resize: none;
}
input, button, textarea, table {
    font-size: 14px;
}
textarea {
    resize: vertical;
}
input, button, textarea, table {
    outline: none;
    margin: 0;
}
.cmt_write_option {
    height: 32px;
}

.cmt_write_option .bt_area {
    position: absolute;
    right: 0;
    bottom: 0;
}
.bt_right .ib {
    margin-left: 3px;
    vertical-align: middle;
}
.ib_color {
    background-color: #ec5e5e;
}
.ib2 {
    height: 32px;
    line-height: 32px;
    padding: 0 11px;
    border-radius: 5px;
    font-size: 13px;
}
/* .ib {
    height: 42px;
    line-height: 42px;
    padding: 0 20px;
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    font-size: 14px;
    z-index: 1;
} */
.ib_color {
    color: #FFF;
}
.ib {
    display: inline-block;
}
.cmt_write_unit {
    padding: 25px 0 25px 45px;
    margin: 0 25px;
}
.cmt_write_option .bt_area {
    position: absolute;
    right: 0;
    bottom: 0;
}
.cmt_buttons .bt_wrap .bt {
    display: inline-block;
    margin-right: 1px;
    padding: 0 8px;
    line-height: 24px;
}
</style>
		
<script>
function boardValidate(){
	var $content = $("[name=content]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

$(() => {
	
	$("[name=upFile]").change((e) => {
		// 1. 파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name;   // optional chaining : 객체가 undefined인 경우에도 오류가 나지 않는다.
		console.log(e.target);
		console.log(filename);
		
		// 2. label에 설정하기
		const $label = $(e.target).next();   // 다음 형제요소
		if(file != undefined)
			$label.html(filename);
		else
			$label.html("파일을 선택하세요.");
	

	});	
});

function formSubmit() {
	document.reviewFrm.submit();
}
</script>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>