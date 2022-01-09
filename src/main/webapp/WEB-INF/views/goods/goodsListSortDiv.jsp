<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	pageContext.setAttribute("userId", userId);
%>
						
<!-- 개별 상품 카드 -->
<c:forEach items="${list}" var="goods" varStatus="vs">
<div class="card" data-id="${goods.goods.PId}">
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
</div>
</c:forEach> <!-- end of 개별 상품 카드 -->

<div id="pagebar">
	${pagebar}
</div>
	
<script>


const $toast = $("#toasts");

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


/* 토스트에 메세지 넣는 함수 */
function fn_toast(msg) {
	
	// 토스트 메세지 넣기
	$(".cart-msg").text(msg);
	
	// 토스트 메세지 보이게하기 
	$toast.show();
	
	// 2초후에 토스트 사라지게 하기
	setTimeout(function(){
	    $toast.hide();		
	},2000);
}	

</script>

