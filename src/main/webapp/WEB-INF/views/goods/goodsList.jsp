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
	HttpSession sess = request.getSession();
	
	String userId = "";
	if(!"anonymousUser".equals(authentication.getPrincipal())){
		Member loginMember = (Member) authentication.getPrincipal();
		pageContext.setAttribute("loginMember", loginMember);
		
		userId = loginMember.getId();
	}
	else{
		userId = sess.getId();
	}
	
	System.out.println("야호 33333 = " + userId); // 90FD2F422433064696FE114356D7BD99
	pageContext.setAttribute("userId", userId);
	
	
%>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goodsList.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


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
					<div class="iconBg-div" id="goodsLike-btn${vs.count }" data-goods-id="${goods.goods.PId}">
						<!-- 좋아요 X -->
						<c:if test="${goods.goodsLike.userId != userId or goods.goodsLike.userId == null }">
							<i class="far fa-heart"></i>
						</c:if>
						<!-- 좋아요 O -->
						<c:if test="${goods.goodsLike.userId eq userId and goods.goodsLike.userId != null }">
							<i class="fas fa-heart" id="full-heart"></i>
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

<!-- toasts -->
<div id="toasts-div">
	<div 
		id="toasts" 
		class="toast align-items-center text-white bg-dark border-0" 
		role="alert" aria-live="assertive" 
		aria-atomic="true"
		style="width:370px!important;">
	  <div class="d-flex">
	    <div class="toast-body">
	      <span>
	      	<i class="fas fa-check"></i>
	      	<!-- 메세지 내용 -->
	      <span class="cart-msg" style="margin-left:10px;"></span>
	    </div>
	    <div class="close-btn-div">
	    	<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
	    </div>
	  </div>
	</div>
</div>

<script>

const $toast = $("#toasts");

$(() => {
	//토스트 확인용
	//fn_toast("내가 좋아요 한 상품 목록에 삭제 하였습니다.");
	
	/* 하트 아이콘 클릭시 이벤트 발생 */
	$("[id^=goodsLike-btn").click((e) => {
		// 카드 클릭 이벤트 막기 
		e.stopPropagation();
		
		const $this = $(e.target);
		const goodsId = $this.parent().data("goodsId");
		
		/* console.log($this); */
		console.log("goodsId = " + goodsId);
		
		const like = {
			goodsId : goodsId,
			memberId : $("[name=memberId]").val(),
			heartClass : $this.attr('class')
		}
		
		console.log(like);
		
		// ajax로 goods_like 레코드 삽입 또는 삭제 처리 
		$.ajax({
			url : "${pageContext.request.contextPath}/goods/updateGoodsLike.do?${_csrf.parameterName}=${_csrf.token}",
			data: like,
			type : "post",
	        
			success : function(result){

	        	console.log($this.parent());
	        	
	        	$this.parent().html(result);
	        	
	        	
	        	if(result.includes("far")){
	        		fn_toast("내가 좋아요 한 상품 목록에 삭제 하였습니다.")
	        	}
	        	else if(result.includes("fas")){
	        		fn_toast("내가 좋아요 한 상품 목록에 추가 하였습니다.")
	        	}
				
	        },
	        error: console.log
	    });
		
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

/* 토스트에 메세지 넣는 함수 */
function fn_toast(msg) {
	
	// 토스트 메세지 넣기
	$(".cart-msg").text(msg);
	
	// 스크롤 맨위로 이동 
	/* $('html,body').scrollTop(0); */
	
	// 토스트 메세지 보이게하기 
	$toast.show();
	
	// 2초후에 토스트 사라지게 하기
	setTimeout(function(){
	    $toast.hide();		
	},2000);
	
	
}	

</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>