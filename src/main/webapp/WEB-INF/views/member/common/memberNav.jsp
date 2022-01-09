<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath }/member/memberProfile.do" target="_top">프로필사진변경</a></li>
			<li class="on_"><a href="#">예매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/goods/goodsCart.do" target="_top" target="_top">장바구니</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/goods/orderList.do" target="_top">상품구매내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/member/memberPoint.do" target="_top">포인트이용내역</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/member/memberWrittenReviewList.do" target="_top">내가쓴게시글</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/member/memberUpdate.do" target="_top">정보수정</a></li>
		</ul>
	</div>
</div>
    