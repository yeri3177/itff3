<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/event/eventOffline.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<div class="roulette_total_con">
	<div class="inner title-area">
		<h2 class="hidden">EVENT</h2>

		<h3>[관객 이벤트] SF 키워드로 컨셉친(concept+親)하라!</h3>

		<div class="btns">
			<span class="txt-date">2021.1.7 ~ 2022.1.14</span>
		</div>
	</div>
	
	<div class="total_concon">

	<div
		class="fusion-fullwidth fullwidth-box mt50 nonhundred-percent-fullwidth non-hundred-percent-height-scrolling"
		style="background-color: rgba(255, 255, 255, 0); background-position: center center; background-repeat: no-repeat; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;">
		<div class="fusion-builder-row fusion-row ">
			<div
				class="fusion-layout-column fusion_builder_column fusion_builder_column_1_1 fusion-builder-column-2 fusion-one-full fusion-column-first fusion-column-last text-center 1_1"
				style="margin-top: 0px; margin-bottom: 0px;">
				<div class="fusion-column-wrapper"
					style="padding: 0px; background-position: left top; background-repeat: no-repeat; background-size: cover; height: auto;"
					data-bg-url="">
					<div class="fusion-text"></div>
					<div class="text-left" style="padding-top: 60px;">
						<h3>
							SF 키워드로 컨셉친<span class="notosans">(concept+親)</span>하라!
						</h3>

						<h5 class="mt30" style="">#정보기술영화제 #찐친 #인증미션 #십자말풀이 퀴즈 #굿즈</h5>
						<br>
						<br>
						<p class="con_tt">기획의도</p>
						<p class="mt30">
							정보기술영화제가 국내 유일의 IT 영화제로 거듭나고 있는 중이다. <br>
							SF 장르는 미지의 세계인 동시에 확장하면 할수록 무궁무진한 세계관이 쏟아져 나올 만큼 흥미로운 장르이기도 하다. <br>
							익숙한 장르 같지만 알면 알수록 낯설기도 한 SF 장르, 매주 키워드 하나씩 알아가다 보면 언젠가는 SF 장르를 완전
							정복할 수 있지 않을까!<br> 그런 바람으로 마련한 ‘SF 키워드로 컨셉친하라!’는 정보기술영화제 SNS를
							꾸준히 구독한 팔로워(찐친)들이라면 누구나 맞힐 수 있는 십자말풀이 퀴즈 이벤트이다.
						</p>
						<br>
						<br>
					</div>
					<div class="fusion-clearfix"></div>

				</div>
			</div>
		</div>
	</div>

	<div class="text-left" style="padding-top: 60px; margin-left: 50px;">
		<p class="con_tt">
			운영방식: <span class="black">#SF 키워드 완전정복하기! </span> 
		</p>
		<br>
		<div class="event-table4">
			<table>
				<tbody>
					<tr>
						<td class="tl">1</td>
						<td>스페이스 오페라 (space opera)</td>
						<td class="tl">16</td>
						<td>로봇 (robot)</td>
					</tr>
					<tr>
						<td class="tl">2</td>
						<td>타임리프, 타임워프, 타임슬립, 타임루프</td>
						<td class="tl">17</td>
						<td>안드로이드 (Android)</td>
					</tr>
					<tr>
						<td class="tl">3</td>
						<td>사이버펑크 (cyberpunk)</td>
						<td class="tl">18</td>
						<td>사이보그 (cyborg)</td>
					</tr>
					<tr>
						<td class="tl">4</td>
						<td>클라이파이 Cli-Fi(Climate Fiction)</td>
						<td class="tl">19</td>
						<td>휴머노이드 (humanoid)</td>
					</tr>
					<tr>
						<td class="tl">5</td>
						<td>사이버스톰 (cyberstorm)</td>
						<td class="tl">20</td>
						<td>A.I (Artificial Intelligence)</td>
					</tr>
					<tr>
						<td class="tl">6</td>
						<td>메타버스 (Metaverse)</td>
						<td class="tl">21</td>
						<td>외계인 (Alien)</td>
					</tr>
					<tr>
						<td class="tl">7</td>
						<td>세티 (CETI)</td>
						<td class="tl">22</td>
						<td>UFO (Unidentified Flying Object)</td>
					</tr>
					<tr>
						<td class="tl">8</td>
						<td>웜홀 (Wormhole)</td>
						<td class="tl">23</td>
						<td>화성 (Mars)</td>
					</tr>
					<tr>
						<td class="tl">9</td>
						<td>트랜스휴먼 (Transhuman)</td>
						<td class="tl">24</td>
						<td>특이점 (singularity)</td>
					</tr>
					<tr>
						<td class="tl">10</td>
						<td>바이오해커 (Biohacker)</td>
						<td class="tl">25</td>
						<td>알고리즘 (algorithm)</td>
					</tr>
					<tr>
						<td class="tl">11</td>
						<td>마인드 업로딩 (mind uploading)</td>
						<td class="tl">26</td>
						<td>라이프로깅 (Lifelogging)</td>
					</tr>
					<tr>
						<td class="tl">12</td>
						<td>포스트 아포칼립스 (Post-Apocalypse)</td>
						<td class="tl">27</td>
						<td>VR (Virtual Reality)</td>
					</tr>
					<tr>
						<td class="tl">13</td>
						<td>레트로 퓨처리즘 (Retro-futurism)</td>
						<td class="tl">28</td>
						<td>AR (Augmented Reality)</td>
					</tr>
					<tr>
						<td class="tl">14</td>
						<td>스팀펑크 (steampunk)</td>
						<td class="tl">29</td>
						<td>미러월드 (Mirror World)</td>
					</tr>
					<tr>
						<td class="tl">15</td>
						<td>밈 (meme)</td>
						<td class="tl">30</td>
						<td>SF (science fiction)</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div
		class="fusion-fullwidth fullwidth-box mt50 nonhundred-percent-fullwidth non-hundred-percent-height-scrolling"
		style="background-color: rgba(255, 255, 255, 0); background-position: center center; background-repeat: no-repeat; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;">
		<div class="fusion-builder-row fusion-row ">
			<div
				class="fusion-layout-column fusion_builder_column fusion_builder_column_2_3 fusion-builder-column-7 fusion-two-third fusion-column-first text-center 2_3"
				style="margin-top: 0px; margin-bottom: 0px; width: 66.66%; width: calc(66.66% - ( ( 4%)* 0.6666)); margin-right: 4%;">
				<div class="fusion-column-wrapper"
					style="padding: 0px; background-position: left top; background-repeat: no-repeat; background-size: cover; height: auto;"
					data-bg-url="">
					<div class="fusion-text"></div>
					<div class="text-left" style="padding-top: 60px;">
						<p class="con_tt">참여방식</p>
						<p class="mt30">
							<span class="mint-span">STEP 1.</span> 관객들은 정보기술영화제에 와서 프로그램북을 꼭
							받아간다. <br> <span class="mint-span">STEP 2.</span> 십자말풀이가 실린
							페이지의 공란에 정답을 하나씩 채워 넣는다.<br> <span class="mint-span">STEP
								3.</span> 알쏭달쏭 정답이 헛갈릴 땐 정보기술영화제 SNS (@2022itff) 팔로잉하고 커닝하기! <br>
							<span class="mint-span">STEP 4.</span> 십자말풀이를 다 채운 후 정보기술영화제 사무국에
							제시 <br> <span class="mint-span">STEP 5.</span> 정답을 다 맞힌
							관객들에게 굿즈 증정
						</p>
					</div>
					<br>
					<br>
					<div class="fusion-clearfix"></div>

				</div>
			</div>
			<div
				class="fusion-layout-column fusion_builder_column fusion_builder_column_1_3 fusion-builder-column-8 fusion-one-third fusion-column-last text-center 1_3"
				style="margin-top: 0px; margin-bottom: 0px; width: 33.33%; width: calc(33.33% - ( ( 4%)* 0.3333));">
				<div class="fusion-column-wrapper"
					style="padding: 0px; background-position: left top; background-repeat: no-repeat; background-size: cover; height: auto;"
					data-bg-url="">
					<br>
					<br>
					<span
						class="fusion-imageframe imageframe-none imageframe-4 hover-type-none">
							<img loading="lazy"
							src="http://ciff.kr/wp-content/uploads/2021/09/event-sheet-1024x788.jpg"
							width="1024" height="788" alt=""
							class="img-responsive wp-image-5488"
							style="width: 400px; height: 400px;"
							srcset="http://ciff.kr/wp-content/uploads/2021/09/event-sheet-200x154.jpg 200w, http://ciff.kr/wp-content/uploads/2021/09/event-sheet-400x308.jpg 400w, http://ciff.kr/wp-content/uploads/2021/09/event-sheet-600x462.jpg 600w, http://ciff.kr/wp-content/uploads/2021/09/event-sheet-800x616.jpg 800w, http://ciff.kr/wp-content/uploads/2021/09/event-sheet-1200x924.jpg 1200w, http://ciff.kr/wp-content/uploads/2021/09/event-sheet.jpg 1500w"
							>
					</a></span>
					<div class="fusion-clearfix"></div>

				</div>
			</div>
		</div>
	</div>

	<div
		class="fusion-fullwidth fullwidth-box mt50 nonhundred-percent-fullwidth non-hundred-percent-height-scrolling"
		style="background-color: rgba(255, 255, 255, 0); background-position: center center; background-repeat: no-repeat; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px;">
		<div class="fusion-builder-row fusion-row ">
			<div
				class="fusion-layout-column fusion_builder_column fusion_builder_column_1_1 fusion-builder-column-9 fusion-one-full fusion-column-first fusion-column-last text-center 1_1"
				style="margin-top: 0px; margin-bottom: 0px;">
				<div class="fusion-column-wrapper"
					style="padding: 0px; background-position: left top; background-repeat: no-repeat; background-size: cover; height: auto;"
					data-bg-url="">
					<div class="fusion-text"></div>
					<div class="text-left" style="">
						<p class="con_tt">기대효과</p>
						<br>
						<div class="info-list">
							<ul>
								<li>SF 장르를 하나씩 알아가는 재미</li>
								<li>영화제를 적극적으로 참여할 수 있도록 유도</li>
								<li>영화제의 지속적인 홍보물 업데이트는 팔로워들이 정보기술영화제에</li>
								<li>꾸준하게 관심을 가질 수 있도록 하는데 큰 도움이 된다. (실제 팔로워수 증가)</li>
							</ul>
						</div>
					</div>
					<br>
					<br>
					<div class="fusion-clearfix"></div>

				</div>
			</div>
		</div>
	</div>
	</div>

	<div class="btnbbs">
		<a class="btn medium"
			onclick="location.href='${pageContext.request.contextPath}/event/eventMenu.do';">목록보기</a>
	</div>

</div>
</div>


<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>