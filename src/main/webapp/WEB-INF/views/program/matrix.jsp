<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />   <!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="프로그램" name="title"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/program/synopsis.css" />

<div id="slide">
  <input type="radio" name="pos" id="pos1" checked>
  <input type="radio" name="pos" id="pos2">
  <input type="radio" name="pos" id="pos3">
  <input type="radio" name="pos" id="pos4">
  <ul>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
  </ul>
  <p class="pos">
    <label for="pos1"></label>
    <label for="pos2"></label>
    <label for="pos3"></label>
    <label for="pos4"></label>
  </p>
</div>
<p>하이눈물난다</p>
<h1 class="tit_movie">매트릭스<span>The Matrix</span></h1>

<div class="film_info">
   <div class="container">
      <div class="film_info_top">
         <p class="director_name">
            차이다 베리로트
         </p>
         <ul class="list_film_info list-inline">
            <li>핀란드, 스웨덴</li>
            <li>2020</li>
            <li>100min</li>
            <li>15 +</li>
            <li>color</li>
         </ul>

         <p class="">
            <strong class="premiere en">Korean Premiere</strong>
         </p>
         <p class="keyword">   극영화 / 전기영화 / 퀴어 / 무민    </p>
         <p class="keyword hide">         
            <!--<span>극영화 / 전기영화 / 퀴어 / 무민</span>-->
            <span class="nopz" data-tooltip-text="">
               <img src="/kor/img/kwi/극영화 / 전기영화 / 퀴어 / 무민.png" alt="극영화 / 전기영화 / 퀴어 / 무민" style="width:45px;">
            </span> &nbsp;
         </p>
      </div>
      <div class="synopsis">
         <h4>SYNOPSIS</h4>
         <div class="desc">
         핀란드의 퀴어 예술가 토베 얀손에 대한 전기 영화. 토베는 화가로서 자신을 지지해 주지 않는 아버지와 갈등을 겪지만, 2차 세계 대전 도중 방공호에서 창작한 무민 캐릭터로 점차 명성을 쌓아간다. 한편, 연극 연출가 비비카 반들레르와의 만남과 관계는 토베의 삶과 예술에 중요한 영향을 가져 온다. 
         </div>
      </div>

      <div id="pg_note" class="pg_note">
         <h4>PROGRAM NOTE</h4>
         <div class="desc">
            <p>&lt;토베 얀손&gt;은 ‘무민’ 시리즈의 창조자, 퀴어 예술가 토베 얀손의 2차 세계 대전의 막바지 시기부터 10여 년간 삶을 그리고 있다. 관객들이 가장 처음 보게 되는 것은 춤을 추듯 몽환적으로 또는 격렬하게 몸을 움직이는 토베의 모습이다. 그리고 곧 2차 세계 대전 한가운데 방공호에서 무민 캐릭터의 원형을 스케치하는 토베의 모습이 이어진다. 무민 시리즈의 탄생과 성공에 안착하기까지 토베 얀손의 작가적 경력이 영화의 원경이라면, 전경에는 여성 퀴어 예술가 토베 개인이 맺는 개인적 관계들과 그로 인한 불안과 긴장, 자아의 발견과 성장, 자유와 독립에 대한 갈망, 그리고 이 모든 것을 통과하며 발산되는 토베의 에너지와 얼굴 표정이 내세워진다. 거의 항상 인물에 가까이 다가가 있으며 시종일관 미세하게 흔들리고 있는 카메라는 이러한 영화적 구조를 뒷받침하며, 아버지와의 갈등, 비비카 반들레르와의 연애, 평생의 파트너 툴리키 피에틸레와의 만남이 어떻게 토베의 작품 세계에 불가분의 영감을 주는지 보여 준다. 린다 바스베리의 16mm 촬영은 투박함과 온화함을 동시에 전달하며, 영화의 엔딩에 삽입된 8mm 푸티지는 영화 내내 토베가 보여 준 자유로운 움직임과 활력, 생동감의 원천을 확인시켜 준다. [황미요조]&nbsp;</p>
         </div>
      </div>
   </div>
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

   