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
	href="${pageContext.request.contextPath }/resources/css/member/memberDetail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 메인 콘텐츠 섹션 -->
<section class="main-content">

<!-- 제목 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="tit_sec txt-center txt-white en">마이페이지</h2>
	</div>
</div>

<div class="mypage">
	<div class="inner">
		<div class="user_card">
				
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<div class="user">
						<span>
						<strong class="name"><sec:authentication property="principal.name"/></strong>님
						<br />
						내 포인트: <sec:authentication property="principal.point"/>
						</span>
						</div>												
					</div>
					<div class="col-md-8 col-xs-12">
						<div class="row">
							
							<div class="col-md-4 col-xs-4"><a href="#" class="btn_reserve">예매내역</a></div>
							<div class="col-md-4 col-xs-4"><a href="#" class="btn_cart">장바구니</a></div>							
							<div class="col-md-4 col-xs-4"><a href="#" class="btn_buying">상품구매내역</a></div>							
							<div class="col-md-4 col-xs-4"><a href="#" class="btn_point">포인트이용내역</a></div>							
							<div class="col-md-4 col-xs-4"><a href="${pageContext.request.contextPath }/member/memberWrittenBoardList.do" class="btn_board">내가쓴게시글</a></div>							
							<div class="col-md-4 col-xs-4"><a href="${pageContext.request.contextPath }/member/memberUpdate.do" class="btn_edit">정보수정</a></div>
						</div>

					</div>
				</div>
		</div>
	</div>
</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>