<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goodsCommon.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goodsOrder.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

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
<section class="goods-container" id="goodsOrder-container">

<!-- 왼쪽 컨테이너 -->
<div id="left-container">
	<div class="title-text">주문자 정보</div>

	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label bold-text">이름</label>
		</div>
		<!-- input 태그 -->
		<div>
			<input type="text" class="form-control" id="memberName" placeholder="이름을 입력해 주세요.">
		</div>
	</div>
	
	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label">연락처</label>
		</div>
		<!-- input 태그 -->
		<div>
			<input type="text" class="form-control" id="memberName" placeholder="- 없이 01012345678">
		</div>
	</div>
	
	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label">이메일</label>
		</div>
		<!-- input 태그 -->
		<div>
			<input type="text" class="form-control" id="memberName" placeholder="abc@google.com">
			<div class="sml-tex">
				위 이메일로 주문 내역 메일이 전송됩니다. 사용 가능한 메일인지 확인해 주세요.
			</div>
		</div>
	</div>
	
	<br /><br />
	
	<div class="title-text2">배송지 정보</div>
	
	<div class="del-chk-group">
		<div>
			<input type="checkbox" id="delinfo-chk1"/>
			<label for="delinfo-chk1">주문자와 동일</label>
		</div>
		&nbsp;&nbsp;&nbsp;
		<div>
			<input type="checkbox" id="delinfo-chk2"/>
			<label for="delinfo-chk2">배송지 저장</label>
		</div>
	</div>
	
	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label">수령인</label>
		</div>
		<!-- input 태그 -->
		<div>
			<input type="text" class="form-control" id="memberName" placeholder="이름을 입력해 주세요.">
		</div>
	</div>
	
	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label">연락처</label>
		</div>
		<!-- input 태그 -->
		<div>
			<input type="text" class="form-control" id="memberName" placeholder="- 없이 01012345678">
		</div>
	</div>
	
	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label">배송지</label>
		</div>
		<!-- input 태그 -->
		<div>
			<input type="text" class="form-control zipcode-input" placeholder="우편번호">
			<button class="zip-code-btn">우편번호 검색</button>
			<input type="text" class="form-control" id="memberName" placeholder="주소">
			<input type="text" class="form-control" id="memberName" placeholder="상세 주소를 입력해 주세요.">
		</div>
	</div>
	
	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label">배송 메모</label>
		</div>
		<!-- input 태그 -->
		<div>
			<select class="form-select" aria-label="Default select example">
			  <option selected>배송 메모를 선택해 주세요.</option>
			  <option value="1">배송 전에 미리 연락 바랍니다.</option>
			  <option value="2">부재시 경비실에 맡겨주세요.</option>
			  <option value="3">부재시 전화 주시거나 문자 남겨주세요.</option>
			</select>
			
			<input type="text" class="form-control">
		</div>
	</div>
	
	<br /><br />
	
	<div class="title-text">포인트 사용</div>
	
	<div class="input-div">
		<!-- 라벨 -->
		<div>
			<label for="memberName" class="form-label">포인트</label>
		</div>
		<!-- input 태그 -->
		<div>
			<input type="number" class="form-control point-input" id="memberName">
			
			<button class="point-btn">전액 적용</button>
			
			<div class="sml-tex">
				보유 포인트: 0 (1,000 포인트부터 사용 가능합니다.)
			</div>
			
		</div>
	</div>
	
	<br /><br />
	
	<div class="title-text">결제방법</div>
	
	<button class="circleBtn2">신용카드</button>
	
	
	<br />
	
	<div class="title-text">배송 정보 안내</div>
	
	<div>
		주문 폭주, 재고 부족으로 인한 발송 지연 시에는 별도 안내드립니다. 공휴일과 주말 주문 건은 배송사 휴무로 인해 월요일부터 적용됩니다. 연휴 기간 택배사 휴무, 천재지변 등으로 발송 지연 시 공지로 안내드립니다.
	</div>
	
	<br /><br />
	
	<table>
		<tr>
			<th>택배사</th>
			<td>CJ대한통운</td>
		</tr>
		<tr>
			<th>배송지역</th>
			<td>전국</td>
		</tr>
		<tr>
			<th>배송비</th>
			<td>주문 건당 2,500원</td>
		</tr>
		<tr>
			<th>택배상담</th>
			<td>
				1588-1255 <br />
				평일 오전 9시~오후 6시 <br />
				토요일 오전 9시~오후 1시 <br />
			</td>
		</tr>
	</table>
	
	<br />
	
	<div class="title-text">결제 및 배송 동의</div>
	
	<!-- check div -->
	<div>
		<input type="checkbox" id="chk1">
		<label for="chk1">아래 내용을 확인하였으며, 모두 동의합니다.</label>
	</div>
	
	<div>
		<input type="checkbox" id="chk2">
		<label for="chk2">구매 동의</label>
		
		<div class="del-tex">
			단순 변심에 의한 취소/교환/반품이 불가하며 결제 전 주문 내용을 꼭 확인해 주시기 바랍니다. 주문할 상품, 배송 정보를 확인하였으며, 구매에 동의하시겠습니까? (전자상거래법 제 8조 2항)
		</div>
	</div>
	
	<div>
		<input type="checkbox" id="chk3">
		<label for="chk3">배송 일정 확인 및 동의</label>
		
		<div class="del-tex">
			단순 변심에 의한 취소/교환/반품이 불가하며 결제 전 주문 내용을 꼭 확인해 주시기 바랍니다. 주문할 상품, 배송 정보를 확인하였으며, 구매에 동의하시겠습니까? (전자상거래법 제 8조 2항)
		</div>
	</div>
	
	<div class="d-flex">
		<div>
			<input type="checkbox" id="chk4">
			<label for="chk4">이용약관 동의</label>
		</div>
		<div>
			보기
		</div>
	</div>
	
	<div class="d-flex">
		<div>
			<input type="checkbox" id="chk5">
			<label for="chk5">개인 정보 수집 및 이용 동의</label>
		</div>
		<div>
			보기
		</div>
	</div>
	
	<button class="goodsBtn">결제하기</button>
	
	
</div> <!-- end of 왼쪽 컨테이너 -->

<div id="right-container">
3333333333

</div> <!-- end of 오른쪽 컨테이너 -->

</section>
<script>


</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>