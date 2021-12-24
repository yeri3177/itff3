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
	href="${pageContext.request.contextPath }/resources/css/board/faq.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="#" target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->
<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">공지사항</h2>
	</div>
</div>
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->


<div class="container">
		<div class="d3tab_basic">
			<ul id="tabs" class="tab_list list-inline tab_round">
				<li class="on"><a href="javascript:void(0);">티켓 예매권</a></li>
				<li><a href="javascript:void(0);">취소 / 변경 / 환불</a></li>
				<li><a href="javascript:void(0);">상영작 공간 관련</a></li>
				<li><a href="javascript:void(0);">개폐막 / GV / 부대행사</a></li>
				<li><a href="javascript:void(0);">배지</a></li>
				<li><a href="javascript:void(0);">기타</a></li>
				<li><a href="javascript:void(0);">방역지침</a></li>
			</ul>
		</div>
</div>

<div class="cont">

<div class="container mb80">
	<div id="tab_list1 ">
		
		<!-- 티켓 및 예매권 -->
		<div class="jury tabscontents t1" style="display:block;">
			
			<div class="qna">
				<ul>

					<li>
						<div class="question">
							<span>Q</span><p>카드 예매권(2019년 제작유통) 유효기간 </p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<div><img src="/kor/img/FAQ_ticket_1.png"><img src="/kor/img/FAQ_ticket_2.png" style="vertical-align:bottom;"></div>
							<p>
								<span class="">2021년 제26회 부산국제영화제 개최기간까지 (온라인 예매와 현장매표소에서 사용 가능)<br>
								2021년 9월 12일까지 (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)</span>
							<br><br>
							※ 예매권 사용 시 유의사항<br>
							 
							  ① 은색 스크래치 옆 위치한 ‘2020.10.13.’은 영화제 상영작 예매 시 적용되는 유효기간<br>
							 - 영화제 상영작 예매 시 기존 2020.10.13. ▶ 2021년 제26회 부산국제영화제 개최 기간까지 (온라인 예매와 현장매표소에서 사용 가능)<br>
							  ② 붉은 글씨의 ‘2020.09.20.’은 영화제 기간 외 영화의전당 예매 시 적용되는 유효기간<br>
							  - 영화의전당(오프라인) 사용 시 기존 2020.09.20. ▶ 2021년 9월 12일까지 (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)<br>
							  ③ 부산국제영화제 현장예매로 사용 시 취소/환불 불가<br><br>
							 
							 * 영화의전당에서 영화 관람 시, 스크래치를 긁지 않은 예매권으로 현장매표소에서 입장권으로 교환 가능하며, 온라인 예매는 불가<br>
							  * 위 ①, ②와 같이 연장된 유효기간 내 사용하지 못한 예매권은 환불 및 예매 불가


							</p>
							
						</div>
					</li>


					<li>
						<div class="question">
							<span>Q</span><p>카드 예매권(2021년 제작유통) 유효기간 </p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<div><img src="/kor/img/FAQ_ticket_3.png"><img src="/kor/img/FAQ_ticket_4.png" style="vertical-align:bottom;"></div>
							<p>
								<span class="">2022년 제27회 부산국제영화제 폐막일까지 (온라인 예매와 현장매표소에서 사용 가능)<br>
							2022년 12월 31일까지 (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)</span>
														<br><br>
							※ 예매권 사용 시 유의사항<br>
							 
							  ① 하단 주황 글씨의 ‘2021.09.30~2022.12.31.’은 영화제 기간 외 영화의전당 예매 시 적용되는 유효기간<br>
							  (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)<br>
							  ② 부산국제영화제 현장예매로 사용 시 취소/환불 불가<br><br>
							 
							 * 영화의전당에서 영화 관람 시, 스크래치를 긁지 않은 예매권으로 현장매표소에서 입장권으로 교환 가능하며, 온라인 예매는 불가<br>
							 * 유효기간 내 사용하지 못한 예매권은 환불 및 예매 불가<br>
							 * 2021년 9월 19일(일) 이후 카드 예매권 환불 불가							
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>올해(2021) 예매권은 어디서 구입하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								카드(실물) 예매권 판매 기간(9/9 ~ 9/12)이 종료 되었습니다.<br> 
								모바일 예매권 - 부산국제영화제 네이버 스마트스토어에서 구매 가능합니다. <br><br>

								**모바일 예매권 구매 페이지 (https://smartstore.naver.com/biff)<br>
								판매 기간: 2021.09.14(수) 18:00 ~2021.10.14(목) 23:59<br>
								<!-- 쇼핑라이브: 1차- 2021.09.15(수) 20:00<br>
									 2차- 2021.09.24(금) 20:00  -->
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>모바일티켓 가이드라인 안내</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								1. 스마트폰으로 http://www.biff.kr 접속<br>
								 2. 간편 예매 로그인 (예매 시 사용한 '이름, 휴대폰 번호, 비밀번호' 등 기입)<br>
								 3. 모바일 티켓 (로고가 깜빡이는 티켓) 제시 <br>
								 ※ 가이드라인 링크 ▶ https://www.biff.kr/kor/html/landing/m_ticket.html<br>
								<span>※ 로그인 오류 등으로 입장이 지연될 수 있으니, 예매 시 로그인 정보를 정확히 기입해 주시기 바랍니다.<br>
								※ 모바일 티켓을 캡처한 사진이나 예매번호로는 입장이 불가합니다.</span>
								</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>현장에서 티켓을 살 수 있나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								온/오프라인으로 예매가 가능하오나, 별도의 현장 판매분이 없기 때문에 온라인 예매가 매진일 경우 현장 매표소에서도 예매가 불가합니다.<br>
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>티켓 및 예매권은 몇 장 예매할 수 있나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								티켓 - 1인 2매<br>
								예매권 - 1인 10매로 각각 1인 당 구매 가능 수량이 제한 됩니다.
								</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>단체 관람(예매) 진행 하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>코로나바이러스감염증 확산 방지를 위해 좌석 간 거리를 두고 있어 좌석 수가 적어 단체관람을 수용하지 않습니다. (야외극장 포함)</p>
							
						</div>
					</li>
					<!-- <li>
						<div class="question">
							<span>Q</span><p>현장에서 예매내역 캡처 화면을 보여드리면  종이 티켓으로 발권할 수 있나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>캡처 본이 아닌 모바일 티켓, 출력된 예매내역, SMS로 발송된 예매번호를 제시해 주셔야 종이 티켓으로 발권이 가능합니다. (캡쳐 본은 종이 티켓 발권 불가)</p>
							
						</div>
					</li> -->
					<!-- <li>
						<div class="question">
							<span>Q</span><p>종이 티켓을 분실(혹은 파손)했습니다. 재발권 되나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>티켓 파손 및 분실 등 개인적인 사유로 인한 재발권은 불가합니다.</p>
							
						</div>
					</li> -->
					<li>
						<div class="question">
							<span>Q</span><p>예매번호만 아는데 입장이 가능한가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>예매번호만으로는 입장이 불가하며, 해당 상영작 티켓을 제시해 주셔야 입장이 가능합니다. (모바일 티켓 or 종이 티켓)</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>CGV/ 롯데시네마/ 영화의전당 홈페이지에서도 예매할 수 있나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>영화제 상영작 예매는 부산국제영화제 공식 홈페이지를 통해서만 가능합니다. (외부 사이트에서 예매 불가)</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>할인 정책 안내</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							 - 경로 우대: 3,000원 할인 (만 65세인 1956년생 이상, 신분증 지참 필수)<br>
							 - 장애인: 3,000원 할인(복지카드 지참 필수)<br>
							 - 영화의전당 유료회원: 3,000원 할인(개·폐막식 제외한 영화의전당, 야외극장, 소향씨어터 상영작에 한함)<br>
							 - 부산영화체험 박물관 티켓 소지자: 3,000원 할인(개·폐막식 제외)<br><br>

							※ 모든 할인은 현장 BIFF 매표소에서만 적용 가능합니다.							
							</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>관람등급은 어떻게 되나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								상영관 입장은 관람등급에 따라 제한됩니다.<br><br>
								  
								 * G(전체관람가) : 모든 관람객이 관람할 수 있는 등급<br>
								 * 12세 이상 관람가 : 만 12세(2009년생) 미만인 자는 관람할 수 없는 등급<br>
								 * 15세 이상 관람가 : 만 15세(2006년생) 미만인 자는 관람할 수 없는 등급<br>
								 * 청소년 관람불가 : 만 18세(2003년생) 미만인 자는 관람할 수 없는 등급<br><br>
								 
								 ※ 청소년 관람불가 영화의 경우, 고등학교에 재학 중인 자를 포함하여 미성년자(만 18세 미만)는 보호자를 동반하여도 입장이 불가합니다.<br>
								 ※ 만 5세 미만의 유아는 부모가 동반하여도 입장 제한
							
							</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>영수증 출력은 어떻게 하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>별도로 영수증이 필요하신 분은 콜센터로 문의하세요.</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>게스트(배지) 발권</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>게스트(배지) 발권을 원하시는 분은 현장에서 발권하실 수 있으며, 모든 발권은 선착순으로 진행됩니다.</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>게스트 티켓은 얼마인가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>게스트 예매는 무료로 진행됩니다.</p>
							
						</div>
					</li>
			</ul>
		</div>
										


		</div><!-- //tab1 -->
		<!-- //티켓 및 예매권 -->






		<!-- 취소 및 환불 -->
		<div class="jury tabscontents t2" style="display:none;">



			<div class="qna">
				<ul>

					<li>
						<div class="question">
							<span>Q</span><p>예매한 티켓 취소는 어떻게 하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								예매 취소는 해당 영화 시작 30분 전까지 온라인으로 가능합니다.<br>
								<span>※ 취소하는 시점에 따라 취소수수료가 다르니 취소 전 확인해 주시기 바랍니다.</span>
							</p>
							
						</div>
					</li>
					
					<li>
						<div class="question">
							<span>Q</span><p>취소수수료는 얼마인가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							티켓의 취소수수료는 취소하는 시점에 따라 다릅니다.<br>
							 <br>
							 1. 영화제 개막 전 (10월 5일까지) : 수수료 없음<br>
							 2. 영화제 기간 (10월 6일~15일) : 1천 원 (티켓 1장당), 온라인에서 별도로 결제<br>
							 3. 영화제가 상영 일정을 변경하는 등 주최 측의 사유가 있을 경우는 수수료 없이 행사기간 내에 온라인에서 환불
							 </p>
							
						</div>
					</li>
					
					<li>
						<div class="question">
							<span>Q</span><p>예매 취소 후, 환불은 언제 되나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>1~3일 길게는 7일까지 소요되며, 결제수단에 따라 환불에 소요되는 시간이 다릅니다.</p>
							
						</div>
					</li>					
					
					<li>
						<div class="question">
							<span>Q</span><p>모바일 예매권(2021년 제작유통) 유효기간 및 환불 기한</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							<span>유효 기간<br>
							2021년 제26회 부산국제영화제 개최 기간까지 사용 가능 (온라인 예매만 사용 가능)<br><br>

							환불 기한<br>
							2021년 10월 15일(금)까지 환불 가능<br>
							- 개막일 전까지(2021년 10월 5일) 취소/환불 요청 시 100% 환불 가능<br>
							- 개막일 후(2021년 10월 6일 ~ 15일) 취소/환불 요청 시 90% 환불 가능<br>
							* 2021년 10월 5일까지 반품 요청 시 전액 환불되며, 이후 반품 요청 시에는 차액(10%)를 결제해 주셔야 환불이 가능합니다.
							</span></p>
							
						</div>
					</li>					
					
					<li>
						<div class="question">
							<span>Q</span><p>예매한 2장 중 1장만 취소하고 싶어요.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>티켓 매수 변경은 예매하신 티켓 2장 모두를 취소 후에 재차 예매 진행해 주셔야 합니다.<br>
							+) 이 과정에서 좌석이 확보되지 않을 수 있으니 이 점 유의 바랍니다.</p>
							
						</div>
					</li>					
					
					<li>
						<div class="question">
							<span>Q</span><p>결제 수단을 변경하려 합니다.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							티켓 예매가 완료된 후 결제수단을 변경하려면 예매한 티켓을 취소하고 다시 예매해 주셔야 합니다.<br>
							이 과정에서 좌석이 확보되지 않을 수 있으니 이 점 유의 바랍니다.

							</p>
							
						</div>
					</li>		
					<li>
						<div class="question">
							<span>Q</span><p>티켓 교환 창구 운영하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>코로나19 영향으로 인해 올해는 티켓 교환 창구를 운영하지 않습니다.</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>예매권으로 결제한 티켓을 취소하면 다시 사용할 수 없나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>예매권으로 결제한 티켓을 취소하시면 예매 번호가 복구되어 티켓 예매 시 이용 가능합니다.  단, 종이 티켓으로 발권 시에는 취소가 불가합니다.</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>카드 예매권(2019년 제작유통) 유효기간</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<div><img src="/kor/img/FAQ_ticket_1.png"><img src="/kor/img/FAQ_ticket_2.png" style="vertical-align:bottom;"></div>
							<p>
							<span>2021년 제26회 부산국제영화제 개최기간까지 (온라인 예매와 현장매표소에서 사용 가능)<br>
							2021년 9월 12일까지 (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)</span><br><br>


							※ 예매권 사용 시 유의사항<br>
							 
							  ① 은색 스크래치 옆 위치한 ‘2020.10.13.’은 영화제 상영작 예매 시 적용되는 유효기간<br>
							 - 영화제 상영작 예매 시 기존 2020.10.13. ▶ 2021년 제26회 부산국제영화제 개최기간까지 (온라인 예매와 현장매표소에서 사용 가능)<br>
							  ② 붉은 글씨의 ‘2020.09.20.’은 영화제 기간 외 영화의전당 예매 시 적용되는 유효기간<br>
							  - 영화의전당(오프라인) 사용 시 기존 2020.09.20. ▶ 2021년 9월 12일까지 (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)<br>
							  ③ 부산국제영화제 현장 예매로 사용 시 취소/환불 불가<br><br>
							 
							 * 영화의전당에서 영화 관람 시, 스크래치를 긁지 않은 예매권으로 현장매표소에서 입장권으로 교환 가능하며, 온라인 예매는 불가<br>
							  * 위 ①, ②와 같이 연장된 유효기간 내 사용하지 못한 예매권은 환불 및 예매 불가
							
							</p>
							
						</div>
					</li>
					
					<li>
						<div class="question">
							<span>Q</span><p>카드 예매권(2021년 제작유통) 유효기간</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<div><img src="/kor/img/FAQ_ticket_3.png"><img src="/kor/img/FAQ_ticket_4.png" style="vertical-align:bottom;"></div>
							<p>
							2022년 제27회 부산국제영화제 폐막일까지 (온라인 예매와 현장매표소에서 사용 가능)<br>
							2022년 12월 31일까지 (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)<br><br>

							※ 예매권 사용 시 유의사항<br>
							 
							  ① 하단 주황 글씨의 ‘2021.09.30~2022.12.31.’은 영화제 기간 외 영화의전당 예매 시 적용되는 유효기간<br>
							  (영화의전당 현장매표소에서 상영작 입장권으로 교환 가능. 단, 온라인 예매 불가)<br>
							  ② 부산국제영화제 현장 예매로 사용 시 취소/환불 불가<br><br>
							 
							 * 영화의전당에서 영화 관람 시, 스크래치를 긁지 않은 예매권으로 현장매표소에서 입장권으로 교환 가능하며, 온라인 예매는 불가<br>
							 * 유효기간 내 사용하지 못한 예매권은 환불 및 예매 불가<br>
							 * 2021년 9월 19일(일) 이후 카드 예매권 환불 불가							
							</p>
							
						</div>
					</li>
				</ul>
			</div>


			

		</div><!-- //tab2 -->
		<!-- //취소 및 환불 -->



		<!-- 상영작공간관련 -->
		<div class="jury tabscontents t3" style="display:none;">
			<div class="qna">
				<ul>

				<li>
					<div class="question">
						<span>Q</span>
						<p>올해(2021년도) 상영관</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						영화의전당 - 하늘연극장, 중극장, 소극장, 시네마테크, 야외극장<br>
						롯데시네마 센텀시티, CGV센텀시티, 소향씨어터<br>
						커뮤니티비프 - 롯데시네마 대영(1관)
						</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						안내데스크	
						</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						 - 야외사거리<br>
						 - 소향씨어터<br>
						 - 시네마운틴 1층<br>
						 - 시네마운틴 6층<br>
						 - CGV 센텀시티 7층<br>
						 - 롯데시네마 8층<br> <br>

						각각 위치해 있습니다.
						</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>장애인이나 노약자의 입장 방법은 어떻게 되나요?</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						극장 별 안내데스크에 도움을 요청하시거나, 아래 안내된 번호로 연락 주시면 감사하겠습니다.<br>
						  ☎ 1666-9177 (콜센터 10:00 ~ 17:00)<br>
						  ☎ 1688-3010 (대표번호)</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						상영 시작 후에 입장 가능한가요?</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>정시입장이 원칙이나, 상영 시작 후 15분까지 입장할 수 있으며, 반드시 예매한 지정좌석에 착석해야 합니다.</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>영화 관람 시 사진이나 동영상 촬영이 가능한가요?</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						<span>상영 중 촬영은 불가합니다. (단, 상영 후 GV 행사는 촬영 가능합니다)</span></p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						단편영화 묶음 상영의 경우, 상영 도중 입장할 수 있나요?
						</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						한 편의 단편영화가 끝날 때마다 입장을 도와드릴 예정이며, 현장 스태프의 안내에 따라주시기 바랍니다.
						</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						상영 몇 분 전부터 입장하나요?								

						</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						상영 시작 15분 전부터 입장하실 수 있으며, 현장 스태프의 안내에 따라주시기 바랍니다. 							

						</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						분실물은 어디에서 찾나요?								
	
						</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						극장 별 안내데스크 혹은 영화제 콜센터(1666-9177)로 문의 바랍니다.				

						</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						관람등급은 어떻게 되나요?							
	
						</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						상영관 입장은 관람등급에 따라 제한됩니다.<br><br>
						  
						 * G(전체관람가) : 모든 관람객이 관람할 수 있는 등급<br>
						 * 12세 이상 관람가 : 만 12세(2009년생) 미만인 자는 관람할 수 없는 등급<br>
						 * 15세 이상 관람가 : 만 15세(2006년생) 미만인 자는 관람할 수 없는 등급<br>
						 * 청소년 관람불가 : 만 18세(2003년생) 미만인 자는 관람할 수 없는 등급<br>
						 <br><br>
						 ※ '청소년 관람불가'는 티켓이 있고 보호자가 동반하여도 입장 불가<br>
						 ※ 만 5세 미만의 유아는 부모가 동반하여도 입장 제한
						</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						온라인으로 예매했는데 바로 입장이 가능한가요?							

						</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						해당 상영작의 모바일 티켓을 제시하신 후 입장 가능합니다.				

						</p>
						
					</div>
				</li>
				<li>
					<div class="question">
						<span>Q</span>
						<p>
						짐이 많은데, 잠시 안내데스크(자원봉사자)에 잠시 맡길 수 있을까요?							

						</p>
					</div>
					<div class="answer">
						<div class="ico_sec">
						<span>A</span>
					</div>
					<div class="txt_sec">
						<p>
						코로나19 상황으로 방역 지침 상 안내데스크에서는 짐을 보관하지 않습니다.

						</p>
						
					</div>
				</li>
					<li>
						<div class="question">
							<span>Q</span><p>입장 가능 시간은 언제인가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							영화 상영은 정시에 시작하며, 영화 시작 후 15분까지 입장 가능하나 그 이후로는 입장이 불가합니다.<br>
							상영관 입장은 영화 시작 15분 전부터 입장 가능합니다. <br>
							(단, 방역상황이나 상영 테스트 등에 따라 변동이 있을 수 있습니다.)							
							</p>
							
						</div>
					</li>				
					<li>
						<div class="question">
							<span>Q</span><p>주차장 위치와 주차요금 알려주세요.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							* 영화의전당 주차장<br><br>
							주차 수용 최대 501대(장애인용 20대 포함)<br>
							주차요금(운영시간 08:00 ~ 23:00)<br>
							- 기본요금: 30분 이내 출차 시 무료, 초과 시 30분당 1,000원(정상요금 적용)<br>
							- 영화 관객: 1편당 4시간 무료<br>
							- 일일 요금: 15,000원<br>
							- 할인 요금(50% 할인): 경차, 장애인, 국가유공자, 다자녀가정 가족사랑카드 등재자, 선택요일제 참여차량<br><br>

							* 롯데시네마 1편당 3시간 무료 → 상영작 티켓 제시할 경우 안내데스크에서 주차권 배부<br><br>

							* 소향씨어터 1편당 5시간 무료 → 안내데스크 문의
							
							</p>
							
						</div>
					</li>				
				
				
				</ul>
			</div>

			
		</div><!-- //tab3 -->
		<!-- //상영작 및 공간 관련 -->


		<!-- 개폐막GV부대행사 -->
		<div class="jury tabscontents t4" style="display:none;">
			<div class="qna">
				<ul>


					<li>
						<div class="question">
							<span>Q</span><p>비프샵(굿즈), 관객숙소, 가이드맵 운영하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							비프샵(굿즈)은 온/오프라인을 통해 운영되며, 운영 기간은 아래를 참고해 주세요.<br><br>

							- 온라인 비프샵 : 10월 7일(목) 10:00 ~ 10월 15일(금) 18:00<br><br>

							- 오프라인 비프샵<br>
							   - 영화의 전당 비프힐 1F : 10월 7일(목) ~ 10월 14일(목) 10:00 ~ 19:00<br>
							   - 롯데시네마 대영 4F : 10월 7일(목) ~ 10월 11일(월) 10:00 ~ 19:00<br><br>

							그 외 관객숙소 및 가이드맵은 운영하지 않습니다.
							
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>개막식과 폐막식은 어떻게 하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								현재로서 개막식과 폐막식은 진행 예정입니다. 단, 코로나19 상황에 따라 달라질 수 있습니다.

							
							</p>
							
						</div>
					</li>



					<li>
						<div class="question">
							<span>Q</span><p>커뮤니티비프 정보는 어디에서 확인하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							홈페이지를 확인해 주세요.(아래 링크)<br>
							<a href="http://community.biff.kr/" target="_blank">http://community.biff.kr/</a>
							
							</p>
							
						</div>
					</li>


					<li>
						<div class="question">
							<span>Q</span><p>야외에서 하는 행사는 없나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>야외무대, 오픈토크 등 야외행사는 방역수칙에 따라 진행 예정입니다. 단, 코로나19 상황에 따라 달라질 수 있습니다.


							
							</p>
							
						</div>
					</li>


					<li>
						<div class="question">
							<span>Q</span><p>GV 진행 시 게스트에게 선물을 전달하고 싶은데 직접 드릴 수 있나요? </p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>

							코로나19 상황으로 인해 게스트에게 선물을 전달하기는 어렵습니다. (스태프에게 전달)
							
							</p>
							
						</div>
					</li>


					<li>
						<div class="question">
							<span>Q</span><p>취재를 위해 GV만 참석을 하고 싶은데 가능한가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							가능합니다. 현장 스태프의 안내에 협조 부탁드립니다.
							</p>
						</div>
					</li>


					<li>
						<div class="question">
							<span>Q</span><p>GV행사 중간에 퇴장해도 되나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							네, 가능합니다. 다만, 다른 관객들에게 불편을 끼치지 않게 유의해 주시기 바랍니다.

							
							</p>
							
						</div>
					</li>


					<li>
						<div class="question">
							<span>Q</span><p>GV 종료 후 게스트와 이야기를 나누고 싶은데 가능한가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								코로나19 상황으로 인해 상영관 내에서는 게스트와의 접촉을 최소화하는 방침으로 운영 중에 있습니다. 대화 역시 별도로 하실 수 없사오니 이 점 양해 부탁드립니다.

							
							</p>
							
						</div>
					</li>


					<li>
						<div class="question">
							<span>Q</span><p>GV 진행 시 사진 촬영이 가능한가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
								GV 진행 중 사진 촬영 및 영상 촬영은 가능하나 지정된 좌석에서만 촬영 바랍니다.<br>
								(단, 상영 중 사진 및 영상 촬영은 불가합니다.)

							
							</p>
							
						</div>
					</li>


				</ul>
			</div>
		</div><!-- //tab4 -->
		<!-- //개폐막GV부대행사 -->





		<!-- 배지 -->
		<div class="jury tabscontents t5" style="display:none;">
			<div class="qna">
				<ul>


					<li>
						<div class="question">
							<span>Q</span><p>프레스 배지를 발급받고 싶습니다.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							<a href="https://www.biff.kr/kor/addon/10000001/page.asp?page_num=345" target="_blank">https://www.biff.kr/kor/addon/10000001/page.asp?page_num=345</a><br>
							위 링크로 진입하셔서 관련 내용 확인 부탁드립니다.
							
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>배지 신청 일정을 알고 싶습니다.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>2021년 영화제/시네필 유료 배지 운영을 중단합니다. <br>
							코로나바이러스감염증-19(COVID-19)의 유행으로 인해 올해까지 유료 배지 운영을 중단하게 되었습니다. 양해 부탁드립니다.  							
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>게스트(배지) 발권</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>게스트(배지) 발권을 원하시는 분은 현장에서 발권하실 수 있으며, 모든 발권은 선착순으로 진행됩니다.</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>게스트 티켓은 얼마인가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>게스트 예매는 무료로 진행됩니다.
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>게스트 티켓 취소하고 싶어요.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>게스트 티켓 역시 상영 시작 30분 전까지 현장 매표소에서 취소가 가능하며, 취소 수수료는 별도 부과되지 않습니다.</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>역대 스태프 / 시네필 배지를 발급받고 싶습니다.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>올해는 역대 스태프 및 시네필 배지는 발급이 되지 않습니다.</p>
							
						</div>
					</li>



				</ul>
			</div>
		</div><!-- //tab4 -->
		<!-- //배지 -->




		<!-- 기타 -->
		<div class="jury tabscontents t6" style="display:none;">
			<div class="qna">
				<ul>


					<li>
						<div class="question">
							<span>Q</span><p>관람객이 아닌 일반 방문객도 영화제에 방문할 수 있나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>영화제 관객이 아니어도 단순 방문 가능하나 방역지침에 따라주시기 바랍니다.</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>방역 계획은 어떤가요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							0. 마스크를 착용하지 않으면 출입이 불가합니다. 실내는 물론 실외에서도 마스크를 착용해야 하며, 영화 관람객은 KF(80, 94)규격의 마스크를 이용해 주실 것을 적극 권장합니다.<br>
							 1. 상영관 출입 시 체온 측정 및 전자출입 명부(안심콜, QR, 수기명부 등) 시행<br>
							 2. 상영 전후 팔걸이 소독, 1일 1회 상영관 소독과 환기 등 주기적 방역 실시
							
							</p>
							
						</div>
					</li>
					<li>
						<div class="question">
							<span>Q</span><p>주차장 위치와 주차요금 알려주세요.</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>
							*영화의전당 주차장<br><br>
							
							주차 수용 최대 501대(장애인용 20대 포함)<br>
							주차요금(운영시간 08:00 ~ 23:00)<br>
							- 기본요금: 30분 이내 출차 시 무료, 초과 시 30분당 1,000원(정상요금 적용)<br>
							- 영화 관객: 1편당 4시간 무료<br>
							- 일일 요금: 15,000원<br>
							- 할인 요금(50% 할인): 경차, 장애인, 국가유공자, 다자녀가정 가족사랑카드 등재자, 선택요일제 참여차량<br><br>

							* 롯데시네마 1편당 3시간 무료 → 상영작 티켓 제시할 경우 안내데스크에서 주차권 배부<br><br>

							* 소향씨어터 1편당 5시간 무료 → 안내데스크 문의
							</p>
							
						</div>
					</li>

					<li>
						<div class="question">
							<span>Q</span><p>홈페이지 회원 탈퇴는 어떻게 하나요?</p>
						</div>
						<div class="answer">
							<div class="ico_sec">
							<span>A</span>
						</div>
						<div class="txt_sec">
							<p>홈페이지 1:1문의 게시판에 탈퇴 요청 부탁드립니다.</p>
							
						</div>
					</li>

				
				
				
				
				</ul>
			</div>
		</div><!-- //tab4 -->
		<!-- //기타 -->







		<!-- 기타 -->
		<div class="jury tabscontents t7" style="display:none;">
			<div class="faq_covid">
				<ul>

					<li>상영관 내 음식물 반입 제한 (코로나19 확산 방지를 위해 상영관 내 뚜껑이 있는 생수와 음료류를 제외한 음식물 반입 및 섭취는 불가합니다.)
					<br>* 단, 영화의전당 하늘연극장, 소향씨어터의 경우 생수만 가능</li>
					<li>(GV) 상영관 내에서는 게스트와의 접촉을 최소화하는 방침으로 운영 중에 있습니다. 대화 역시 별도로 하실 수 없사오니 이 점 양해 부탁드립니다.</li>
					<li>티켓이 필요한 행사에 해당 상영작 티켓을 소지하지 않은 경우는 입장이 제한됩니다.</li>
					<li>상영관 입장 후에는 지정된 좌석에만 착석 가능합니다.</li>
					<li>행사장 내에서 마스크 착용은 필수이며, 미착용 시 입장이 불가합니다. 영화 관람 중에도 반드시 마스크를 착용해 주셔야 하는 점 양해 부탁드립니다.</li>
					<li>체온 측정 시 두 차례 이상 37.5도 이상이면 행사장 입장이 제한됩니다.
					<br>* 현장 스태프의 안내를 따라주시기 바랍니다.</li>
					<li>행사장 출입 시 안심콜 출입관리시스템 등 출입명부를 반드시 등록해주셔야 합니다.</li>

				</ul>
			</div>
		</div><!-- //tab4 -->
		<!-- //기타 -->











	</div><!-- //tab_list1 -->




</div><!-- //container -->
</div><!-- //cont -->

	
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
