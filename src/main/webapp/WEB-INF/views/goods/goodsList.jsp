<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	SecurityContext securityContext = SecurityContextHolder.getContext();
	Authentication authentication = securityContext.getAuthentication();
	
	if(!"anonymousUser".equals(authentication.getPrincipal())){
		Member loginMember = (Member) authentication.getPrincipal();
		pageContext.setAttribute("loginMember", loginMember);
	}

%>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goodsList.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 소메뉴 네비게이션 -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsList.do" target="_top">전체상품</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsQna.do" target="_top">묻고 답하기</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/sellerInfo.do" target="_top">판매자 정보</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top">장바구니</a></li>
		</ul>
	</div>
</div>

<!-- 메인 콘텐츠 섹션 -->
<section class="goods-container">

	<!-- 굿즈 배너 이미지 -->
	<img src="${pageContext.request.contextPath }/resources/images/goods/goods_banner.png" id="goods-banner-img" alt="굿즈배너"/>
	
	<hr />
	
	<!-- 상품 목록 부분 -->
	<div id="goods-list-div">
		<div class="top-text-div">
			<p id="title_text">ITFF 2022</p>
			
			<!-- 상품 정렬 리스트 -->
			<ul id="goods-sort-ul">
				<li><a href="#">인기도순</a></li>
				<li><a href="#">낮은가격순</a></li>
				<li><a href="#">높은가격순</a></li>
				<li><a href="#">평점높은순</a></li>
			</ul>
		</div>
		<br /><br /><br />
		
		<!-- 상품 목록 카드 리스트-->
		<div class="card-list">
			
			<!-- 개별 상품 카드 -->
			<c:forEach items="${list}" var="goods" varStatus="vs">
			<div class="card" style="width: 18rem;" data-id="${goods.goods.PId}">
				<!-- 로그인 아이디 -->
				<input type=hidden name="memberId" id="memberId" value="${loginMember.id}">
				<!-- 대표 이미지 -->
				<div class="img-div">
					<img src="${pageContext.request.contextPath}/resources/upload/goods/${goods.goods.PImg}">
					<!-- 찜하기버튼 -->
					<div class="iconBg-div" id="goodsLike-btn${vs.count }">
						<c:if test="${goods.goodsLike.goodsLikeId eq 0 }">
							<i class="far fa-heart" data-goods-id="${goods.goods.PId}"></i>
						</c:if>
						<c:if test="${goods.goodsLike.goodsLikeId ne 0 }">
							<i class="fas fa-heart" id="full-heart" data-goods-id="${goods.goods.PId}"></i>
						</c:if>
					</div>
				</div>
				<!-- 상품텍스트 -->
				<div class="card-body">
					<!-- 메인 카테고리 -->
					<div class="card-text top-text">${goods.goods.PCategory}</div>
					<!-- 상품명 -->
					<div class="card-text middle-text">${goods.goods.PName}</div>
					<!--상품가격 -->
					<div class="card-text bottom-text">
						<fmt:formatNumber value="${goods.goods.PPrice}" pattern="￦ #,###" />
					</div>
				</div> <!-- end of 상품텍스트 -->
			</div> <!-- end of 개별 상품 카드 -->
			</c:forEach>	
		</div><!-- end of 상품 목록 카드 리스트-->
	</div> <!-- 상품 목록 부분 끝 -->
	<!-- 페이지바 -->
	<div id="pagebar">
		${pagebar}
	</div>
</section>

<script>

$(() => {
	
	fn_selectGoodsLike();
	
	/* 하트 아이콘 클릭시 이벤트 발생 */
	$("[id^=goodsLike-btn").click((e) => {
		// 카드 클릭 이벤트 막기 
		e.stopPropagation();
		
		const $this = $(e.target);
		const goodsId = $this.data("goodsId");
		
		console.log("goodsId = " + goodsId);
		
		
		
		

		
	});
	
	 /* card div 클릭시 상품 상세 페이지 이동함 */
	$(".card").click((e) => {
		//console.log(e.target);
		
		const $card = $(e.target).parents(".card");
		const pid = $card.data("id");
		
		console.log(pid);
		location.href = `${pageContext.request.contextPath}/goods/goodsDetail.do?pid=\${pid}`;
		
	});

});

/* 페이지 로드시 좋아요 버튼 눌렀는지 찾기 */
function fn_selectGoodsLike(){
	const like = {
		goodsId : $("[name=goodsId]").val(),
		memberId : $("[name=memberId]").val()
	}
	
	console.log(like);
	
	// ajax로 goods_like 레코드 있는지 조회
	$.ajax({
		url : "${pageContext.request.contextPath}/goods/selectGoodsLike.do?${_csrf.parameterName}=${_csrf.token}",
		data: like,
		type : "post",
		success : function(result){

        	$("#goodsLike-btn").html(result);

        },
        error: console.log
    });
};

	

</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>