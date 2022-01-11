<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	Map<String, Object> optionColorList = new HashMap<>();
	//List<String> optionColorList = new ArrayList<>();
	List<String> optionSizeList = new ArrayList<>();
	
	String colorName = "";
	
	Set<String> set = new HashSet<String>();
	
	if(optionList != null){
		for(int i=0; i<optionList.size(); i++) {
			optionTypeList.add(optionList.get(i).getOptionType());
			colorName = optionList.get(i).getOptionColor();
			optionColorList.put(colorName, optionList.get(i).getOptionRgb());
			//optionColorList.add(optionList.get(i).getOptionColor());
			optionSizeList.add(optionList.get(i).getOptionSize());
		}
	}
	/* 1. 옵션 기종 리스트 만들기 */
	set = new HashSet<String>(optionTypeList);
	optionTypeList = new ArrayList<String>(set);
	Collections.sort(optionTypeList);
	System.out.println("기종 종류 : " + optionTypeList);
	
	/* 2. 옵션 색상 리스트 만들기 */
	/* set = new HashSet<String>(optionColorList);
	optionColorList = new ArrayList<String>(set);
	Collections.sort(optionColorList); */
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

<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 서브메뉴 네비게이션 -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsList.do" target="_top">전체상품</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/likeItems.do" target="_top">관심상품</a></li>
		<c:if test="${loginMember != null }">
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsCart.do" target="_top">장바구니</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/orderList.do" target="_top">구매목록</a></li>
		</c:if>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/sellerInfo.do" target="_top">판매자 정보</a></li>
		</ul>
	</div>
</div>

<!-- 메인 콘텐츠 섹션 -->
<section id="goodsDetail-container">
	
	<!-- 왼쪽 컨테이너 (스크롤) -->
	<div id="left-container">
		
		<!-- 상품 프리뷰 이미지 -->
		<div id="preview-img-div" class="d-inline-block">

			
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
		    <label class="tab_item" for="tab-btn-1">상품 정보</label>
		    
		    <input id="tab-btn-2" type="radio" name="tab_item">
		    <label class="tab_item" for="tab-btn-2">리뷰</label>
		    
		    <input id="tab-btn-3" type="radio" name="tab_item">
		    <label class="tab_item" for="tab-btn-3">구매 안내</label>
		    
		    <input id="tab-btn-4" type="radio" name="tab_item">
		    <label class="tab_item" for="tab-btn-4">FAQ</label>
		    
		    <!-- 상품정보탭 내용 -->
		    <div class="tab_content" id="tab1_content">
		        <textarea readonly>${goods.PInfo }</textarea>
		        
		        
		    </div>
		    
		    <!-- 리뷰탭 내용 -->
		    <div class="tab_content" id="tab2_content">
		        22222222222
			</div>
		    
		    <!-- 구매안내탭 내용 -->
		    <div class="tab_content" id="tab3_content">
		        
		        <div class="title-text">배송 안내</div>
		        <div>
			        모든 상품은 고객님의 주문에 맞춰 새 상품으로 제작하여 배송됩니다. <br />
					지금 주문하시면 7일후부터 제작 프로세스가 시작되어 14일후 이전에 출고될 예정입니다.
				</div>
		        
		        <hr style="background-color: #c3c3c3;border-top: 0px solid rgba(0,0,0,.1); margin: 25px 0;"/>
		        
		        <table>
		        	<tr>
		        		<th>배송방법</th>
		        		<td>일반 택배 (CJ 대한통운)</td>
		        	</tr>
		        	
		        	<tr>
		        		<th>배송지역</th>
		        		<td>전국</td>
		        	</tr>
		        	
		        	<tr>
		        		<th>배송비</th>
		        		<td>2,500원</td>
		        	</tr>
		        	
		        	<tr>
		        		<th>배송기간</th>
		        		<td>상품 출고 후 영업일 기준 1~3일 이내 수령이 가능하며 도서 산간 지역이거나 택배사의 물량이 많은 경우 기간이 조금 더 소요될 수 있습니다.</td>
		        	</tr>
		        </table>
		        
		        <div class="circle-btn-div">
		        	<button class="circleBtn">배송 FAQ 보러가기</button>
		        </div>
		        
		        <br />
		        

		        <div class="title-text">교환/환불 안내</div>
		        
		        <div>
		        	모든 상품은 주문 제작 방식으로 제작되어 단순 변심으로 인한 교환/환불이 불가합니다. <br />

					단, 수령하신 상품이 불량이거나 오배송된 경우에는 7일 이내 고객센터 또는 이메일, 1:1 문의하기로 연락주시면 교환 및 반품 환불이 가능합니다.
		        </div>
		        
		        <hr style="background-color: #c3c3c3;border-top: 0px solid rgba(0,0,0,.1); margin: 25px 0;"/>
		        
		        
		        <table>
		        	<tr>
		        		<th>고객센터</th>
		        		<td>1566-8282</td>
		        	</tr>
		        	
		        	<tr>
		        		<th>이메일</th>
		        		<td>itff_market@itff.com</td>
		        	</tr>

		        </table>
		        
		        <div class="circle-btn-div">
		        	<button class="circleBtn">1:1 문의하기</button>
		        	<button class="circleBtn">교환/환불 FAQ 보러가기</button>
		        </div>
		        
		        <hr style="background-color: #c3c3c3;border-top: 0px solid rgba(0,0,0,.1); margin: 25px 0;"/>
		        
		        <div>
		        	<i class="fas fa-ban"></i>  <a href="#">청약 철회 제한 요건 안내</a>
		        </div>
		        
		        <div>
		        	<i class="far fa-check-circle"></i>  <a href="#">품질 보증 기준 안내</a>
		        </div>
		        
			</div>
			
			<!-- FAQ탭 내용 -->
			<div class="tab_content" id="tab4_content">
	
				<div class="title-text">주문/배송</div>
	
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
				
				<div class="title-text">교환/환불</div>
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
						단, 수령하신 상품이 불량인 경우 “전자상거래등에서의 소비자 보호에 관한 법률"에 따라 교환/환불 및 반품이 가능하오니
						잇프굿즈샵 고객센터(1566-5496) 또는 1:1 문의하기를 통해 문의 부탁드립니다.<br />
						수령하신 상품의 불량 부분이 보이는 사진 2장 이상을 첨부하여 문의해 주시면 빠르게 확인 도와드리겠습니다.<br />
						주문하셨던 상품이 아닌 다른 상품으로의 교환은 불가하며 세탁 부주의로 인한 상품 변형 및 인쇄 손상에 따른
						교환/환불은 불가하므로 상품 상세 페이지의 세탁 방법을 꼭 확인해 주세요.
				      </div>
				    </div>
				  </div>  
				  
				  
				</div> <!-- end of accordion -->
				
				<button class="circleBtn" style="margin: 40px auto;">FAQ 전체 보러가기</button>
				
				
			</div> <!-- end of tab4_content -->
		</div> <!-- end of 하단 탭메뉴 영역 -->
		
	</div>  <!-- end of 상단 > 왼쪽 영역 -->
			
	<!-- 오른쪽 컨테이너 (고정) -->
	<div id="right-container">

		<input type=hidden name="goodsId" id="goodsId" value="${goods.PId}">		
		<input type=hidden name="memberId" id="memberId" value="${loginMember.id}">		
		
		<div class="goodsName-div">
			<div>
				<!-- 상품명 -->
				<div class="goods-name">${goods.PName}</div>
			</div>
			
			<!-- 아이콘 그룹 -->
			<div class="icon-group">
				<!-- 주소복사 아이콘 -->
				<div id="urlCopyBtn" class="iconBg-div" onclick="clip(); return false;">
					<i class="far fa-clone"></i>
				</div>
				
				<!-- 찜하기 아이콘 -->
				<div class="iconBg-div" id="goodsLike-btn">
					<!-- <i class="far fa-heart"></i> -->
				</div>
			</div>
		</div>
		
		<!-- 서브 카테고리 -->
		<div class="goods-subcategory">${goods.PSubcategory}</div>
		
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
				<div class="color-box radio-wrap colorChange">
					<input type="radio" id="${color.optionColor}" class="colorRadio" name="optionColor" 
						style="background-color: ${color.optionRgb}"
						${vs.first ? 'checked' : ''}><br />
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
					<input type="radio" id="${color.key}" class="colorRadio" name="optionColor" 
						style="background-color: ${color.value}"
						data-goods-id="${goods.PId}" 
						data-option-color="${color.key}" 
						${vs.first ? 'checked' : ''}><br />
					<label for="${color.key}">${color.key}</label>
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
		<div class="option-div sizeChange" id="initSizeDiv">
			<div>사이즈</div>
			<div class="size-box">
				<!-- 개별 사이즈 박스 -->
				<c:forEach items="${sizeList}" var="size" varStatus="vs">
				<div class="size-btn-box">
					<input type="radio" class="btn-check" name="optionSize" id="${size.optionSize}" ${vs.first ? 'checked' : ''}>
					<label class="btn btn-secondarysizeLabel " for="${size.optionSize}">${size.optionSize}</label>
				</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
		
		<!-- (2) (색상, 사이즈)인 경우 > 색상 선택시의 사이즈 옵션 -->
		<div class="option-div sizeChange" id="selectSizeDiv"></div>
		
		
		<!-- (3) (사이즈)인 경우 -->
		<c:if test="${optionDetail.get(0).optionType == null && optionDetail.get(0).optionColor == null}">
		<div class="option-div sizeChange">
			<div>사이즈</div>
			<div class="size-box">

				<!-- 개별 사이즈 박스 -->
				<c:forEach items="${optionSizeList}" var="size" varStatus="vs">
				<div class="size-btn-box">
					<input type="radio" class="btn-check" name="optionSize" id="${size}" ${vs.first ? 'checked' : ''}>
					<label class="btn btn-secondary sizeLabel" for="${size}">${size}</label>
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
				<!-- 총합 가격 -->
				<input type="text" name="sum" id="sum" size="8" readonly> 원
			</div>
		</div>
		
		<!-- 장바구니 버튼 -->
		<div class="cart-btn-div"><input type="button" value="장바구니" class="cart-btn"/></div>
		<div class="soldout-div"></div>
		
	</div> <!-- end of 상단 > 오른쪽 영역 -->
	
</section>

<!-- toasts -->
<div id="cartToasts-div">
	<div 
		id="cartToasts" 
		class="toast align-items-center text-white bg-dark border-0" 
		role="alert" aria-live="assertive" 
		aria-atomic="true">
	  <div class="d-flex">
	    <div class="toast-body">
	      <span>
	      	<i class="fas fa-exclamation-circle" style="margin-right: 5px;"></i></span>
	      	<!-- 메세지 내용 -->
	      <span class="cart-msg"></span>
	    </div>
	    <div class="close-btn-div">
	    	<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
	    </div>
	  </div>
	</div>
</div>



<script>

const $toast = $("#cartToasts");

$(() => {
	/* 상품 개수, 총합 */
	init();
	
	/* 기종 -> 색상 */
	fn_typeToColor();
	
	/* 색상 -> 사이즈 */
	fn_colorToSize();
	
	/* 최초로딩시 -> 프리뷰이미지 */
	fn_searchImg();
		
	/* 좋아요 버튼 눌렀는지 찾기 */
	fn_selectGoodsLike();
	
	/* 재고량 찾기 */
	fn_selectOptionStock();
});

/* 프리뷰 이미지 찾기  */
function fn_searchImg(){
	
	const $previewDiv = $("#preview-img-div");

	const options = {
			optionType : $("select[name='optionType'] option:selected").text(),
			optionColor : $("input[name=optionColor]:checked").attr('id'),
			optionSize : $("input[name=optionSize]:checked").attr('id'),
			goodsId : $("#goodsId").val()
	}
	
	//console.log(options);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/goods/selectOneImg.do?${_csrf.parameterName}=${_csrf.token}",
		data : options,
		type : "post",
        error: function(xhr, status, error){
            console.log(error);
        },
        success : function(result){
        	$previewDiv.html(result);
        	
        	
        }
    });
};

/* 색상옵션 변경시 프리뷰 이미지찾기 함수 실행 */
$(".colorRadio").change((e) => {
	fn_searchImg();
});


/* 재고량 찾기 */
function fn_selectOptionStock(){

	const options = {
			optionType : $("select[name='optionType'] option:selected").text(),
			optionColor : $("input[name=optionColor]:checked").attr('id'),
			optionSize : $("input[name=optionSize]:checked").attr('id'),
			goodsId : $("#goodsId").val()
	}
	
	//console.log(options);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/goods/selectGoodsOptionStock.do?${_csrf.parameterName}=${_csrf.token}",
		data : options,
		type : "post",
        error: function(xhr, status, error){
            console.log(error);
        },
        success : function(result){
        	//console.log(result);
        	//console.log(result.includes("soldout-btn"));
        	
        	if(result.includes("soldout-btn")){
        		
        		$(".cart-btn-div").hide();
        		$(".soldout-div").html(result);
        		$(".soldout-div").show();
        		
        	}
        	else {
        		
        		$(".soldout-div").hide();
        		$(".cart-btn-div").show();
        		 
        	}
        }
    });
};

/* 색상옵션 변경시 재고량 찾기 */
$(".colorRadio").change((e) => {
	fn_selectOptionStock();
});

/* 사이즈 변경시 재고량 찾기 */
$(".sizeChange input[type='radio']").change((e) => {
	fn_selectOptionStock();
});


/* 페이지 로드시 좋아요 버튼 눌렀는지 찾기 */
function fn_selectGoodsLike(){
	const like = {
		goodsId : $("[name=goodsId]").val(),
		memberId : $("[name=memberId]").val()
	}
	
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



/* 좋아요 버튼 클릭시 좋아요 추가/삭제 */
$("#goodsLike-btn").click((e) => {

	const like = {
		goodsId : $("[name=goodsId]").val(),
		memberId : $("[name=memberId]").val(),
		heartClass : $("#goodsLike-btn i").attr('class')
	}
	
	console.log(like);
	
	// ajax로 goods_like 레코드 삽입 또는 삭제 처리 
	$.ajax({
		url : "${pageContext.request.contextPath}/goods/updateGoodsLike.do?${_csrf.parameterName}=${_csrf.token}",
		data: like,
		type : "post",
        
		success : function(result){

        	$("#goodsLike-btn").html(result);
        	
        	if(result.includes("far")){
        		fn_toast("상품을 좋아요 목록에 삭제 하였습니다.")
        	}
        	else if(result.includes("fas")){
        		fn_toast("상품을 좋아요 목록에 추가 하였습니다.")
        	}

        },
        error: console.log
    });
	
});
	


/* 오른쪽 컨테이너 fixed 하는 함수 */ 
$(function() {
    $.fn.Scrolling = function(obj, tar) {
        var _this = this;
        $(window).scroll(function(e) {
            var end = obj + tar;
            $(window).scrollTop() >= obj ? _this.addClass("fixed") : _this.removeClass("fixed");
            if($(window).scrollTop() >= end) _this.removeClass("fixed");
        });
    };
    
    $("#right-container").Scrolling($("#right-container").offset().top, ($("#goodsDetail-container").height()+$("header").height() ));

});


/* 페이지 URL 복사 */
function clip(){
	
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	
	fn_toast("URL이 복사 되었습니다.");
}

/* 토스트 x버튼 클릭시 */
$(".btn-close").click((e) => {
	$toast.hide();
})

/* 토스트에 메세지 넣는 함수 */
function fn_toast(msg) {
	
	// 토스트 메세지 넣기
	$(".cart-msg").text(msg);
	
	// 스크롤 맨위로 이동 
	$('html,body').scrollTop(0);
	
	// 토스트 메세지 보이게하기 
	$toast.show();
	
	// 2초후에 토스트 사라지게 하기
	setTimeout(function(){
	    $toast.hide();		
	},2000);
}


/* 장바구니버튼 */
$(".cart-btn").click((e) => {

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
	
	$.ajax({
		url : "${pageContext.request.contextPath}/goods/InsertCart.do?${_csrf.parameterName}=${_csrf.token}",
		data: cart,
		type : "post",   
        success(data) {
           	console.log(data); //{msg: '상품을 장바구니에 담았습니다.'}
           	
           	var msg = Object.values(data);
           	
           	fn_toast(msg);
           },
           error: console.log
     });
});


/* 사이즈 옵션 변경시 */
/* function fn_sizeChange(){
	
	$(".sizeChange input[type='radio']").change((e) => {
		fn_searchImg();
	});
} */

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


</script>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>