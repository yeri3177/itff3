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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods/goodsCart.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<!-- header -->
<title>ITFF</title>


<%-- <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>  --%>


<!-- 소메뉴 네비게이션 -->
<%-- <div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsList.do" target="_top">전체상품</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/goodsQna.do" target="_top">묻고 답하기</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/goods/sellerInfo.do" target="_top">판매자 정보</a></li>
		</ul>
	</div>
</div> --%>

<div class="top-container">
	<div class="top-content-div">
		<span class="col-gry">장바구니</span> 
		<i class="fas fa-chevron-right"></i>
		주문서 작성 
		<i class="fas fa-chevron-right"></i>
		<span class="col-gry">결제완료</span> 
	</div>
</div>

<!-- 메인 콘텐츠 섹션 -->
<section class="goods-container" id="goodsOrder-container">

<!-- 왼쪽 컨테이너 -->
<div id="order-left-container">
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
	
	<div class="title-text" style="margin-bottom: 0px!important;">
		배송지 정보
	</div>
	
	<div class="del-chk-group">
		<div>
			<span class="chk">
		        <input type="checkbox" id="same-order-chk"> 
		        <label for="same-order-chk">주문자와 동일</label> 
		    </span>
		</div>
		<div style="margin-left: 15px;">			
			<span class="chk"> 
		        <input type="checkbox" id="save-adr-chk"> 
		        <label for="save-adr-chk">배송지 저장</label> 
		    </span>
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
			<input type="text" class="form-control zipcode-input" id="sample3_postcode" placeholder="우편번호">
			<button class="zip-code-btn" onclick="sample3_execDaumPostcode()">우편번호 검색</button>
			<input type="text" class="form-control" id="sample3_address" placeholder="주소">
			<input type="text" class="form-control" id="sample3_detailAddress" placeholder="상세 주소를 입력해 주세요.">
			<!-- <input type="text" class="form-control" id="sample3_extraAddress" placeholder="참고항목"> -->
		</div>
	</div>
	
	<!-- 다음주소 api 아이프레임 -->
	<div id="daum-api-iframe" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
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
			<input type="number" class="form-control point-input" readonly="readonly">
			
			<button class="point-btn">전액 사용</button>
			
			<div class="sml-tex">
				보유 포인트: 0 (1,000 포인트부터 사용 가능합니다.)
			</div>
			
		</div>
	</div>
	
	<br /><br />
	
	<div class="title-text">결제방법</div>
	
	<button class="circleBtn2">신용카드</button>
	
	
	<br /><br />
	
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
	
	<br /><br /><br />
	
	<div class="title-text">결제 및 배송 동의</div>
	
	<div>
		<span class="chk"> 
	        <input type="checkbox" id="chk-all"> 
	        <label for="chk-all"><span style="font-weight: 500; font-size: 18px;">아래 내용을 확인하였으며, 모두 동의합니다.</span></label> 
	    </span>
	</div>
	
	<div>
		<span class="chk"> 
	        <input type="checkbox" id="chk1"> 
	        <label for="chk1"><span style="font-size: 18px;">구매 동의</span></label> 
	    </span>
		
		<div class="del-tex">
			단순 변심에 의한 취소/교환/반품이 불가하며 결제 전 주문 내용을 꼭 확인해 주시기 바랍니다. 주문할 상품, 배송 정보를 확인하였으며, 구매에 동의하시겠습니까? (전자상거래법 제 8조 2항)
		</div>
	</div>
	
	<div>
		<span class="chk"> 
	        <input type="checkbox" id="chk2"> 
	        <label for="chk2"><span style="font-size: 18px;">배송 일정 확인 및 동의</span></label> 
	    </span>
		
		<div class="del-tex">
			단순 변심에 의한 취소/교환/반품이 불가하며 결제 전 주문 내용을 꼭 확인해 주시기 바랍니다. 주문할 상품, 배송 정보를 확인하였으며, 구매에 동의하시겠습니까? (전자상거래법 제 8조 2항)
		</div>
	</div>
	
	<div class="d-flex">
		<div>
			<span class="chk"> 
		        <input type="checkbox" id="chk3"> 
		        <label for="chk3"><span style="font-size: 18px;">이용약관 동의</span></label> 
		    </span>
		</div>
		<div 
			class="modal-btn" 
			data-bs-toggle="modal" data-bs-target="#modal1">
			보기
		</div>
	</div>
	
	<div class="d-flex">
		<div>
			<span class="chk"> 
		        <input type="checkbox" id="chk4"> 
		        <label for="chk4"><span style="font-size: 18px;">개인 정보 수집 및 이용 동의</span></label> 
		    </span>
		</div>
		<div
			class="modal-btn" 
			data-bs-toggle="modal" data-bs-target="#modal2">
			보기
		</div>
	</div>
	
	<button class="goodsBtn">결제하기</button>
	
</div> <!-- end of 왼쪽 컨테이너 -->

<!-- modal1 : 이용약관 동의 -->
<div class="modal fade" id="modal1" data-bs-backdrop="static" 
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	
	<div class="modal-dialog">
	   
		<div class="modal-content">
		
		    
			<div class="modal-body">
				<!-- 헤더 -->
				<div class="con-header">
					<div>서비스 이용 약관</div>
					<div><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
				</div>
				
				<!-- 바디 -->
				<div class="con-body">
					회원가입 전 반드시 이용약관을 읽어보시기 바랍니다. <br /><br />

					제1조(목적)<br /><br />
					이 약관은 (주)마플코퍼레이션(전자상거래 사업자)이 운영하는 [마플, 마플샵 (이하 "몰"이라 한다)]에서 제공하는 개발 및 주문인쇄제작(PRINT ON DEMAND)을 통한 전자상거래 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br />
					<br />
					※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br />
					<br />
					제2조(정의)<br /><br />
					① "몰"이란 (주)마플코퍼레이션이 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
					<br />② "이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
					<br />③ ‘회원’이라 함은 "몰"에 회원등록을 한 자로서, 계속적으로 "몰"이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
					<br />④ ‘비회원’이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.
					<br />⑤ 이외에 이 약관에서 사용하는 용어의 정의는 관계 법령 및 서비스별 안내에서 정하는 바에 의합니다.
					제3조 (약관 등의 명시와 설명 및 개정)<br /><br />
					<br />① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 홈페이지의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
					<br />② "몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
					<br />③ "몰"은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
					<br />④ "몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰"은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
					<br />⑤ "몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
					<br />⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.
					제4조(서비스의 제공 및 변경)<br /><br />
					① "몰"은 다음과 같은 업무를 수행합니다.
					<br />1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
					<br />2. 구매계약이 체결된 재화 또는 용역의 제작 및 배송
					<br />3. 마플샵의 경우 판매자의 샵 운영과 관련된 정보의 제공
					<br />4. 기타 "몰"이 정하는 업무
					<br />② "몰"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
					<br />③ "몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
					<br />④ 전항의 경우 "몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
					제5조(서비스의 중단)<br /><br />
					① "몰"은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
					② "몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
					③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "몰"은 제8조에 정한 방법으로 이용자에게 통지하고 당초 "몰"에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, "몰"이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 포인트 또는 적립금 등을 "몰"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
					제6조(회원가입)<br /><br />
					① 이용자는 "몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 본 약관과 "개인정보 취급방침"에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
					② 마플와 마플샵은 회원정보를 상호 공유하며 둘 중 한곳에 가입을 신청한 이용자는 회원으로 등록될 경우 두 웹사이트 모두 하나의 회원정보로 이용이 가능합니다.
					③ "몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
					1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "몰"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
					2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
					3. 회원 가입일 현재 만 14세 미만인 경우
					4. 기타 회원으로 등록하는 것이 "몰"의 기술상 현저히 지장이 있다고 판단되는 경우
					5. 회원가입계약의 성립 시기는 "몰"의 승낙이 회원에게 도달한 시점으로 합니다.
					6. 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 "몰"에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
					제7조(회원 탈퇴 및 자격 상실 등)<br /><br />
					① 회원은 "몰"에 언제든지 탈퇴를 요청할 수 있으며 "몰"은 즉시 회원탈퇴를 처리합니다.
					② 회원이 다음 각 호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다.
					1. 가입 신청 시에 허위 내용을 등록한 경우
					2. "몰"을 이용하여 구입한 재화 등의 대금, 기타 "몰"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
					3. 다른 사람의 "몰" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
					4. "몰"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
					5. 기타 서비스 운영을 고의로 방해하는 행위를 하는 경우
					③ "몰"이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "몰"은 회원자격을 상실시킬 수 있습니다.
					④ "몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
					제8조(회원에 대한 통지)<br /><br />
					① "몰"이 회원에 대한 통지를 하는 경우, 회원이 "몰"과 미리 약정하여 지정한 전자우편 주소 또는 SMS 등으로 할 수 있습니다.
					② "몰"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "몰" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
					<br /><br />
					&lt;부칙&gt;
					본 약관은 2020년 11월 6일부터 시행됩니다.
					2020년 1월 14일부터 시행해 온 약관은 본 약관으로 대체됩니다.
				</div> <!-- end of 바디 -->
				
				<!-- 푸터 -->
				<div class="con-footer">
					<button class="goodsBtn confirm-btn" class="btn-close" data-bs-dismiss="modal">확인</button>
				</div>
				
			</div>
		  
		</div>
	</div>
</div> <!-- end of modal1 : 이용약관 동의 -->


<!-- modal2 : 개인 정보 수집 및 이용 동의 -->
<div class="modal fade" id="modal2" data-bs-backdrop="static" 
	data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	
	<div class="modal-dialog">
	   
		<div class="modal-content">
		
		    
			<div class="modal-body">
				<!-- 헤더 -->
				<div class="con-header">
					<div>개인정보 수집 • 이용 동의</div>
					<div><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
				</div>
				
				<!-- 바디 -->
				<div class="con-body">
					(주)잇프굿즈샵(이하 "회사"라고 함)은 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며,<br />
					관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다. 마플코퍼레이션의 개인정보취급방침은 다음과 같은 내용을 담고 있습니다.<br />
					<br />
					제1조 총칙<br />
					① 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 알아볼 수 있는 부호,문자,음성,음향 및 영상 등의 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다.<br />
					② ㈜마플코퍼레이션(이하 "회사")은 이용자의 개인정보보호를 매우 중요시하며, 「개인정보보호법」,「정보통신망 이용 촉진 및 정보보호에 관한 법률」 등 개인정보보호 관련 법률 및 하위 법령들을 준수하고 있습니다.<br />
					③ 회사는 개인정보취급방침을 통하여 이용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 홈페이지 첫 화면에 공개함으로써 언제나 용이하게 보실 수 있습니다.<br />
					④ 회사는 개인정보취급방침의 지속적인 개선을 위하여 개정하는데 필요한 절차를 정하고 있으며, 개인정보취급방침을 회사의 필요와 사회적 변화에 맞게 변경할 수 있습니다.<br />
					제2조 수집하는 개인정보의 항목 및 수집방법<br />
					① 회사는 별도의 회원가입 절차 없이 대부분의 콘텐츠에 자유롭게 접근할 수 있습니다. 단, 회사에서 제공하는 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 합니다.<br />
					1. 필수항목<br />
					- 개인회원 : 전자우편(e-mail) 주소, 비밀번호, 닉네임, 전화번호(휴대전화), 생년월일, ci(연계정보), di(중복가입정보)<br />
					- 개인/법인사업자 : 회사/기관명, 사업자등록번호, 담당자이름, 전자우편(e-mail) 주소, 비밀번호 전화번호(휴대전화), ci(연계정보), di(중복가입정보)<br />
					2. 선택항목<br />
					- 신용카드정보, 은행계좌정보, 이동전화정보 등 대금결제에 필요한 정보<br />
					- 회원가입시 회원이 원하시는 경우에 한하여 추가 정보를 선택, 제공하실 수 있도록 되어있으며, 일부 재화 또는 용역 상품에 대한 주문 및 접수시 회원이 원하는 정확한 주문 내용 파악을 통한 원활한 주문 및 결제, 배송을 위하여 추가적인 정보를 요구하고 있습니다.<br />
					3. 서비스 이용과정 및 사업<br />
					처리과정에서 수집될 수 있는 개인정보의 범위<br />
					- 최근접속일, 접속 IP 정보, 쿠키, 구매로그, 이벤트로그<br />
					4. 비회원 고객<br />
					- 회사는 비회원 고객의 주문에도 배송, 대금결제, 주문내역 조회 및 구매확인, 실명여부 확인을 위하여 필요한 개인정보만을 요청하고 있으며, 이 경우 그 정보는 대금결제 및 상품의 배송에 관련된 용도 이외에는 다른 어떠한 용도로도 사용되지 않습니다.<br />
					- 회사는 비회원의 개인정보도 회원과 동등한 수준으로 보호합니다.<br />
					5. 14세 미만 아동의 개인정보<br />
					- 회사는 법정 대리인의 동의가 필요한 만 14세 미만 아동의 회원가입은 받고 있지 않습니다.<br />
					② 회사는 다음과 같은 방법으로 개인정보를 수집합니다.<br />
					- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 전자우편 (e-mail), 이벤트 응모, 배송요청<br />
					- 협력회사로부터의 제공<br />
					- 로그 분석 프로그램을 통한 생성정보 수집<br />
					③ 개인정보 수집에 대한 동의<br />
					- 회사는 이용자께서 회사의 개인정보취급방침 및 이용약관의 내용에 대해「동의한다」버튼 또는 「동의하지 않는다」 버튼을 클릭할 수 있는 절차를 마련하여,「동의한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br />
					제3조 개인정보의 수집 및 이용목적<br />
					① 회사는 다음과 같은 목적을 위하여 필요한 최소한의 개인정보를 수집하고 있습니다.<br />
					1. 아이디, 비밀번호, 이름 생년월일 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용<br />
					2. 전자우편 (e-mail) 주소 (뉴스레터 수신여부) : 공지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스, 신상품이나 이벤트 정보 등 최신 정보의 안내<br />
					3. 주소, 전화번호 : 쇼핑 물품 배송에 대한 정확한 배송지의 확보<br />
					4. 그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료<br />
					5. 회원의 서비스이용에 대한 통계 : 업무와 관련된 통계자료 작성 및 서비스 개발<br />
					6. 마케팅,광고에의 활용<br />
					제4조 개인정보 공유 및 제공<br />
					① 회사는 고객의 사전 동의가 있거나 법률에서 정하는 경우 외에는 고객의 개인정보를 제3자에게 제공하거나 제3조 개인정보의 수집 및 이용목적에서 고지한 목적 외의 용도로 이용하지 않습니다.<br />
					② 고객의 편의를 제공하거나 서비스를 증진하기 위하여 다음과 같은 경우에는 고객의 개인정보를 제3자에게 제공하거나 제3자와 공유할 수 있습니다.<br />
					1. 고객이 사전에 동의한 경우<br />
					2. 법령의 규정에 의하거나 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br />
					3. 개인정보를 제공할 경우에는 사전에 고객에게 개인정보를 제공받는 제3자, 제공하는 개인정보항목명, 개인정보 제공의 목적, 제공하는 개인정보가 언제까지 어떻게 보호·관리되는지, 고객이 종전에 동의한 사항, 고객의 동의하지 않을 권리와 의사표시 방법, 기타 고객의 동의를 얻기 위하여 필요한 사항에 대해 개별적으로 서면, 전자우편(e-mail), 전화 등을 통해 고지하여 동의를 구하는 절차를 거치게 되며, 고객이 동의하지 않는 경우에는 제3자에게 정보를 제공하지 않습니다.<br />
					제5조 개인정보의 취급위탁<br />
					① 회사는 서비스 제공, 고객상담, 서비스 결제를 위해 최소한의 개인정보를 위탁하고 있습니다.<br />
					- CJ 대한통운 : 상품 배송업무, 배송위치/도착정보 등 서비스 제공업무<br />
					- 이니시스 : 결제정보 전송, 결제대행 업무<br />
					- 슈어엠 : SMS, MMS등 문자메세지 발송 업무<br />
					- 한국코퍼레이션 : 고객센터 업무의 일부, 고객 상담 및 주문정보 관리 업무<br />
					② 회사는 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리·감독, 손해 배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br />
					③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br />
					제6조 개인정보의 보유 및 이용기간<br />
					① 이용자의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.<br />
					1. 회원가입정보 : 회원가입을 탈퇴하거나 회원에 제명된 때<br />
					2. 대금지급정보 : 대금의 완제일 또는 채권소명시효기간이 만료된 때<br />
					3. 배송정보 : 재화 또는 용역 등 상품이나 서비스가 인도되거나 제공된 때<br />
					4. 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등이 종료한 때<br />
					② 단, 위 개인정보 수집목적 달성시 즉시파기 원칙에도 불구하고 다음과 같이 거래관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는「전자상거래 등에서의 소비자보호에 관한 법률」「국세기본법」등 관련 법령의 규정에 근거하여 일정기간 보유합니다.<br />
					1. 계약 또는 청약철회 등에 관한 기록 : 5년<br />
					2. 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br />
					3. 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br />
					4. 웹사이트 방문기록 : 3개월<br />
					③ 이용자의 동의를 받아 보유하고 있는 거래정보 등을 이용자께서 열람을 요구하는 경우 회사는 지체없이 열람, 확인할 수 있도록 조치합니다.
					제7조 장기 미사용 고객의 휴면 정책
					1. 마플샵을 최종 이용 후 1년 동안 이용 기록이 없는 고객(장기미이용회원)의 개인정보는 별도로 분리하여 안전하게 관리하게 되며, 대상자에게는 분리 보관 처리일을 기준으로 하여 최소 30일 이전에 이메일 주소를 통해 안내합니다. 분리 보관된 개인정보는 5년간 보관 후 지체없이 파기합니다. 단,통신비밀보호법, 전자상거래 등에서의 소비자보호에 관한 법률 등의 관계법령의 규정에 의하여 보존할 필요가 있는 경우 규정된 기간 동안 고객의 개인정보를 보관합니다.<br />
					2. 휴면계정으로 전환을 원하지 않으시는 경우, 휴면계정 전환 전 서비스 내 로그인 하시면 됩니다. 또한, 휴면 계정으로 전환되었더라도 로그인할 경우 이용자의 동의에 따라 휴면계정을 복원하여 정상적인 서비스를 이용할 수 있습니다<br />
					
					&lt;부칙&gt;
					본 약관은 2021년 7월 28일부터 시행됩니다.
					2015년 4월 15일부터 시행해 온 약관은 본 약관으로 대체됩니다.
					
					- 이전 개인정보보호 취급방침 보기
				</div> <!-- end of 바디 -->
				
				<!-- 푸터 -->
				<div class="con-footer">
					<button class="goodsBtn confirm-btn" class="btn-close" data-bs-dismiss="modal">확인</button>
				</div>
				
			</div>
		  
		</div>
	</div>
</div> <!-- end of modal2 : 개인 정보 수집 및 이용 동의 -->



<div id="order-right-container">
	<div class="title-text d-flex">
		<div>주문 정보</div>
		<div>302,800원</div>	
	</div>
	
	<hr style="background-color: #c3c3c3;border-top: 0px solid rgba(0,0,0,.1); margin: 25px 0;"/>
	
	<div class="shopname">
		<i class="fas fa-store"></i> 
		ITFF 굿즈마켓 
	</div>
	
	<!-- card 낱개 반복 -->
	<%-- <c:forEach items="${list}" var="cart" varStatus="vs"> --%>
	<div class="card-custom" style="margin-bottom: 40px;">
		<!-- card-head -->
		<div class="card-head">
			<!-- card-head-left : cart-id -->
			<div class="cardId-div">
				<%-- No. ${cart.goodsCart.cartId } --%>
				No.1111111
			</div>
			
			<!-- card-head-right : X버튼 (버튼 클릭시 해당 goods_cart 레코드 삭제(GET) -->
			<!-- <div class="iconBg-div">
				<button type="button" data-cart-id="" class="btn-close" aria-label="Close"></button>
			</div> -->
		</div>
		
		<!-- card-body -->
		<div class="card-body">
			<!-- 이미지 배경 -->
			<div class="img-bg-div">
				<!-- 상품 옵션 이미지 -->
				<%-- <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?pid=${cart.goods.PId}"><img src="${pageContext.request.contextPath}/resources/upload/goods/${cart.optionDetail.optionImg }"></a> --%>
			</div>
			
			<!-- 텍스트 -->
			<div class="card-body-right">
				<!-- 상품명 -->
				<div class="goodsName-div">
					<%-- <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?pid=${cart.goods.PId}">${cart.goods.PName}</a> --%>
					행복한사람
				</div>
				<!-- 서브 카테고리 -->
				<div class="goodsCategory-div">
					<%-- <a href="${pageContext.request.contextPath}/goods/goodsDetail.do?pid=${cart.goods.PId}">${cart.goods.PSubcategory }</a> --%>
					반팔 티셔츠
				</div>
				<!-- 상품 가격 (상품낱개가격*장바구니수량) -->
				<div class="goodsPrice-div">
					<%-- <fmt:formatNumber value="${cart.goods.PPrice*cart.goodsCart.cartQuantity}" pattern="#,###원" /> --%>
					25,000원
				</div>
			</div>
		</div>
		
		<!-- card-footer -->
		<div class="card-footer">
			<!-- card-footer-left -->
			<div class="card-footer-left">
				<!-- 옵션명 -->
				<div>
					<%-- ${cart.optionDetail.optionType }
					${cart.optionDetail.optionColor }
					${cart.optionDetail.optionSize } --%>
					S(90~95)
				</div>
				
				<!-- 개수 -->
				<div>
					<%-- ${cart.goodsCart.cartQuantity }개 --%>
					3개
				</div>
			</div>
			<!-- card-footer-right -->
			<!-- <div class="card-footer-right">
				<button type="button" id="qtyBtn" class="btn btn-outline-secondary" 
					data-bs-toggle="modal" data-bs-target="#QtyChangeModal"
					onclick="">
					수량 변경
				</button>
			</div> -->
		</div>
	
	</div>
	<%-- </c:forEach> --%> <!-- end of card 낱개 반복 -->
	
	
	
	
	
	<div id="summaryBody">
		<div class="summary-row">
			<div>총 수량</div>
			<div><%-- ${allcnt }개 --%>5개</div>
		</div>
		
		<div class="summary-row">
			<div>총 상품 금액</div>
			<div><fmt:formatNumber value="3333333" pattern="#,###원" /></div>
		</div>
		
		<div class="summary-row">
			<div>배송비</div>
			<div>2,500원</div>
		</div>
		
		<div class="summary-row sum-row">
			<div>최종 결제 금액</div>
			<div><fmt:formatNumber value="323232312" pattern="#,###원" /></div>
		</div>
	</div>
	
	
</div> <!-- end of 오른쪽 컨테이너 -->

</section>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(() => {
	
	/* 결제및배송동의 체크박스 전체선택/전체해제 */
    $("#chk-all").click(function(){
        if($("#chk-all").prop("checked")){
            $("input[id^='chk']").prop("checked",true);
        }else{
            $("input[id^='chk']").prop("checked",false);
        }
    })
})

/* 오른쪽 컨테이너 fixed 하는 함수 */ 
/* $(function() {
    $.fn.Scrolling = function(obj, tar) {
        var _this = this;
        $(window).scroll(function(e) {
            var end = obj + tar;
            $(window).scrollTop() >= obj ? _this.addClass("order-fixed") : _this.removeClass("order-fixed");
            if($(window).scrollTop() >= end) _this.removeClass("order-fixed");
        });
    };
    
    $("#order-right-container").Scrolling(
    		$("#order-right-container").offset().top,
    		( ($("#goodsOrder-container").height())*0.7 ));
			
}); */

 
// 우편번호 찾기 찾기 화면을 넣을 element
var element_wrap = document.getElementById('daum-api-iframe');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample3_extraAddress").value = extraAddr;
            
            } else {
                //document.getElementById("sample3_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample3_postcode').value = data.zonecode;
            document.getElementById("sample3_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample3_detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}

</script>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>