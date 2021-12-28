<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.spring.goods.model.vo.OptionDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	List<OptionDetail> optionList = (List<OptionDetail>) request.getAttribute("optionDetail");
	System.out.println(optionList);
	
	List<String> optionTypeList = new ArrayList<>();
	List<String> optionColorList = new ArrayList<>();
	List<String> optionSizeList = new ArrayList<>();
	
	Set<String> set = new HashSet<String>();
	
	if(optionList != null){
		for(int i=0; i<optionList.size(); i++) {
			optionTypeList.add(optionList.get(i).getOptionType());
			optionColorList.add(optionList.get(i).getOptionColor());
			optionSizeList.add(optionList.get(i).getOptionSize());
		}
	}
	/* 1. 옵션 기종 리스트 만들기 */
	set = new HashSet<String>(optionTypeList);
	optionTypeList = new ArrayList<String>(set);
	Collections.sort(optionTypeList);
	System.out.println("기종 종류 : " + optionTypeList);
	
	/* 2. 옵션 색상 리스트 만들기 */
	set = new HashSet<String>(optionColorList);
	optionColorList = new ArrayList<String>(set);
	Collections.sort(optionColorList);
	System.out.println("색상 종류 : " + optionColorList);
	
	/* 3. 옵션 사이즈 리스트 만들기 */
	set = new HashSet<String>(optionSizeList);
	optionSizeList = new ArrayList<String>(set);
	Collections.sort(optionSizeList);
	System.out.println("사이즈 종류 : " + optionSizeList);
	
	pageContext.setAttribute("optionTypeList", optionTypeList);
	pageContext.setAttribute("optionColorList", optionColorList);
	pageContext.setAttribute("optionSizeList", optionSizeList);

%>


<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goodsDetail.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">



<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<style>
/* 색상옵션 > 체크 안되어 있을때 */
.color-box input[type='radio'] {
  background-color: #e0e0e0; /* el로 해당옵션 색상 넣어주기 */
  cursor: pointer;
}

/* 색상옵션 > 체크 되어 있을때 */
.color-box input[type='radio']:checked {
  background-color: gray; /* el로 해당옵션 색상 넣어주기 */
  border: 4px double white;
}

/* 색상옵션 > 마우스 호버시 */
.color-box input[type='radio']:hover {
  border: 4px double white;
}

/**** 화면 고정 관련 ****/
.fixed { 
    position: fixed; 
	top: 0; 
	/* left: calc(100%/2); */
	right: 10%;
	padding-bottom: 50px;
	margin-bottom: 50px;
	height: 100%;
}

.fixed +goodsDetail-container { 
    width: 80%;
    position: relative;
}

.fixed +top-left-box { 
    position: relative;
    left : 100px;
}



</style>

<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- <body onload="init();"> -->

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
<section id="goodsDetail-container" class="container w-80 py-5">
	<!-- 상단 영역 -->
	<div id="top-box"> 
		<!-- 상단 > 왼쪽 영역 -->
		<div id="top-left-box">
			<!-- 상품 이미지 썸네일 -->
			<div id="preview-img-div" class="d-inline-block">
				<%-- <img src="${pageContext.request.contextPath}/resources/upload/goods/${optionDetail.get(0).optionImg}" /> --%>
			</div>
			
			<!-- 판매자 프로필 영역 -->
			<div class="profile-box">	
				<!-- 프로필이미지 -->
				<div class="logo-img-box">
					<img src="${pageContext.request.contextPath}/resources/images/goods/goodsshop_logo.png" />
				</div>
				
				<!-- 프로필 텍스트 -->
				<div class="profile-text-box">
					<div class="text1">Designed By</div>
					<div class="text2">잇프 굿즈샵</div>
				</div>
				
			</div>
			
			<!-- 하단 탭메뉴 영역 : 리뷰, 상품정보, 구매안내, FAQ -->
			<div class="tabs">
			    <input id="tab-btn-1" type="radio" name="tab_item" checked>
			    <label class="tab_item" for="tab-btn-1">리뷰</label>
			    
			    <input id="tab-btn-2" type="radio" name="tab_item">
			    <label class="tab_item" for="tab-btn-2">상품 정보</label>
			    
			    <input id="tab-btn-3" type="radio" name="tab_item">
			    <label class="tab_item" for="tab-btn-3">구매 안내</label>
			    
			    <input id="tab-btn-4" type="radio" name="tab_item">
			    <label class="tab_item" for="tab-btn-4">FAQ</label>
			    
			    <div class="tab_content" id="tab1_content">
			        1111111111
			    </div>
			    
			    <div class="tab_content" id="tab2_content">
			        22222222222
				</div>
			    
			    <div class="tab_content" id="tab3_content">
			        333333333
				</div>
				
				<!-- FAQ -->
				<div class="tab_content" id="tab4_content">
		
					<span class="title-text">주문/배송</span>
		
					<div class="accordion accordion-flush" id="accordionFlushExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingOne">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
					        주문 후 상품 수령까지 얼마나 걸리나요?
					      </button>
					    </h2>
					    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      	잇프굿즈샵의 모든 상품은 주문 제작 방식으로 제작되어 주문 후 상품 수령까지 일정 기간이 소요됩니다. <br />
							배송 예정일은 상품의 상세 페이지와 주문내역에서 확인하실 수 있습니다.
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
					        주문 상태는 어떻게 알 수 있나요?
					      </button>
					    </h2>
					    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
						    로그인>마이페이지>구매내역에서 주문 상품의 제작 진행 상태 및 배송 일정을 확인하실 수 있습니다. <br />
							상품을 주문하시면 아래 5단계를 거쳐 제작과 배송이 이뤄지며 제작준비중 상태에서만 주문 변경 및 취소가 가능합니다.<br />
							<br />
							제작준비중 : 결제가 완료되어 상품 제작 전 준비단계입니다.<br />
							제작중 : 주문하신 상품이 제작되고 있는 단계이며 이 단계부터는 주문 취소/변경/환불 불가합니다.<br />
							배송준비중 : 제작이 완료되어 상품의 검수 및 포장을 진행합니다.<br />
							배송중 : 주문하신 상품이 출고되어 택배사로 전달된 상태이며 운송장 번호는 문자로 발송됩니다. 
							출고된 다음날부터 송장번호 조회를 통한 배송 현황 확인이 가능합니다.<br />
							배송완료 : 배송이 완료된 상태입니다.<br />
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
					        비회원도 주문할 수 있나요?
					      </button>
					    </h2>
					    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
					      <div class="accordion-body">
					      	비회원은 주문하실 수 없습니다. 회원가입을 통해 ITFF의 회원만 굿즈샵을 이용하실 수 있습니다.<br />
							주문시에는 이메일 주문내역을 통해 상세 주문 정보와 배송 정보를 확인하실 수 있습니다.<br />
							ITFF 회원에게는 포인트 적립, 이벤트 등 다양한 혜택이 제공되오니 많은 이용 부탁드립니다.
					      </div>
					    </div>
					  </div>
					</div> <!-- end of 주문/배송 accordion -->
					
					
					<br /><br />
					
					<span class="title-text">교환/환불</span>
			        <div class="accordion" id="accordionPanelsStayOpenExample">
								  
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
					        주문 취소가 가능한가요?
					      </button>
					    </h2>
					    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
					      <div class="accordion-body">
					        잇프굿즈샵의 모든 상품은 주문 제작 방식으로 제작되어 주문 후 상품 수령까지 일정 기간이 소요됩니다. <br />
							배송 예정일은 상품의 상세 페이지와 주문내역에서 확인하실 수 있습니다.
					      </div>
					    </div>
					  </div>
					  
					<div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
				        상품을 받았는데 교환이나 환불이 가능한가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
				      <div class="accordion-body">
				        주문 제작 오더메이드 상품 특성상 단순변심으로 인한 교환/환불 및 반품이 불가합니다.<br />
						단, 수령하신 상품이 불량인 경우 “전자상거래등에서의 소비자 보호에 관한 법률"에 따라 교환/환불 및 반품이 가능하오니 <br />
						잇프굿즈샵 고객센터(1566-5496) 또는 1:1 문의하기를 통해 문의 부탁드립니다.<br />
						수령하신 상품의 불량 부분이 보이는 사진 2장 이상을 첨부하여 문의해 주시면 빠르게 확인 도와드리겠습니다.<br />
						주문하셨던 상품이 아닌 다른 상품으로의 교환은 불가하며 세탁 부주의로 인한 상품 변형 및 인쇄 손상에 따른 <br />
						교환/환불은 불가하므로 상품 상세 페이지의 세탁 방법을 꼭 확인해 주세요.
				      </div>
				    </div>
				  </div>  
					  
					  
					</div> <!-- end of accordion -->
					
					
				</div> <!-- end of tab4_content -->
			</div> <!-- end of 하단 탭메뉴 영역 -->
			
		</div>  <!-- end of 상단 > 왼쪽 영역 -->
				
		<!-- 상단 > 오른쪽 영역 -->
		<div id="top-right-box" class="d-inline-block">
	
<!-- 장바구니 버튼 제출시 폼 -->			
<%-- <form 
	id="goodsOptionFrm" 
	name="goodsOptionFrm"
	action="${pageContext.request.contextPath}/goods/cartEnroll.do?${_csrf.parameterName}=${_csrf.token}"
	method="post"> --%>
			
			<input type=hidden name="goodsId" id="goodsId" value="${goods.PId}">		
			<input type=hidden name="memberId" id="memberId" value="${loginMember.id}">		
			
			
			<!-- 상품명 -->
			<div class="goods-name">${goods.PName}</div>
			
			<!-- 상품가격 -->
			<div class="goods-price">
				<fmt:formatNumber value="${goods.PPrice}" pattern="#,### 원" />
				<input type=hidden name="sell_price" id="sell_price" value="${goods.PPrice}">
			</div>

			<!-- 
				* 옵션이 나오는 경우의 수 (옵션값은 중복값 없이 출력 해야함)
				: (기종,색상) , (색상,사이즈) , (사이즈) 
				
				1. (기종, 색상)
				: 기종 종류 -> 해당 기종의 색상 종류 
				
				2. (색상, 사이즈)
				: 색상 종류 -> 해당 색상의 사이즈 종류
				
				3. (사이즈)
				: 해당 상품의 사이즈 종류 
			 -->


			<!-- 옵션1: 기종 (OPTION_TYPE)--> 
			<c:if test="${optionDetail.get(0).optionType != null}">
			<div id="option-type-div" class="option-div">
				<div>기종</div>
				
				<select id="optionType" name="optionType" data-goods-id="${goods.PId}" class="form-select" aria-label="Default select example">
					<c:forEach items="${optionTypeList}" var="type" varStatus="vs">
				 		<option value="${type}" ${vs.first ? 'selected' : ''}>${type}</option>
				 	</c:forEach>
				</select>
			</div>
			</c:if>
			

			<!-- 옵션2 : 색상 (OPTION_COLOR) -->
			<!-- 
				옵션1값이 있으면 옵션값1에 따른 옵션값2를 출력
				옵션값1값이 없으면 해당상품의 옵션값2 종류만 출력  
			-->
			<!-- (1) (기종,색상)인 경우 > 최초 옵션 리스트 -->
			<c:if test="${optionDetail.get(0).optionType != null && optionDetail.get(0).optionColor != null}">
			<div class="option-div" id="initColorDiv">
				<div>색상</div>
				
				<!-- 색상 라디오 태그 그룹 -->
				<div class="option-colors-div">
					
					<!-- 개별 색상 박스 -->
					<c:forEach items="${colorList}" var="color" varStatus="vs">
					<div class="color-box radio-wrap colorChage">
						<input type="radio" id="${color.optionColor}" data-goods-id="${goods.PId}" name="optionColor" ${vs.first ? 'checked' : ''}><br />
						<label for="${color.optionColor}">${color.optionColor}</label>
					</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
			
			<!-- (2) (기종,색상)인 경우 > 기종선택시의 옵션 리스트 -->
			<div class="option-div" id="selectColorsDiv"></div>

			<!-- (3) (색상, 사이즈)인 경우 -->
			<c:if test="${optionDetail.get(0).optionType == null && optionDetail.get(0).optionColor != null}">
			<div class="option-div">
				<div>색상</div>
				
				<!-- 색상 라디오 태그 그룹 -->
				<div class="option-colors-div">
					
					<!-- 개별 색상 박스 -->
					<c:forEach items="${optionColorList}" var="color" varStatus="vs">
					<div class="color-box radio-wrap" id="selectColorDiv">
						<input type="radio" id="${color}" name="optionColor" data-goods-id="${goods.PId}" data-option-color="${color}" data-goods-id="${goods.PId}" ${vs.first ? 'checked' : ''}><br />
						<label for="${color}">${color}</label>
					</div>
					</c:forEach>
					
				</div>
			</div>
			</c:if>
			
			
			<!-- 옵션3 : 사이즈 (OPTION_SIZE) -->
			<!-- 
				옵션2값이 있으면 옵션값2에 따른 옵션값3을 출력
				옵션값2값이 없으면 해당상품의 옵션값3 종류만 출력  
			-->
			<!-- (1) (색상, 사이즈)인 경우 > 최초 옵션 리스트 -->
			<c:if test="${optionDetail.get(0).optionType == null && optionDetail.get(0).optionColor != null}">
			<div class="option-div" id="initSizeDiv">
				<div>사이즈</div>
				<div class="size-box">
					<!-- 개별 사이즈 박스 -->
					<c:forEach items="${sizeList}" var="size" varStatus="vs">
					<div class="size-btn-box">
						<input type="radio" class="btn-check" name="optionSize" id="${size.optionSize}" autocomplete="off" ${vs.first ? 'checked' : ''}>
						<label class="btn btn-secondary" for="${size.optionSize}">${size.optionSize}</label>
					</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
			
			<!-- (2) (색상, 사이즈)인 경우 > 색상 선택시의 사이즈 옵션 -->
			<div class="option-div" id="selectSizeDiv"></div>
			
			
			<!-- (3) (사이즈)인 경우 -->
			<c:if test="${optionDetail.get(0).optionType == null && optionDetail.get(0).optionColor == null}">
			<div class="option-div">
				<div>사이즈</div>
				<div class="size-box">

					<!-- 개별 사이즈 박스 -->
					<c:forEach items="${optionSizeList}" var="size" varStatus="vs">
					<div class="size-btn-box">
						<input type="radio" class="btn-check" name="optionSize" id="${size}" autocomplete="off" ${vs.first ? 'checked' : ''}>
						<label class="btn btn-secondary" for="${size}">${size }</label>
					</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
	
			<!-- 수량 버튼 박스-->
			<div class="qty-div">
				<div>수량</div>
				
				<div class="qty-btn-div">
					<input type="button" value="-" class="cnt-bnt" onclick="del();">
					<input type="text" name="amount" id="amount" value="1" onchange="change();">
					<input type="button" value="+" class="cnt-bnt" onclick="add();">
				</div>
			</div>
			
			<hr style="background-color: #eaeaea;"/>
			
			<!-- 상품 개수, 개수에 따른 총합 나오는 곳 -->
			<div class="price-box">
				<div class="cnt-box1">
					<span class="cnt"></span>개 상품 금액</div>
				<div class="cnt-box2">
					<!-- 숫자 패턴 적용하기 -->
					<input type="text" name="sum" id="sum" size="8" pattern="[0-9]{3},[0-9]{3}" readonly> 원
				</div>
			</div>
			
			<!-- 장바구니 버튼 -->
			<!-- <input type="submit" value="장바구니" class="cart-btn"/> -->
			<input type="button" value="장바구니" class="cart-btn"/>
			
<!-- </form>	 -->

		</div> <!-- end of 상단 > 오른쪽 영역 -->
	</div> <!-- end of 상단 영역 -->
	
	
	
</section>

<!-- 장바구니 toasts -->
<div id="cartToasts-div">
	<div 
		id="cartToasts" 
		class="toast align-items-center text-white bg-dark border-0" 
		role="alert" aria-live="assertive" 
		aria-atomic="true">
	  <div class="d-flex">
	    <div class="toast-body">
	      <span><i class="fas fa-exclamation-circle"></i></span>
	      &nbsp;&nbsp;&nbsp;
	      <!-- 상품을 장바구니에 담았습니다. -->
	      <span class="cart-msg"></span>
	    </div>
	    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
	  </div>
	</div>
</div>



<script>

$(() => {
	/* 상품 개수, 총합 */
	init();
	
	/* 기종 -> 색상 */
	fn_typeToColor();
	
	/* 색상 -> 사이즈 */
	fn_colorToSize();
	
	/* 최초로딩시 -> 프리뷰이미지 */
	fn_searchImg();
	
	/* 색상변경시 -> 프리뷰이미지 */
	fn_colorChange();
	
	/* 장바구니 버튼 클릭시 */
	fn_cartBtn();
	
	/* const $toast = $("#cartToasts");
	$toast.show(); */
	
    // 오른쪽 영역 고정시키기 
    //$("#top-right-box").Scrolling($("#top-left-box").offset().top, $("footer").offset().top);
    
    // 푸터 해제 함수 실행 
    //Scrolling2();
});

/* 장바구니버튼 */
function fn_cartBtn(){
	/* $(document.goodsOptionFrm).submit((e) => { */
	$(".cart-btn").click((e) => {
		//e.preventDefault();
		
		const $toast = $("#cartToasts");
		
		// 스크롤 맨위로 이동
		$('html,body').scrollTop(0);
		
		// 토스트 메세지 보이게하기 
		$toast.show();
		
		// 2초후에 토스트 사라지게 하기
		setTimeout(function(){
		    $toast.hide();		
		},2000);
		
		// 전달값 
		const cart = {
			goodsId : $("[name=goodsId]").val(),
			optionType : $("select[name='optionType'] option:selected").text(),
			optionColor : $("input[name=optionColor]:checked").attr('id'),
			optionSize : $("input[name=optionSize]:checked").attr('id'),
			memberId : $("[name=memberId]").val(),
			goodsQty : $("[name=amount]").val()
		}
		
		console.log(cart);
		
		//const jsonStr = JSON.stringify(cart);
		//console.log(jsonStr);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/goods/InsertCart.do?${_csrf.parameterName}=${_csrf.token}",
			data: cart,
			/* data: jsonStr,
			contentType: "application/json; charset=utf-8", */
			type : "post",
            
            success(data) {
            	console.log(data); //{msg: '상품을 장바구니에 담았습니다.'}
            	
            	var msg = Object.values(data);
            	
            	$(".cart-msg").text(msg);
            	
            },
            error: console.log
        });
	});
};


/* 프리뷰 이미지 찾기  */
function fn_searchImg(){

	const optionType = $("select[name='optionType'] option:selected").text();
	const optionColor = $("input[name=optionColor]:checked").attr('id');
	const goodsId = $("#goodsId").val();
	
	console.log("기종 = " + optionType);
	console.log("색상 = " + optionColor);
	console.log("상품아이디 = " + goodsId);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/goods/selectOneImg.do?${_csrf.parameterName}=${_csrf.token}",
		data : {goodsId : goodsId, optionType : optionType, optionColor : optionColor},
		type : "post",
        error: function(xhr, status, error){
            console.log(error);
        },
        success : function(result){
        	//console.log(result);
        	
        	/* 이미지 넣기 */
        	$("#preview-img-div").html(result);

        }
    });
};

/* 색상옵션 변경시 프리뷰 이미지찾기 함수 실행 */
function fn_colorChange(){
	
	$(".colorChage input[type='radio']").change((e) => {
		fn_searchImg();
	});
}

/* [기종] 옵션 선택시 [색상] 옵션 나오게하기 */
function fn_typeToColor(){
	
	$("#optionType").change((e) => {
		
		fn_searchImg();
		
		const $this = $(e.target);
		const optionType = $this.val();
		const goodsId = $this.data("goodsId");
		
		console.log(optionType); // 기종
		console.log(goodsId); // 상품아이디
		
		$.ajax({
			url : "${pageContext.request.contextPath}/goods/selectColorByType.do?${_csrf.parameterName}=${_csrf.token}",
			data : {optionType : optionType, goodsId : goodsId},
			type : "post",
            error: function(xhr, status, error){
                console.log(error);
            },
            success : function(result){
            	//console.log(result);
            	
            	/* (2)에 색상 옵션 내용 넣기 */
            	$("#selectColorsDiv").html(result);
            	
            	/* (1)의 최초 색상 옵션 리스트 숨기기 */
            	$("#initColorDiv").hide();
            }
        });
	});
};



/* [색상] 옵션 선택시 [사이즈] 옵션 나오게하기 */
function fn_colorToSize(){
	
	$("#selectColorDiv [name=optionColor]").change((e) => {
		
		fn_searchImg();
		
		const $this = $(e.target);
		const optionColor = $this.data("optionColor");
		const goodsId = $this.data("goodsId");
		
		console.log(optionColor); // 색상옵션값
		console.log(goodsId); // 상품아이디

		$.ajax({
			url : "${pageContext.request.contextPath}/goods/selectSizeByColor.do?${_csrf.parameterName}=${_csrf.token}",
			data : {optionColor : optionColor, goodsId : goodsId},
			type : "post",
            error: function(xhr, status, error){
                console.log(error);
            },
            success : function(result){
            	//console.log(result);
            	
            	/* (2)에 사이즈 옵션 내용 넣기 */
            	$("#selectSizeDiv").html(result);
            	
            	/* (1)의 최초 사이즈 옵션 리스트 숨기기 */
            	$("#initSizeDiv").hide();
            }
        });
	});
};




//페이지 고정 시키는 함수 
$.fn.Scrolling = function(obj, tar) {
    var _this = this;
    $(window).scroll(function(e) {
        var end = obj + tar;
        $(window).scrollTop() >= obj ? _this.addClass("fixed") : _this.removeClass("fixed");
        if($(window).scrollTop() >= end) _this.removeClass("fixed");
    });
};

//푸터 만나면 fixed 해제 
var Scrolling2 = function() {
    var _this = this;
    $(window).scroll(function(e) {
        if($(window).scrollTop() >= 800) 
            $("#top-right-box").removeClass("fixed");
    });
};

/* span 개수 태그 */
const $cnt = $(".cnt");
/* 상품 수량 태그 */
var hm = document.getElementById('amount');
/* 상품 가격 합계 태그 */
var sum = document.getElementById('sum');
/* 상품 단일 가격 값*/
var sell_price = document.getElementById('sell_price').value;
/* 상품 수량 값*/
var amount = hm.value;

/* +,- 버튼 클릭 이벤트 > 수량span값 바뀌기 */
$(".cnt-bnt").click((e) => {
	$cnt.text(hm.value);
	
});


/* 초기화 함수 */
function init() {
	$cnt.text('1');
	sum.value = sell_price;
	change();
	
}

/* 더하기 함수 */
function add () {
	hm.value++ ;
	sum.value = comma(parseInt(hm.value) * sell_price);
}

/* 빼기 함수 */
function del () {

	if (hm.value > 1) {
		hm.value--;
		sum.value = comma(parseInt(hm.value) * sell_price);
	}
}
/* 더하기, 빼기 버튼 사이에 개수 바뀌는 함수 */
function change () {

	if (hm.value < 0) {
		hm.value = 0;
	}
	/* sum.value = parseInt(hm.value) * sell_price; */
	sum.value = comma(parseInt(hm.value) * sell_price);
}


/* 숫자형식에 콤마 붙여주는 함수 */
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}



</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>