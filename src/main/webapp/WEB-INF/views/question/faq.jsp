<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- taglib은 공유되지 않으니 jsp마다 작성할 것 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자주 묻는 질문" name="title"/>
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/question/faq.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath }/review/reviewList.do" target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<section class="ink_board guest_mode">


<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">자주 찾는 질문</h2>
	</div>
</div> 
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->



<div class="d3tab_basic">
	<ul id="depth3" class="depth3_ul">
		<li class="depth3_li on 1_0" id="tab1">취소 / 변경 / 환불</li>
		<li class="depth3_li on_1_1" id="tab2">상영작 공간 관련</li>
		<li class="depth3_li on_1_2" id="tab3">굿즈</li>
		<li class="depth3_li on_1_3" id="tab4">기타</li>
	</ul>
</div>

<!-- 취소 / 변경 / 환불 -->
<div id="accordion1" class="arccordion">

  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <span>Q</span>
          <p>예매한 티켓 취소는 어떻게 하나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion1">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			예매 취소는 해당 영화 시작 30분 전까지 온라인으로 가능합니다.<br>
			취소하는 시점에 따라 취소수수료가 다르니 취소 전 확인해 주시기 바랍니다.
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <span>Q</span>
          <p>취소수수료는 얼마인가요?</p> 
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion1">
      <div class="card-body">
      	<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			티켓의 취소수수료는 취소하는 시점에 따라 다릅니다.<br>
			 <br>
			 1. 영화제 개막 전 (1월 6일까지) : 수수료 없음<br>
			 2. 영화제 기간 (1월 7일~14일) : 1천 원 (티켓 1장당), 온라인에서 별도로 결제<br>
			 3. 영화제가 상영 일정을 변경하는 등 주최 측의 사유가 있을 경우는 수수료 없이 행사기간 내에 온라인에서 환불
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <span>Q</span>
          <p>예매 취소 후, 환불은 언제 되나요?</p> 
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion1">
      <div class="card-body">
      	<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			1~3일 길게는 7일까지 소요되며, 결제수단에 따라 환불에 소요되는 시간이 다릅니다.
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingFour">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
          <span>Q</span>
          <p>예매한 2장 중 1장만 취소하고 싶어요.</p> 
        </button>
      </h5>
    </div>

    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion1">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			티켓 매수 변경은 예매하신 티켓 2장 모두를 취소 후에 재차 예매 진행해 주셔야 합니다.<br>
			+) 이 과정에서 좌석이 확보되지 않을 수 있으니 이 점 유의 바랍니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingFive">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
          <span>Q</span>
          <p>결제 수단을 변경하려 합니다.</p> 
        </button>
      </h5>
    </div>

    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion1">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			티켓 예매가 완료된 후 결제수단을 변경하려면 예매한 티켓을 취소하고 다시 예매해 주셔야 합니다.<br>
			이 과정에서 좌석이 확보되지 않을 수 있으니 이 점 유의 바랍니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingSix">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
          <span>Q</span>
          <p>티켓 교환 창구 운영하나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion1">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			코로나19 영향으로 인해 올해는 티켓 교환 창구를 운영하지 않습니다.
      	</div>
      </div>
    </div>
  </div>
  
  
</div><!-- accordion1 end -->



<!-- 상영작 공간 관련 -->
<div id="accordion2" class="arccordion">

  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <span>Q</span>
          <p>제 1회(2022년도) ITFF 상영관</p> 
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			서울특별시 강남구 테헤란로14길 6   KH극장
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <span>Q</span>
          <p>안내데스크</p> 
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion2">
      <div class="card-body">
      	<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			서울특별시 강남구 테헤란로14길 6 KH극장 2층에 위치해 있습니다.
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <span>Q</span>
          <p>장애인이나 노약자의 입장 방법은 어떻게 되나요?</p> 
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion2">
      <div class="card-body">
      	<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			극장 내 안내데스크에 도움을 요청하시거나, 아래 안내된 번호로 연락 주시면 감사하겠습니다.<br>
			  ☎ 1544-9970 (콜센터 10:00 ~ 17:00)<br>
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingFour">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
          <span>Q</span>
          <p>상영 시작 후에 입장 가능한가요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			정시입장이 원칙이나, 상영 시작 후 15분까지 입장할 수 있으며, 반드시 예매한 지정좌석에 착석해야 합니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingFive">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
          <span>Q</span>
          <p>영화 관람 시 사진이나 동영상 촬영이 가능한가요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			상영 중 촬영은 불가합니다. 
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingSix">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
          <span>Q</span>
          <p>상영 몇 분 전부터 입장하나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			상영 시작 15분 전부터 입장하실 수 있으며, 현장 스태프의 안내에 따라주시기 바랍니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingSeven">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="true" aria-controls="collapseSeven">
          <span>Q</span>
          <p>분실물은 어디에서 찾나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			극장 안내데스크 혹은 영화제 1544-9970 (콜센터 10:00 ~ 17:00)으로 문의 바랍니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="heading8">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapse8" aria-expanded="true" aria-controls="collapse8">
          <span>Q</span>
          <p>관람등급은 어떻게 되나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapse8" class="collapse" aria-labelledby="heading8" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			상영관 입장은 관람등급에 따라 제한됩니다.<br><br>
			  
			 * G(전체관람가) : 모든 관람객이 관람할 수 있는 등급<br>
			 * 12세 이상 관람가 : 만 12세(2010년생) 미만인 자는 관람할 수 없는 등급<br>
			 * 15세 이상 관람가 : 만 15세(2007년생) 미만인 자는 관람할 수 없는 등급<br>
			 * 청소년 관람불가 : 만 18세(2004년생) 미만인 자는 관람할 수 없는 등급<br>
			 <br><br>
			 ※ '청소년 관람불가'는 티켓이 있고 보호자가 동반하여도 입장 불가<br>
			 ※ 만 5세 미만의 유아는 부모가 동반하여도 입장 제한
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="heading9">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapse9" aria-expanded="true" aria-controls="collapse9">
          <span>Q</span>
          <p>짐이 많은데, 잠시 안내데스크(자원봉사자)에 잠시 맡길 수 있을까요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapse9" class="collapse" aria-labelledby="heading9" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			코로나19 상황으로 방역 지침 상 안내데스크에서는 짐을 보관하지 않습니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="heading10">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapse10" aria-expanded="true" aria-controls="collapse10">
          <span>Q</span>
          <p>입장 가능 시간은 언제인가요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapse10" class="collapse" aria-labelledby="heading10" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			영화 상영은 정시에 시작하며, 영화 시작 후 15분까지 입장 가능하나 그 이후로는 입장이 불가합니다.<br>
			상영관 입장은 영화 시작 15분 전부터 입장 가능합니다. <br>
			(단, 방역상황이나 상영 테스트 등에 따라 변동이 있을 수 있습니다.)		
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="heading11">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapse11" aria-expanded="true" aria-controls="collapse11">
          <span>Q</span>
          <p>주차장 위치와 주차요금 알려주세요.</p> 
        </button>
      </h5>
    </div>

    <div id="collapse11" class="collapse" aria-labelledby="heading11" data-parent="#accordion2">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
      		주차장은 서울특별시 강남구 테헤란로14길 6. 남도빌딩 지하 1층에 위치해 있습니다. <br />
			주차요금은 <br />
			2시간 2,000원 (티켓 소지시) <br />
			※ 1,600원 할인된 금액, 2시간 이후 5분당 150원 추가입니다.
      	</div>
      </div>
    </div>
  </div>
  
  
</div><!-- 상영작 공간 관련accordion2 end -->


<!-- 굿즈 관련 -->
<div id="accordion3" class="arccordion">

  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <span>Q</span>
          <p>복합결제가 가능한가요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion3">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			복합결제는 현재 지원하지 않습니다. <br /> 구매를 희망하시는 고객님들께서는 한 가지의 결제수단을 이용해 주시기 바랍니다.
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <span>Q</span>
          <p>포인트 선 할인은 무엇인가요?</p> 
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion3">
      <div class="card-body">
      	<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			포인트 선 할인은 상품 구매 시 지급되는 포인트를 지급받지 않고 상품 주문 시 즉시 사용하는 할인 방법입니다.<br />
제휴(광고) 접속 또는 일부 상품에는 포인트 선 할인이 제한될 수 있습니다.
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <span>Q</span>
          <p>배송은 어떻게 되나요?</p> 
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion3">
      <div class="card-body">
      	<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			평일 (월~금)<br /><br />
- 오전에 결제 완료 시 : 대부분 당일 오후 중 출고 진행<br /><br />
- 오후~저녁에 결제 완료 시 : 다음날 출고 진행<br /><br />
<br /><br />
주말 및 공휴일 (토~일, 빨간 날)<br /><br />
- 택배 업체 중단으로 돌아오는 평일부터 출고를 시작합니다.<br /><br />
- 주문량이 많을 경우 1~2일 정도 출고 일정이 미뤄질 수 있습니다.<br /><br />
- 설날, 추석 등 명절 직후에는 택배 업체 물량 과다로 출고 및 배송 지연이 지속적으로 발생할 수 있습니다.<br /><br />
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingFour">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
          <span>Q</span>
          <p>해외에 거주하고 있습니다. 해외 배송이 가능한가요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion3">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			죄송합니다. 현재 해외 배송은 불가능합니다. 빠른 시일 안에 도입하도록 하겠습니다
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingFive">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
          <span>Q</span>
          <p>수령 시 부재로  반송된 경우 어떻게 하나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion3">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			부재 등의 사유로 반송된 상품은 마이페이지 [주문 내역 조회] 에서 확인되는 택배사 영업소를 통해 재배송 요청을 하실 수 있습니다. <br />
			상품이 이미 반송되어 해당 업체로 반품 입고된 경우, 왕복 배송비를 고객님이 추가 부담하셔야 합니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingSix">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix">
          <span>Q</span>
          <p>입금 전 주문 취소는 어떻게 하나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion3">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			마이페이지 [주문 내역 조회] 에서 주문취소할 수 있습니다. <br />
			신청 즉시 주문 취소되며 사용하신 적립금과 쿠폰은 최초 발급일 기준으로 유효기간이 만료되지 않은 경우 반환되어 재사용 가능합니다.<br />
미입금 주문의 옵션 변경을 원하시는 경우에도 주문 취소 후 재주문 해주셔야 합니다.
			
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingSeven">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="true" aria-controls="collapseSeven">
          <span>Q</span>
          <p>재고가 없어요. 언제쯤 구입할 수 있을까요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordion3">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			 재입고 여부는 상품 상세 페이지의 상품문의 게시판을 통하여 문의하시는 것이 가장 정확합니다. <br />
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="heading8">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapse8" aria-expanded="true" aria-controls="collapse8">
          <span>Q</span>
          <p>가격이 떨어져 예전에 구매했을 때 보다 싸게 팔고 있는 경우 차액 환불이 되나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapse8" class="collapse" aria-labelledby="heading8" data-parent="#accordion3">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			판매 가격의 변동에 따른 차액을 보상해드리지 않습니다.
      	</div>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="heading9">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapse9" aria-expanded="true" aria-controls="collapse9">
          <span>Q</span>
          <p>사진과 제품의 실제 색상이 다른 것 같아요.</p> 
        </button>
      </h5>
    </div>

    <div id="collapse9" class="collapse" aria-labelledby="heading9" data-parent="#accordion3">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			온라인의 특성상 상품 이미지는 출력되는 모니터 환경에 따라 조금씩 차이가 있을 수 있으며 이는 판매자 사유에 의한 교환 및 환불 대상이 아닙니다.
      	</div>
      </div>
    </div>
  </div>
  
  
  
  
</div><!-- 굿즈 관련accordion3 end -->

<!-- 기타 -->
<div id="accordion4" class="arccordion">

  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <span>Q</span>
          <p>관람객이 아닌 일반 방문객도 영화제에 방문할 수 있나요?</p> 
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion4">
      <div class="card-body">
		<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			영화제 관객이 아니어도 단순 방문 가능하나 방역지침에 따라주시기 바랍니다.
      	</div>
      </div>
    </div>
  </div>
  
  
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <span>Q</span>
          <p>방역 계획은 어떤가요?</p> 
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion4">
      <div class="card-body">
      	<div class="ico_sec">
			<span>A</span>
		</div>
      	<div class="text_sec">
			0. 마스크를 착용하지 않으면 출입이 불가합니다. 실내는 물론 실외에서도 마스크를 착용해야 하며, 영화 관람객은 KF(80, 94)규격의 마스크를 이용해 주실 것을 적극 권장합니다.<br>
		 1. 상영관 출입 시 체온 측정 및 전자출입 명부(안심콜, QR, 수기명부 등) 시행<br>
		 2. 상영 전후 팔걸이 소독, 1일 1회 상영관 소독과 환기 등 주기적 방역 실시
      	</div>
      </div>
    </div>
  </div>
  
  
  
  
  
</div><!-- 기타 accordion4 end -->

</section>
<script>
var style = {
		'color': 'white',
		'background-color': '#212121', 
		'border-color': '#212121'
};
var none = {
		'color': '',
		'background-color': '', 
		'border-color': ''
}
$(document).on("load") 
	$('#tab1').css(style);
	$('#accordion2').hide();
	$('#accordion3').hide();
	$('#accordion4').hide();
	
$('#tab1').on("click", e => {
	
	$('#accordion1').show();
	$('#tab1').css(style);
	
	$('#accordion2').hide();
	$('#tab2').css(none);
	
	$('#accordion3').hide();
	$('#tab3').css(none);
	
	$('#accordion4').hide();
	$('#tab4').css(none);
});
$('#tab2').on("click", e => {
	$('#accordion1').hide();
	$('#tab1').css(none);
	$('#accordion2').show();
	$('#tab2').css(style);
	$('#accordion3').hide();
	$('#tab3').css(none);
	$('#accordion4').hide();
	$('#tab4').css(none);
});
$('#tab3').on("click", e => {
	$('#accordion1').hide();
	$('#tab1').css(none);
	$('#accordion2').hide();
	$('#tab2').css(none);
	$('#accordion3').show();
	$('#tab3').css(style);
	$('#accordion4').hide();
	$('#tab4').css(none);
});
$('#tab4').on("click", e => {
	$('#accordion1').hide();
	$('#tab1').css(none);
	$('#accordion2').hide();
	$('#tab2').css(none);
	$('#accordion3').hide();
	$('#tab3').css(none);
	$('#accordion4').show();
	$('#tab4').css(style);
});

</script>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
