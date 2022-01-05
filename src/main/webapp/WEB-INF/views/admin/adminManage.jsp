    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 사용자 설정 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminManage.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminTodo.css" />

		<div class="container-fluid container-main">

			<section id="content" class="content">
			
			<!-- 관리자 공통 메뉴 -->
			<jsp:include page="/WEB-INF/views/admin/common/adminSectionHeader.jsp"></jsp:include>

				<div class="row">
					<div class="col-md-12">
						<main>
							<div class="row-fluid">
								<div id="gridbox-container">
									<div id="gridbox-content">
										
										<!-- 관리자 공통 메뉴 -->
										<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

										<div class="ba-main-view">
										
										<!-- 카운트 부분 -->
										<section class="py-5">
									        <div class="container-fluid">
									          <div class="row">									        
									            
									            <!-- Count item widget-->
									            <div class="col-xl-2 col-md-4 col-6 gy-4 gy-xl-0">
									              <div class="d-flex">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-ticket-perforated" viewBox="0 0 16 16">
													  <path d="M4 4.85v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Zm-7 1.8v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Zm-7 1.8v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Zm-7 1.8v.9h1v-.9H4Zm7 0v.9h1v-.9h-1Z"/>
													  <path d="M1.5 3A1.5 1.5 0 0 0 0 4.5V6a.5.5 0 0 0 .5.5 1.5 1.5 0 1 1 0 3 .5.5 0 0 0-.5.5v1.5A1.5 1.5 0 0 0 1.5 13h13a1.5 1.5 0 0 0 1.5-1.5V10a.5.5 0 0 0-.5-.5 1.5 1.5 0 0 1 0-3A.5.5 0 0 0 16 6V4.5A1.5 1.5 0 0 0 14.5 3h-13ZM1 4.5a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v1.05a2.5 2.5 0 0 0 0 4.9v1.05a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-1.05a2.5 2.5 0 0 0 0-4.9V4.5Z"/>
													</svg>
									                <div class="ms-2">
									                  <h3 class="h4 text-dark text-uppercase fw-normal">예매</h3>
									                  <p class="text-gray-500 small">Today</p>
									                  <p class="display-6 mb-0">342</p>
									                </div>
									              </div>
									            </div>
									            
        									    <!-- screening-->
									            <div class="col-xl-2 col-md-4 col-6 gy-4 gy-xl-0">
									              <div class="d-flex">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-projector" viewBox="0 0 16 16">
													  <path d="M14 7.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0ZM2.5 6a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4Zm0 2a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4Z"/>
													  <path fill-rule="evenodd" d="M0 6a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2 1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1H5a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1 2 2 0 0 1-2-2V6Zm2-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1Z"/>
													</svg>
									                <div class="ms-2" id="screening">
									                
									                </div>
									              </div>
									            </div>
									            
									            <!-- Count item widget-->
									            <div class="col-xl-2 col-md-4 col-6 gy-4 gy-xl-0">
									              <div class="d-flex">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
													  <path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
													  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
													</svg>
									                <div class="ms-2">
									                  <h3 class="h4 text-dark text-uppercase fw-normal">주문</h3>
									                  <p class="text-gray-500 small">Today</p>
									                  <p class="display-6 mb-0">400</p>
									                </div>
									              </div>
									            </div>	
									            
									            <!-- register -->
									            <div class="col-xl-2 col-md-4 col-6 gy-4 gy-xl-0">
									              <div class="d-flex">
									                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
													  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
													</svg>
									                <div class="ms-2" id="register">
		
									                 
									                </div>
									              </div>
									            </div>								         									           
									            
									            <!-- question-->
									            <div class="col-xl-2 col-md-4 col-6 gy-4 gy-xl-0">
									              <div class="d-flex">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
													  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
													  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
													</svg>
									                <div class="ms-2" id="qa">
		
									                </div>
									              </div>
									            </div>
									            
									            <!-- review-->
									            <div class="col-xl-2 col-md-4 col-6 gy-4 gy-xl-0">
									              <div class="d-flex">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-blockquote-left" viewBox="0 0 16 16">
													  <path d="M2.5 3a.5.5 0 0 0 0 1h11a.5.5 0 0 0 0-1h-11zm5 3a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1h-6zm0 3a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1h-6zm-5 3a.5.5 0 0 0 0 1h11a.5.5 0 0 0 0-1h-11zm.79-5.373c.112-.078.26-.17.444-.275L3.524 6c-.122.074-.272.17-.452.287-.18.117-.35.26-.51.428a2.425 2.425 0 0 0-.398.562c-.11.207-.164.438-.164.692 0 .36.072.65.217.873.144.219.385.328.72.328.215 0 .383-.07.504-.211a.697.697 0 0 0 .188-.463c0-.23-.07-.404-.211-.521-.137-.121-.326-.182-.568-.182h-.282c.024-.203.065-.37.123-.498a1.38 1.38 0 0 1 .252-.37 1.94 1.94 0 0 1 .346-.298zm2.167 0c.113-.078.262-.17.445-.275L5.692 6c-.122.074-.272.17-.452.287-.18.117-.35.26-.51.428a2.425 2.425 0 0 0-.398.562c-.11.207-.164.438-.164.692 0 .36.072.65.217.873.144.219.385.328.72.328.215 0 .383-.07.504-.211a.697.697 0 0 0 .188-.463c0-.23-.07-.404-.211-.521-.137-.121-.326-.182-.568-.182h-.282a1.75 1.75 0 0 1 .118-.492c.058-.13.144-.254.257-.375a1.94 1.94 0 0 1 .346-.3z"/>
													</svg>
									                <div class="ms-2" id="review_count">
		
									                </div>
									              </div>
									            </div>
									            
									          </div>
									        </div>
									      </section>
										<!-- 카운트 부분 끝 -->
											
										<div class="row-fluid">
											<div class="span12 ba-store-statistic" style="box-shadow: none; padding: 30px 0 30px 0;">


											<div class="ba-store-statistic-body">
												<div class="row-fluid ba-store-statistic-body-wrapper"">

													<div class="header">
													</div>
													<div class="five">

													  <div class="flex-container">
													  
													  <!-- todo -->
														<div class="app" id="app" style="display: none;">
															<form class="form" v-on:submit="addTodo">
																<input class="input form__input" v-model="inputVal" />
																<button class="btn form__submit-btn" type="submit">Add</button>
															</form>
															<transition-group tag="ol" name="list" class="todo-list">
															<li class="todo-list__item"
																v-bind:class="{ complete: todo.complete }"
																v-bind:key="index"
																v-for="(todo, index) in filteredTodos">
																<button class="todo-list__item-content"
																	v-on:click="toggleTodo(todo)">{{ todo.text }}
																</button>
																<button class="btn todo-list__item-remove"
																	v-on:click="deleteTodo(index)">
																	<i class="fa"
																		v-bind:class="[todo.complete ? 'fa-check' : 'fa-times']"></i>
																</button>
															</li>
															</transition-group>
															<div class="filters">
																<button class="btn filters__btn filters__btn--all"
																	v-on:click="filterTodos('all')">All</button>
																<button class="btn filters__btn filters__btn--complete"
																	v-on:click="filterTodos('complete')">
																	Complete</button>
																<button
																	class="btn filters__btn filters__btn--incomplete"
																	v-on:click="filterTodos('incomplete')">
																	Incomplete</button>
															</div>
														</div>

														<!-- 차트 -->
													    <div class="flex__third h56 row1">
													      <div class="high chart1"></div>
													    </div>
													    <div class="flex__one h56 row1">
													      <div class="high chart2"></div>
													    </div>
													    <!-- 차트 끝 -->
													    
													  </div>
													</div>

												</div>
											</div>
											</div>
										</div>
										
											<div class="main-table dashboard-content">		
												<div class="row-fluid"
													style="display: flex; flex-direction: row;">
													<div class="span8 last-edit-pages">
														<table class="table table-striped">
															<thead>
																<tr>
																	<th style="width: 380px;"><span> 예매 </span></th>
																</tr>
															</thead>
															<tbody>
																
															</tbody>
														</table>
													</div>
													
												<!-- Recently registered -->
												<div class="span4 recent-gridbox-apps" style="width: 856px;">
													<table class="table table-striped">
														<thead>
															<tr class="goods_table_tr">
																<th class="refresh_th">
																	<span> 주문/클레임 </span>
																	<img class="refresh" src="https://i.imgur.com/W76W3sP.png" alt="" onclick="refreshPage()"/>
																</th>
																<th style="padding: 15px 0 15px 9px;">
																	<div class="border-list-wrap col-md-6 col-sm-6 col-xs-12" id="goods_count">

																	</div>
																</th>
															</tr>
														</thead>
														<tbody class="half_table" id="goods_list">
															

														</tbody>
														</table>

													</div>
												</div>
												
												<div class="row-fluid"
													style="display: flex; flex-direction: row; margin-top: 30px; justify-content: space-around;">
													<div class="span4 recent-gridbox-files">
														<table class="table table-striped">
															<thead>
																<tr>
																	<th colspan="2">
																	<span> 가입 현황 </span>
																	<span class="text-muted sub-text">최근 1주일 기준</span>
																	</th>
																	<th>
																	<img class="refresh" src="https://i.imgur.com/W76W3sP.png" alt="" onclick="refreshPage()"/>
																	</th>
																</tr>
															</thead>
															<tbody id="recent_registers">

															</tbody>
														</table>

													</div>
													<div class="span4 recent-gridbox-comments">
														<table class="table table-striped">
															<thead>
																<tr>
																	<th>
																	<span>미답변 문의</span>
																	</th>
																	<th>
																	<img class="refresh" src="https://i.imgur.com/W76W3sP.png" alt="" onclick="refreshPage()"/>
																	</th>
																</tr>
															</thead>
															<tbody id="question">

															</tbody>
														</table>

													</div>
													<div class="span4 recent-gridbox-reviews">
														<table class="table table-striped">
															<thead>
																<tr>
																	<th>
																	<span>리뷰</span>
																	<span class="text-muted sub-text">최근 1주일 기준</span>
																	</th>
																	<th>
																	<img class="refresh" src="https://i.imgur.com/W76W3sP.png" alt="" onclick="refreshPage()"/>
																	</th>
																</tr>
															</thead>
															<tbody id="review">
															
																
																
																
															</tbody>
														</table>
													</div>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>

						

		<!-- //container -->

<script>

// 굿즈 판매중 상품 수
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminSaleGoodsCount.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#goods_count").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 굿즈 최근 10개
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/selectRecentTenGoodsList.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#goods_list").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 최근 일주일 가입
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminManageRegisterAweekAgoCount.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#register").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 오늘 상영
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminManageTodayScreeningCount.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#screening").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 최근 가입 10명
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminManageRecentTenRegisterList.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#recent_registers").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 문의 최근 10개
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminManageRecentTenQuestionList.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#question").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 리뷰 최근 10개
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminManageRecentTenReviewList.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#review").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 오늘 리뷰
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminManageTodayReviewCount.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#review_count").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

// 오늘 문의
$(document).ready(function () {
	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminManageTodayQuestionCount.do",
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#qa").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

</script>

<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>

<script>

$( ".getfive" ).on( "click", function() {
	  $( ".five" ).show();
	  $( ".four" ).hide();
	});
	$( ".getfour" ).on( "click", function() {
	  $( ".four" ).show();
	  $( ".five" ).hide();
	});
	
	$(function () {
	    $('.chart1').highcharts({
	    colors: ['#29b1bf', '#ec7b65'],
	    chart: {
	      zoomType: 'xy'
	    },
	    credits: {
	      enabled: false
	    },
	    title: {
	      text: '날짜별 통계',
	      align: 'left',
	      margin: 50
	    },
	    subtitle: {
	      text: '',
	      align: 'left',
	      y: 50
	    },
	    xAxis: [{
	      categories: ['1/7', '1/8', '1/9', '1/10', '1/11', '1/12',
	        '1/13', '1/14'
	      ],
	      crosshair: true
	    }],
	    yAxis: [{ // Primary yAxis
	      labels: {
	        format: '{value}',
	          color: Highcharts.getOptions().colors[1]
	      },
	      title: {
	        text: '',
	        style: {
	          color: Highcharts.getOptions().colors[1]
	        }
	      }
	    }, { // Secondary yAxis
	      title: {
	        text: '',
	        style: {
	          color: Highcharts.getOptions().colors[0]
	        }
	      },
	      labels: {
	        format: '{value}',
	        style: {
	          color: Highcharts.getOptions().colors[0]
	        }
	      },
	      opposite: true
	    }],
	    tooltip: {
	      shared: true
	    },
	    legend: {
	      layout: 'horizontal',
	      align: 'left',
	      x: 0,
	      verticalAlign: 'top',
	      y: 25,
	      floating: true,
	      backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
	    },
	    series: [{
	      name: '상영작예매',
	      type: 'column',
	      yAxis: 1,
	      data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5]

	    }, {
	      name: '굿즈판매',
	      type: 'spline',
	      data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5]
	    }]
	  });
	});
	
	$(function() {
	  $('.chart2').highcharts({
		colors: ['#29b1bf', '#333333', 'rgb(144, 237, 125)', '#ec7b65', 'rgb(128, 133, 233)', 'rgb(241, 92, 128)', 'rgb(228, 211, 84)'],
	    chart: {
	      type: 'bar'
	    },
	    credits: {
	      enabled: false
	    },
	    title: {
	      text: '연령별 예매 통계',
	      align: 'left',
	      margin: 50
	    },
	    xAxis: {
	      categories: ['아이, 로봇', '이글아이', '에이 아이', '패스워드', '가타카', '13층', '매트릭스', '그녀', '시티즌포', '007: 카지노 로얄', '미션 임파서블', '에린 브로코비치', '루퍼']
	    },
	    yAxis: {
	      min: 0,
	      title: {
	        text: ''
	      }
	    },
	    legend: {
	      layout: 'horizontal',
	      align: 'left',
	      x: 0,
	      verticalAlign: 'top',
	      y: 25,
	      floating: true,
	      backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
	    },
	    plotOptions: {
	      series: {
	        stacking: 'normal'
	      }
	    },
	    series: [{
	      name: '10대',
	      data: [5, 3, 4, 7, 2, 5, 6, 7, 2, 4, 1, 3, 5]
	    }, {
	      name: '20대',
	      data: [2, 2, 3, 2, 1, 2, 4, 5, 7, 2, 4, 2, 3]
	    }, {
	      name: '30대',
	      data: [3, 4, 4, 2, 5, 4, 6, 8, 2, 4, 6, 2, 2]
	    }, {
	      name: '40대',
	      data: [3, 4, 4, 2, 5, 4, 6, 8, 2, 4, 6, 2, 2]
	    }, {
	      name: '50대',
	      data: [3, 4, 4, 2, 5, 4, 6, 8, 2, 4, 6, 2, 2]
	    }, {
	      name: '60대',
	      data: [3, 4, 4, 2, 5, 4, 6, 8, 2, 4, 6, 2, 2]
	    }, {
	      name: '60대 이상',
	      data: [3, 4, 4, 2, 5, 4, 6, 8, 2, 4, 6, 2, 2]
	    }]
	  });
	});

</script>

<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script src="https://unpkg.com/vue@2.0.3/dist/vue.js"></script>

<script>

// todo
var filters = {
		  all: function(todos) {
		    return todos;
		  },
		  complete: function(todos) {
		    return todos.filter(function(todo) {
		      return todo.complete;
		    });
		  },
		  incomplete: function(todos) {
		    return todos.filter(function(todo) {
		      return !todo.complete;
		    });
		  }
		}

		var STORAGE_KEY = 'vue-js-todo-P7oZi9sL'
		var todoStorage = {
		  fetch: function () {
		    var todos = JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]');
		    return todos;
		  },
		  save: function (todos) {
		    localStorage.setItem(STORAGE_KEY, JSON.stringify(todos));
		  }
		}

		var app = new Vue({
		  el: '#app',
		  data: {
		    inputVal: '',
		    todos: todoStorage.fetch(),
		    visibility: 'all'
		  },
		  watch: {
		    todos: {
		      handler: function(todos) {
		        todoStorage.save(todos);
		      }
		    }
		  },
		  computed: {
		    filteredTodos: function () {
		      return filters[this.visibility](this.todos);
		    }
		  },
		  methods: {
		    addTodo: function(e) {
		      e.preventDefault();
		      if (this.inputVal) {
		        this.todos.push({
		          text: this.inputVal,
		          complete: false
		        });
		      }
		      this.inputVal = '';
		    },
		    toggleTodo: function(todo) {
		      todo.complete = !todo.complete;
		    },
		    filterTodos: function(filter) {
		      this.visibility = filter;
		    },
		    deleteTodo: function(index) {
		      this.todos.splice(index, 1);
		    }
		  }
		});
		
</script>

<script>
function refreshPage(){
    window.location.reload();
} 
</script>

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>
    
