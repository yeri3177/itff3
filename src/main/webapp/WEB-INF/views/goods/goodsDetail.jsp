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

<!--  
optionList -> optionTypeList , optionColorList , optionSizeList로 만들기 

[OptionDetail(optionId=101, optionType=아이폰 12, optionColor=화이트, optionSize=null, optionStock=99, optionImg=goods12_option101.png), 
OptionDetail(optionId=102, optionType=아이폰 13, optionColor=화이트, optionSize=null, optionStock=99, optionImg=goods12_option102.png),
OptionDetail(optionId=103, optionType=아이폰 12, optionColor=그린, optionSize=null, optionStock=99, optionImg=goods12_option103.png), 
OptionDetail(optionId=104, optionType=아이폰 11, optionColor=그린, optionSize=null, optionStock=89, optionImg=goods12_option104.png), 
OptionDetail(optionId=105, optionType=아이폰 12, optionColor=레드, optionSize=null, optionStock=89, optionImg=goods12_option105.png)]

// List 준비
List<String> list = Arrays.asList("A", "B", "C", "A");

// List를 Set으로 변경
Set<String> set = new HashSet<String>(list);

// Set을 List로 변경
List<String> newList = new ArrayList<String>(set);
-->
<%	
	List<OptionDetail> optionList = (List<OptionDetail>) request.getAttribute("optionList");
	
	List<String> optionTypeList = new ArrayList<>();
	List<String> optionColorList = new ArrayList<>();
	List<String> optionSizeList = new ArrayList<>();
	
	Set<String> set = new HashSet<String>();
	
	for(int i=0; i<optionList.size(); i++) {
		optionTypeList.add(optionList.get(i).getOptionType());
		optionColorList.add(optionList.get(i).getOptionColor());
		optionSizeList.add(optionList.get(i).getOptionSize());
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goodsDetail.css" />

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
</style>

<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<body onload="init();">

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
<section id="goodsDetail-container" class="container w-90 py-5" style="height: 1200px;">
	
	<!-- 상단 영역 -->
	<div id="top-box"> 
		<!-- 상단 > 왼쪽 영역 -->
		<div>
			<div id="preview-img-div" class="d-inline-block">
				<img src="${pageContext.request.contextPath}/resources/upload/goods/${goods.PImg}" />
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
			
		</div>  <!-- end of 상단 > 왼쪽 영역 -->
		
		
<!-- 
		상단 오른쪽 영역 fixed 처리할지말지 고민중 
		https://nyaongnyaong.com/117
		https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=eunjin10914&logNo=220864556082
 -->				
		<!-- 상단 > 오른쪽 영역 -->
		<div id="top-right-box" class="d-inline-block">
			
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
				(마플샵은 기종 옵션만 나오는경우, 옵션이 아예 없는 경우도 있는데 .. 
				어떻게해야할지 모르겠음)
				
				1. (기종, 색상)
				: 기종 종류 -> 해당 기종의 색상 종류 
				
				2. (색상, 사이즈)
				: 색상 종류 -> 해당 색상의 사이즈 종류
				
				3. (사이즈)
				: 해당 상품의 사이즈 종류 
			 -->
<!-- 현재 상품목록에서 option_detail 데이터가 없는것도 나와서 이거 없으면 상품상세 안나옴 -->
<c:if test="${not empty optionList}">
			<!-- 옵션1: 기종 (OPTION_TYPE)--> 
			<!-- 옵션값1이 있으면 출력 -->
		
			<c:if test="${optionList.get(0).optionType != null}">
			<div id="option-type-div" class="option-div">
				<div>기종</div>
				
				<select class="form-select" aria-label="Default select example">
					<c:forEach items="${optionTypeList}" var="type" varStatus="vs">
				 		<option>${type}</option>
				 	</c:forEach>
				</select>
			</div>
			</c:if>
			

			<!-- 옵션2 : 색상 (OPTION_COLOR) -->
			<!-- 
				옵션1값이 있으면 옵션값1에 따른 옵션값2를 출력
				옵션값1값이 없으면 해당상품의 옵션값2 종류만 출력  
			-->
			<!-- (1) (기종,색상)인 경우 -->
			<c:if test="${optionList.get(0).optionType != null && optionList.get(0).optionColor != null}">
			<div class="option-div">
				<div>색상</div>
				
				<!-- 색상 라디오 태그 그룹 -->
				<div class="option-colors-div">
					
					<!-- 개별 색상 박스 -->
					<div class="color-box radio-wrap">
						<input type="radio" name="color" checked><br />
						<label for="">그린</label>
					</div>
					
				</div>
			</div>
			</c:if>
			<!-- (2) (색상, 사이즈)인 경우 -->
			<c:if test="${optionList.get(0).optionType == null && optionList.get(0).optionColor != null}">
			<div class="option-div">
				<div>색상</div>
				
				<!-- 색상 라디오 태그 그룹 -->
				<div class="option-colors-div">
					
					<!-- 개별 색상 박스 -->
					<c:forEach items="${optionColorList}" var="color" varStatus="vs">
					<div class="color-box radio-wrap">
						<input type="radio" name="color" checked><br />
						<label for="">${color}</label>
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
			<!-- (1) (색상, 사이즈)인 경우 -->
			<c:if test="${optionList.get(0).optionType == null && optionList.get(0).optionColor != null}">
			<div class="option-div">
				<div>사이즈</div>
				<div class="size-box">
					<!-- 개별 사이즈 박스 -->
					<div class="size-btn-box">
						<input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked>
						<label class="btn btn-secondary" for="option1">S</label>
					</div>

				</div>
			</div>
			</c:if>
			
			<!-- (2) (사이즈)인 경우 -->
			<c:if test="${optionList.get(0).optionType == null && optionList.get(0).optionColor == null}">
			<div class="option-div">
				<div>사이즈</div>
				<div class="size-box">

					<!-- 개별 사이즈 박스 -->
					<c:forEach items="${optionSizeList}" var="size" varStatus="vs">
					<div class="size-btn-box">
						<input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked>
						<label class="btn btn-secondary" for="option1">${size }</label>
					</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
			
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
			
			<hr />
			
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
			<input type="submit" value="장바구니" class="cart-btn"/>
				
		</div> <!-- end of 상단 > 오른쪽 영역 -->
	</div> <!-- end of 상단 영역 -->
	
	
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
		
		<div class="tab_content" id="tab4_content">
	        4444444444444444444
		</div>
	</div>
</section>


<script>

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
function init () {
	$cnt.text('1');
	sum.value = sell_price;
	change();
	
	/* 로딩중 이미지 나오기 */
	/* test(); */
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

/**
 * 
 https://kkamikoon.tistory.com/entry/Javascript-%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EB%A1%9C-%EB%A1%9C%EB%94%A9%EC%A4%91-%ED%99%94%EB%A9%B4-%EB%A7%8C%EB%93%A4%EA%B8%B0%EB%A1%9C%EB%94%A9-%ED%91%9C%EC%8B%9C
 https://loading.io/
 */
 
function test() {
    LoadingWithMask();
    setTimeout("closeLoadingWithMask()", 2000);
} 
 
function LoadingWithMask() {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth  = window.document.body.clientWidth;
    
     
    //화면에 출력할 마스크를 설정해줍니다.
    var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg = '';
      
    loadingImg += " <img src='${pageContext.request.contextPath}/resources/images/goods/loading.gif' style='position: absolute; display: block; margin: 0px auto;'/>";
 
    //화면에 레이어 추가
    $('body')
        .append(mask)
 
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : maskWidth,
            'height': maskHeight,
            'opacity' : '0.3'
    }); 
  
    //마스크 표시
    $('#mask').show();
  
    //로딩중 이미지 표시
    $('#loadingImg').append(loadingImg);
    $('#loadingImg').show();
}
 
function closeLoadingWithMask() {
    $('#mask, #loadingImg').hide();
    $('#mask, #loadingImg').empty();  
}
</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>