<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- taglib은 공유되지 않으니 jsp마다 작성할 것 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 한글 깨지지 않게 처리 -->
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이용약관" name="title"/>
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/footer/termsOfUse.css" />

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_">
				<a href="${pageContext.request.contextPath }/footer/termsOfUse.do" target="_top">이용약관</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">개인정보취급방침</a>
			</li>
			<li class="on_">
				<a href="#" target="_top">이메일무단수집거부</a>
			</li>
			<li class="on_"><a href="${pageContext.request.contextPath}/guide/trafficGuide.do" target="_top">사무국 오시는 길</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->



<!-- 해당 페이지 큰 글씨 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">이용약관</h2>
	</div>
</div> 
<!-- 여기까지 해당 페이지 큰 글씨입니다. -->
	
<div class="i_padding">
	<div class="join_con">
		<div class="rules_box">
			<div class="rules_box_txt" style="">	
				<strong style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 13pt;">제1장 총칙</strong>	
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제1조 (목적)</dt>		
					<dd>이 약관은 사단법인 정보기술영화제 조직위원회(이하 "ITFF"라 합니다.)가 제공하는 정보기술영화제 공식 홈페이지 (http://www.iff.or.kr/) 서비스(이하 "서비스"라 합니다.)를 이용함에 있어 이용자와 ITFF의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.		</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제2조 (약관의 효력 및 변경)</dt>		
					<dd>			
						<ol>				
							<li>1. 이 약관은 본 서비스를 이용하고자 하는 모든 이용자에 대하여 그 효력이 발생합니다.</li>				
							<li>2. 이 약관의 내용은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공시하고, 회원이 서비스에 가입함으로써 효력이 발생합니다.</li>				
							<li>3. ITFF는 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 개정된 약관을 1항과 동일한 방법으로 공시합니다.</li>			
						</ol>		
					</dd>
					<dd></dd>
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제3조 (약관 외 준칙)</dt>		
					<dd>이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전기 통신 기본법, 전기 통신 사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 따릅니다.</dd>
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제4조 (용어의 정의)</dt>		
					<dd>			
						<ol>				
							<li>1. 회원: 홈페이지에 접속하여 이 약관에 동의하고 디와 비밀번호를 발급 받아 ITFF가 제공하는 서비스를 받는 자</li>				
							<li>2. 디: 회원 식별과 서비스 이용을 위하여 이용자가 입력하고 ITFF가 승인하는 영문자와 숫자의 조합</li>				
							<li>3. 비밀번호: 회원의 비밀보호를 위하여 이용자가 설정한 문자와 숫자의 조합</li>				
							<li>4. 비회원: 회원에 가입하지 않고 ITFF가 제공하는 서비스를 이용하는 자</li>				
							<li>5. 이용자: 홈페이지에 접속하여 이 약관에 따라 서비스를 받는 회원 또는 비회원</li>			
						</ol>		
					</dd>	
				</dl>	
				<strong style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 13pt;">제2장 계약 당사자의 의무</strong>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제5조 (ITFF의 의무)</dt>		
					<dd>			
						<ol>				
							<li>1. ITFF는 서비스 제공과 관련하여 알고 있는 회원의 신상 정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 법률의 규정에 따른 적법한 절차에 의한 경우에는 그러하지 않습니다.</li>				
							<li>2. 제1항의 범위 내에서, ITFF는 업무와 관련하여 회원의 사전 동의 없이 회원 전체 또는 일부의 개인 정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 이를 위하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저 설정을 변경할 수 있으며, 쿠키의 설정 변경에 의해 서비스 이용이 변경되는 것은 회원의 책임입니다.</li>				
							<li>3. ITFF는 서비스와 관련한 회원의 불만 사항이 접수되는 경우 이를 신속하게 처리하여야 하며, 신속한 처리가 곤란한 경우 그 사유와 처리 일정을 서비스 화면에 게재하거나 전자 우편 등을 통하여 동 회원에게 통지합니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제6조 (회원의 의무)</dt>		
					<dd>			
						<ol>				
							<li>1. 회원은 서비스를 이용할 때 다음 각 호의 행위를 하여서는 아니 됩니다.&nbsp;
								<ol>				
									<li>① 이용 신청 시 허위 사실을 기재하거나, 다른 회원의 ITFF디 및 비밀번호를 도용, 부정하게 사용하는 행위</li>
									<li>② ITFF의 서비스를 이용하여 얻은 정보를 ITFF의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 행위</li>
									<li>③ 타인의 명예를 손상시키거나 불이익을 주는 행위</li><li>④ 게시판 등에 음란물을 게재하거나 음란 사이트를 연결(링크)하는 행위</li>
									<li>⑤ ITFF의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위</li><li>⑥ 공공 질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형, 음성 등을 타인에게 유포하는 행위</li>
									<li>⑦ 서비스와 관련된 설비의 오동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염 자료를 등록 또는 유포하는 행위</li>
									<li>⑧ 서비스 운영을 고의로 방해하거나 서비스의 안정적 운영을 방해할 수 있는 정보 및 수신자의 의사에 반하여 광고성 정보를 전송하는 행위</li>
									<ol>								
										<li>2. 회원은 관계 법령, 본 약관의 규정, 이용 안내 및 서비스 상에 공지한 주의사항, ITFF가 통지하는 사항 등을 준수하여야 하며, 기타 ITFF의 업무에 방해되는 행위를 하여서는 아니 됩니다.</li>				
										<li>3. 회원은 ITFF에서 공식적으로 인정한 경우를 제외하고는 서비스를 이용하여 상품을 판매하는 영업 활동을 할 수 없으며 특히 해킹, 광고를 통한 수익, 음란 사이트를 통한 상업 행위, 상용 소프트웨어 불법 배포 등을 할 수 없습니다. 이를 위반하여 발생한 영업 활동의 결과 및 손실, 관계 기관에 의한 구속 등 법적 조치 등에 관해서는 ITFF가 책임을 지지 않으며, 회원은 이와 같은 행위와 관련하여 ITFF에 대하여 손해배상 의무를 집니다.</li>			
									</ol>		
								</ol>
							</li>
						</ol>
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제7조 (회원 ITFF디와 비밀번호 관리에 대한 의무와 책임)</dt>		
					<dd>			
						<ol>				
							<li>1. ITFF는 홈페이지 내에서 일부 서비스 신청 시 결제와 관련되어있으므로 회원은 ITFF디 및 비밀번호 관리를 철저히 하여야 합니다. </li>				
							<li>2. 회원 ITFF디와 비밀번호의 관리 소홀, 부정 사용에 의하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있으며, ITFF의 시스템 고장 등 ITFF의 책임 있는 사유로 발생하는 문제에 대해서는 ITFF가 책임을 집니다.</li>				
							<li>3. 회원은 본인의 ITFF디 및 비밀번호를 제3자에게 이용하게 해서는 안되며, 회원 본인의 ITFF디 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지하는 경우에는 바로 ITFF에 통보하고 ITFF의 안내가 있는 경우 그에 따라야 합니다.</li>				
							<li>4. 회원의 아이디는 ITFF의 사전 동의 없이 변경할 수 없습니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제8조 (회원에 대한 통지)</dt>		
					<dd>			
						<ol>				
							<li>1. 회원에 대한 통지를 하는 경우 ITFF는 회원이 등록한 전자우편 주소 또는 SMS 등으로 할 수 있습니다.</li>				
							<li>2. ITFF는 불특정 다수 회원에 대한 통지의 경우 뉴스레터 발송, 팝업, 게시판 등에 게시함으로써 개별 통지를 대신할 수 있습니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<strong style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 13pt;">제3장 서비스 이용 계약</strong>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제9조</dt>		
					<dd>			
						<ol>				
							<li>1. "위의 이용 약관에 동의하십니까?"라는 이용 신청 시의 물음에 이용자가 "동의함" 버튼을 누르면 약관에 동의하는 것으로 간주됩니다.</li>				
							<li>2. 이용 계약은 이용자의 이용 신청에 대하여 ITFF가 승낙함으로써 성립합니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제10조 (이용 신청)</dt>		
					<dd>이용자는 서비스가 정한 가입 양식에 따라 회원 정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 이용 신청을 합니다.</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제11조 (이용 신청의 승낙)</dt>		
					<dd>			
						<ol>				
							<li>1. ITFF는 제10조와 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.					
								<ol>					
									<li>① 기술 상 서비스 제공이 불가능한 경우</li>					
									<li>② 실명이 아니거나, 다른 사람의 명의 사용 등 이용 신청 시 허위로 신청한 경우</li>					
									<li>③ 이용자 등록 사항을 누락하거나 오기하여 신청하는 경우</li>					
									<li>④ 사회의 질서 또는 미풍양속을 저해하거나, 저해할 목적으로 신청한 경우</li>					
									<li>⑤ ITFF가 정한 이용신청 요건이 미비 되었을 경우</li>					
									<li>⑥ 기타 ITFF가 필요하다고 인정되는 경우</li>					
								</ol>				
							</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제12조 (회원 정보의 변경)</dt>		
					<dd>회원은 서비스 이용 신청 시 기재한 사항이 변경되었을 경우에는 ITFF가 정한 별도의 이용 방법으로 정해진 양식 및 방법에 의하여 지체 없이 온라인으로 수정을 하여야 하며, 변경 및 통지 불이행으로 인하여 발생한 불이익에 대해서는 회원의 책임으로 합니다.</dd>	
				</dl>		
				<strong style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 13pt;">제4장 서비스의 이용</strong>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제13조 (서비스의 이용 개시)</dt>		
					<dd>			
						<ol>			
							<li>1. ITFF는 회원의 이용 신청을 승낙한 때부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시합니다. </li>			
							<li>2. ITFF의 업무상 또는 기술상의 문제로 인하여 서비스를 개시하지 못하는 경우에는 홈페이지에 공시하거나 회원에게 이를 통지합니다. </li>			
						</ol>		
					</dd>	
				</dl>	
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제14조 (서비스의 이용 시간)</dt>		
					<dd>			
						<ol>				
							<li>1. 서비스의 이용은 연중 무휴 1일 24시간을 원칙으로 합니다. 다만, ITFF의 업무상이나 기술상의 이유로 서비스가 일시 중지될 수 있고, 또한 운영상의 목적으로 ITFF가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이러한 경우 ITFF는 사전 또는 사후에 이를 공지합니다.</li>				
							<li>2. ITFF는 서비스를 일정 범위로 분할하여 각 범위 별로 이용 가능한 시간을 정할 수 있으며 이 경우 그 내용을 공지합니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제15조 (서비스의 변경 및 중지)</dt>		
					<dd>			
						<ol>				
							<li>1. ITFF는 수시로 서비스의 향상을 위하여 기존 서비스의 전부 또는 일부 내용을 별도의 통지 없이 변경할 수 있습니다.</li>				
							<li>2. ITFF는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.				
								<ol>				
									<li>① 서비스용 설비의 보수 등 공사로 인한 부득이한 경우</li>				
									<li>② 회원이 ITFF의 서비스 운영을 방해하는 경우</li>				
									<li>③ 정전, 제반 설비의 문제 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</li>				
									<li>④ 기타 천재지변, 국가 비상사태 등 불가항력적 사유가 있는 경우</li>				
								</ol>				
							</li>				
							<li>3. ITFF는 서비스의 변경, 중지로 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제16조 (정보의 제공 및 광고의 게재)</dt>		
					<dd>			
						<ol>				
							<li>1. ITFF는 서비스를 운영함에 있어 각종 정보를 화면에 게재하거나 전자 우편 및 서신 우편 등의 방법으로 회원에게 제공할 수 있습니다.</li>				
							<li>2. ITFF는 서비스의 운영과 관련하여 서비스 화면, 뉴스레터, SMS, 전자우편 등에 광고 등을 게재할 수 있습니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제17조 (게시물 또는 내용물의 삭제)</dt>		
					<dd>ITFF는 회원이 게시하거나 전달하는 서비스 내의 모든 내용물(회원간 전달 포함)이 다음의 경우에 해당한다고 판단되는 경우 사전 통지 없이 삭제할 수 있으며, 이에 대해 ITFF는 어떠한 책임도 지지 않습니다.			
						<ol>				
							<li>① ITFF, 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우</li>				
							<li>② 공공 질서 및 미풍양속에 위반되는 경우</li>				
							<li>③ 범죄적 행위에 결부된다고 인정되는 내용인 경우</li>				
							<li>④ ITFF, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>				
							<li>⑤ 불건전한 자료를 홍보할 경우</li>				
							<li>⑥ 게시판의 성격과 맞지 않는 게시물인 경우</li>				
							<li>⑦ 기타 관계 법령 및 ITFF의 지침에 위반된다고 판단되는 경우</li>				
							<li>⑧ ITFF는 게시물에 관련된 세부 이용 지침을 별도로 정하여 시행할 수 있으며, 회원은 그 지침에 따라 각종 게시물(회원간 전달 포함)을 등록하거나 삭제하여야 합니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제18조 (게시물의 저작권 및 소유권)</dt>		
					<dd>서비스에 게재된 모든 자료(회원간 전달 포함)에 대한 권리는 다음과 같습니다.			
						<ol>				
							<li>
								① 게시물에 대한 권리와 책임은 게시자에게 있으며 ITFF는 게시자의 동의 없이 이를 서비스 내 게재 이외에 영리적 목적으로 사용할 수 없습니다.
								<br>
								단, 비영리 목적인 경우에는 그러하지 아니하며 ITFF는 타 서비스 내 게재권을 갖습니다.</li>				
							<li>② 회원은 서비스를 이용하여 얻은 정보를 가공·판매하는 행위 등 서비스에 게재된 자료를 영리 목적으로 이용하거나 제3자에게 이용하게 할 수 없으며, 게시물에 대한 저작권 침해는 관계 법령의 적용을 받습니다.</li>			
						</ol>		
					</dd>	
				</dl>			
				<strong style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 13pt;">제5장 계약 해지 및 이용 제한</strong>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제19조 (계약 해지 및 이용 제한)</dt>		
					<dd>서비스에 게재된 모든 자료(회원간 전달 포함)에 대한 권리는 다음과 같습니다.			
						<ol>				
							<li>1. 회원이 서비스 이용 계약을 해지하고자 할 경우에는 회원 본인이 홈페이지에서 또는 ITFF가 정한 별도의 방법으로 ITFF에 해지 신청을 하여야 합니다.</li>				
							<li>2. ITFF 회원이 제6조에 규정한 회원의 의무를 이행하지 않을 경우 사전 통지 없이 이용 계약을 해지하거나 서비스 이용을 중지할 수 있습니다.</li>				
							<li>3. ITFF는 회원이 이용 계약을 체결하여 아이디와 비밀번호를 부여 받은 후에라도 회원의 자격에 따른 서비스 이용을 제한할 수 있습니다.</li>				
							<li>4. ITFF는 회원 가입 후 어느 정도의 기간 동안 사용 이력이 없는 회원에 대해 사용 의사를 묻는 고지를 하고, ITFF가 정한 기한 내에 답변이 없는 경우 이용 계약을 해지할 수 있습니다.</li>				
							<li>5. ITFF는 회원이 다음 사항에 해당하는 행위를 하였을 경우 사전 동의 없이 이용 계약을 해지하거나 기간을 정하여 서비스 이용을 중지할 수 있습니다.				
								<ol>				
									<li>① 타인의 이름, 아이디 및 비밀번호를 도용한 경우</li>				
									<li>② 서비스 운영을 고의로 방해한 경우</li>				
									<li>③ 가입한 이름이 실명이 아닌 경우</li>				
									<li>④ 같은 사용자가 다른 이름으로 이중 등록을 한 경우</li>				
									<li>⑤ 공공질서 및 미풍양속에 위반되는 내용을 고의로 유포시킨 경우</li>				
									<li>⑥ 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우</li>				
									<li>⑦ 제3자의 지적재산권을 침해하는 경우</li>				
									<li>⑧ 서비스 이용을 통해 얻은 정보를 ITFF의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우</li>				
									<li>⑨ 기타 ITFF가 정한 이용 조건에 위반되는 경우</li>				
								</ol>				
							</li>				
							<li>6. 본 조 제2항 및 제3항의 ITFF의 조치에 대하여 회원은 ITFF가 정한 절차에 따라 이의 신청을 할 수 있습니다.</li>				
							<li>7. 본 조 제6항에 의한 이의가 정당하다고 ITFF가 인정하는 경우, ITFF는 즉시 서비스의 이용을 재개합니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제20조 (양도 금지)</dt>		
					<dd>회원은 서비스의 이용 권한, 기타 이용 계약 상 지위를 타인에게 양도, 증여할 수 없으며 게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.</dd>	
				</dl>		
				<strong style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 13pt;">제6장 손해배상 등</strong>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제21조 (손해배상)</dt>		
					<dd>			
						<ol>			
							<li>1. ITFF는 서비스 이용과 관련하여 무료 서비스의 경우에 한해 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다.</li>			
							<li>2. 회원이 본 약관을 위반함으로 인하여 ITFF에 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 ITFF에 발생하는 모든 손해를 배상하여야 합니다.</li>			
							<li>3. 회원이 서비스를 이용함에 있어 행한 불법 행위나 본 약관 위반 행위로 인하여 ITFF가 당해 회원 이외의 제3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의 제기를 받는 경우 당해 회원은 자신의 책임과 비용으로 ITFF를 면책 시켜야 하며, ITFF가 면책되지 못한 경우 당해 회원은 그로 인하여 ITFF에 발생한 모든 손해를 배상하여야 합니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제22조 (면책 사항)</dt>		
					<dd>			
						<ol>				
							<li>1. ITFF는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우나 이용자의 귀책사유로 인한 문제에 관한 책임을 지지 않습니다.</li>				
							<li>2. ITFF는 이용자가 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그 밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.</li>				
							<li>3. ITFF는 이용자가 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.</li>			
						</ol>		
					</dd>	
				</dl>			
				<dl style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 9pt;">		
					<dt>제23조 (관할 법원)</dt>		
					<dd>			
						<ol>				
							<li>1. 서비스 이용과 관련하여 ITFF와 회원 사이에 분쟁이 발생한 경우, 쌍방간에 분쟁의 해결을 위해 성실히 협의한 후가 아니면 제소할 수 없습니다.</li>				
							<li>2. 본 조 제1항의 협의에서도 분쟁이 해결되지 않을 경우 양 당사자는 민사 소송법상의 관할 법원에 소를 제기할 수 있습니다.</li>			
						</ol>		
					</dd>	
				</dl>		
				<strong style="color: rgb(0, 0, 0); font-family: 굴림; font-size: 13pt;">부 칙 (시행일)</strong>
				<font face="굴림">
					<span style="font-size: 9pt;">이 약관은 2021년 3월 11일부터 시행합니다.</span>
				</font>
				<br>
				<font face="굴림">
					<span style="font-size: 9pt;">사업자등록번호 : 000-00-00000</span>
				</font>
				<br>
				<font face="굴림"><span style="font-size: 9pt;">등록명 : (사)정보기술영화제 </span></font>
				<br>
				<font face="굴림"><span style="font-size: 9pt;">대표자 : 최형구</span></font>
				<br>
				<font face="굴림"><span style="font-size: 9pt;">주소 : </span><span style="font-size: 12px;">서울특별시 강남구 테헤란로 14길 6 남도빌딩</span></font>
			</div>
		</div>
	</div>
</div>	
	
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
