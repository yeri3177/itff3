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
		<div class="user_card shadow-sm p-3 mb-5 bg-white rounded">
				
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<div class="user">
							<div class="user_con">
								<a href="${pageContext.request.contextPath }/member/memberProfile.do"><img src="${pageContext.request.contextPath }/resources/upload/member/<sec:authentication property="principal.image"/>" alt="member" class="member-con" /></a>
								<span>
								<strong class="name"><sec:authentication property="principal.name"/></strong>님
								</span>
							</div>
							<div class="point_con">
								<span class="point">보유 포인트 <strong class="point_current"><sec:authentication property="principal.point"/></strong></span>
							</div>						
						</div>												
					</div>
					<div class="col-md-8 col-xs-12">
						<div class="row">
						
							<div class="col-md-4 col-xs-4 row_container">
								<div>
									<img src="https://i.imgur.com/kAFc3Fr.png" alt="" class="row_icon"/>
								</div>
								<div>
									<a href="#" class="btn_reserve">예매내역</a>
								</div>
							</div>
							
							<div class="col-md-4 col-xs-4 row_container">
								<div>
									<img src="https://i.imgur.com/jAwLZh6.png" alt="" class="row_icon"/>
								</div>
								<div>
								<a href="${pageContext.request.contextPath }/goods/goodsCart.do" class="btn_cart">장바구니</a>
								</div>
							</div>	
													
							<div class="col-md-4 col-xs-4 row_container">
								<div>
									<img src="https://i.imgur.com/vVMNP1i.png" alt="" class="row_icon"/>
								</div>
								<div>
								<a href="#" class="btn_buying">상품구매내역</a>
								</div>
							</div>	
													
							<div class="col-md-4 col-xs-4 row_container">
								<div>
									<img src="https://i.imgur.com/UMUevXB.png" alt="" class="row_icon"/>
								</div>
								<div>
								<a href="#" class="btn_point">포인트이용내역</a>
								</div>
							</div>	
													
							<div class="col-md-4 col-xs-4 row_container">
								<div>
									<img src="https://i.imgur.com/WWUDHV6.png" alt="" class="row_icon"/>
								</div>
								<div>
								<a href="${pageContext.request.contextPath }/member/memberWrittenReviewList.do" class="btn_board">내가쓴게시글</a>
								</div>
							</div>	
													
							<div class="col-md-4 col-xs-4 row_container">
								<div>
									<img src="https://i.imgur.com/9NSKOme.png" alt="" class="row_icon"/>
								</div>
								<div>
								<a href="${pageContext.request.contextPath }/member/memberUpdate.do" class="btn_edit">정보수정</a>
								</div>
							</div>
							
						</div>

					</div>
				</div>
		</div>
	</div>
</div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>