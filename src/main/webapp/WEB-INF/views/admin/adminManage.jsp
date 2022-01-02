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

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminManage.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminTodo.css" />

		<div class="container-fluid container-main">
			<button
				class="navbar-toggler toggler-toolbar toggler-burger collapsed collapse show"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#subhead-container"
				aria-controls="subhead-container" aria-expanded="false"
				aria-label="Toolbar" style="">
				<span class="toggler-toolbar-icon"></span>
			</button>

			<section id="content" class="content">

				<div class="row">
					<div class="col-md-12">
						<main>
							<div class="row-fluid">
								<div id="gridbox-container">
									<div id="gridbox-content">
										
										<!-- 관리자 공통 메뉴 -->
										<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

										<div class="ba-main-view">
										
								<section class="py-5">
							        <div class="container-fluid">
							          <div class="row">
							          
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
							            
							            <!-- Count item widget-->
							            <div class="col-xl-2 col-md-4 col-6 gy-4 gy-xl-0">
							              <div class="d-flex">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
											  <path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
											  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
							                <div class="ms-2">
							                  <h3 class="h4 text-dark text-uppercase fw-normal">주문</h3>
							                  <p class="text-gray-500 small">Last 5 days</p>
							                  <p class="display-6 mb-0">400</p>
							                </div>
							              </div>
							            </div>
							            
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
							          </div>
							        </div>
							      </section>
											
										<div class="row-fluid">
											<div class="span12 ba-store-statistic" style="box-shadow: none; padding: 30px 0 30px 0;">


												<div class="ba-store-statistic-body">
													<div class="row-fluid ba-store-statistic-body-wrapper"">

														<div class="header">
														</div>
														<div class="five">

														  <div class="flex-container">
														  
														  <!-- todo -->
														  <div class="app" id="app">
														  <form class="form" v-on:submit="addTodo">
														    <input class="input form__input" v-model="inputVal"/>
														    <button class="btn form__submit-btn" type="submit">Add</button>
														  </form>
														  <transition-group tag="ol" name="list" class="todo-list">
														    <li
														      class="todo-list__item"
														      v-bind:class="{ complete: todo.complete }"
														      v-bind:key="index"
														      v-for="(todo, index) in filteredTodos">
														      <button
														        class="todo-list__item-content"
														        v-on:click="toggleTodo(todo)">
														        {{ todo.text }}
														      </button>
														      <button
														        class="btn todo-list__item-remove"
														        v-on:click="deleteTodo(index)">
														        <i class="fa" v-bind:class="[todo.complete ? 'fa-check' : 'fa-times']"></i>
														      </button>
														    </li>
														  </transition-group>
														  <div class="filters">
														    <button 
														      class="btn filters__btn filters__btn--all" 
														      v-on:click="filterTodos('all')">
														      All
														    </button>
														    <button 
														      class="btn filters__btn filters__btn--complete" 
														      v-on:click="filterTodos('complete')">
														      Complete
														    </button>
														    <button 
														      class="btn filters__btn filters__btn--incomplete" 
														      v-on:click="filterTodos('incomplete')">
														      Incomplete
														    </button>
														  </div>
														</div>
														  
														  	<!-- 차트 -->
														    <div class="flex__third h56 row1">
														      <div class="high chart1"></div>
														    </div>
														    <div class="flex__one h56 row1">
														      <div class="high chart2"></div>
														    </div>
														    
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
																	<th><span> Recently Opened </span></th>
																	<th><span> ID </span></th>
																	<th><span> Enroll Date </span></th>
																</tr>
															</thead>
															<tbody id="goods_list">
																
															</tbody>
														</table>
													</div>
													
													<!-- Recently registered -->
													<div class="span4 recent-gridbox-apps">
														<table class="table table-striped">
															<thead>
																<tr>
																	<th><span> Screening film </span></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																<td>
																<span class="recent-apps-title"> Test </span>
																</td>
															</tr>
																<tr>
																	<td>
																		<span class="recent-apps-title"> Test </span>
																	</td>
																</tr>
																<tr>
																	<td>
																		<span class="recent-apps-title"> Test </span>
																	</td>
																</tr>
																<tr>
																	<td>
																		<span class="recent-apps-title"> Test </span>
																	</td>
																</tr>
																<tr>
																	<td>
																		<span class="recent-apps-title"> Test </span>
																	</td>
																</tr>
																<tr>
																	<td>
																		<span class="recent-apps-title"> Test </span>
																	</td>
																</tr>
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
																	<th colspan="2"><span> Recent Files </span></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-4.webp </span>
																	</td>
																	<td class="filesize-td"><span> 18 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-5.webp </span>
																	</td>
																	<td class="filesize-td"><span> 13 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-2.webp </span>
																	</td>
																	<td class="filesize-td"><span> 12 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-2.webp </span>
																	</td>
																	<td class="filesize-td"><span> 25 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-4.webp </span>
																	</td>
																	<td class="filesize-td"><span> 38 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-5.webp </span>
																	</td>
																	<td class="filesize-td"><span> 27 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-2.webp </span>
																	</td>
																	<td class="filesize-td"><span> 20 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-5.webp </span>
																	</td>
																	<td class="filesize-td"><span> 21 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-4.webp </span>
																	</td>
																	<td class="filesize-td"><span> 29 KB </span></td>
																</tr>
																<tr>
																	<td class="title-td">
																		<span class="file-title"> hr-2.webp </span>
																	</td>
																	<td class="filesize-td"><span> 4 KB </span></td>
																</tr>
															</tbody>
														</table>

													</div>
													<div class="span4 recent-gridbox-comments">
														<table class="table table-striped">
															<thead>
																<tr>
																	<th><span> Recent Questions </span></th>
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
																	<th><span> Recent Reviews </span></th>
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

						<div id="deactivate-dialog" class="ba-modal-sm modal hide"
							style="display: none">
							<div class="modal-body">
								<h3>License Deactivation</h3>
								<p class="modal-text can-delete">Are you sure you want to
									deactivate the license? The site will no longer receive
									updates.</p>
							</div>
							<div class="modal-footer">
								<a href="#" class="ba-btn" data-dismiss="modal"> Cancel </a> <a
									href="#" class="ba-btn-primary red-btn" id="apply-deactivate">
									Apply </a>
							</div>
						</div>
						<template class="ba-store-statistic-product-template">
							<div class="ba-store-statistic-product">
								<div class="ba-store-statistic-product-image"></div>
								<div class="ba-store-statistic-product-content">
									<span class="ba-store-statistic-product-title-wrapper">
										<span class="ba-store-statistic-product-title"></span> <span
										class="ba-store-statistic-product-description"> <span
											class="ba-store-statistic-product-info"> </span>
									</span>
									</span> <span class="ba-store-statistic-product-sales-wrapper">
										<span class="ba-store-statistic-product-sales"> <span
											class="ba-store-statistic-product-sales-count"></span> <span
											class="ba-store-statistic-product-sales-text">Sales</span>
									</span> <span class="ba-store-statistic-price"></span>
									</span>
								</div>
								<a href="" target="_blank"></a>
							</div>
						</template>

						<div class="ba-context-menu options-context-menu"
							data-source="gridbox-options"
							style="left: 347px; - -context-top: 586px; display: none;">
							<span class="export-gridbox"> <i
								class="zmdi zmdi-download "></i> <span
								class="ba-context-menu-title"> Export </span>
							</span> <span class="import-gridbox"> <i
								class="zmdi zmdi-upload"></i> <span
								class="ba-context-menu-title"> Import </span>
							</span> <span class="import-joomla-content"> <i
								class="zmdi zmdi-inbox"></i> <span
								class="ba-context-menu-title"> Import Joomla Content </span>
							</span> <span class="context-menu-item-link ba-group-element"> <a
								href="index.php?option=com_config&amp;view=component&amp;component=com_gridbox&amp;path="
								class="default-action"> <i class="zmdi zmdi-accounts"></i>
									<span class="ba-context-menu-title"> Permissions </span>
							</a>
							</span>
						</div>
						<div class="ba-context-menu store-context-menu"
							data-source="gridbox-store"
							style="left: 347px; - -context-top: 249px; display: none;">
							<span class="context-menu-item-link"> <a
								href="index.php?option=com_gridbox&amp;view=orders"
								class="default-action"> <i class="zmdi zmdi-shopping-cart"></i>
									<span class="ba-context-menu-title"> Orders </span>

							</a>
							</span> <span class="context-menu-item-link"> <a
								href="index.php?option=com_gridbox&amp;view=paymentmethods"
								class="default-action"> <i class="zmdi zmdi-card"></i> <span
									class="ba-context-menu-title"> Payment Methods </span>
							</a>
							</span> <span class="context-menu-item-link"> <a
								href="index.php?option=com_gridbox&amp;view=shipping"
								class="default-action"> <i class="zmdi zmdi-truck"></i> <span
									class="ba-context-menu-title"> Shipping </span>
							</a>
							</span> <span class="context-menu-item-link"> <a
								href="index.php?option=com_gridbox&amp;view=promocodes"
								class="default-action"> <i class="zmdi zmdi-card-giftcard"></i>
									<span class="ba-context-menu-title"> Promo Codes </span>
							</a>
							</span> <span class="context-menu-item-link"> <a
								href="index.php?option=com_gridbox&amp;view=sales"
								class="default-action"> <i class="zmdi zmdi-bookmark"></i>
									<span class="ba-context-menu-title"> Discounts </span>
							</a>
							</span> <span class="context-menu-item-link"> <a
								href="index.php?option=com_gridbox&amp;view=productoptions"
								class="default-action"> <i class="zmdi zmdi-invert-colors"></i>
									<span class="ba-context-menu-title"> Product Options </span>
							</a>
							</span> <span class="context-menu-item-link ba-group-element"> <a
								href="index.php?option=com_gridbox&amp;view=storesettings"
								class="default-action"> <i class="zmdi zmdi-settings"></i>
									<span class="ba-context-menu-title"> Settings </span>
							</a>
							</span>
						</div>
						<div id="languages-dialog" class="ba-modal-sm modal hide"
							style="display: none">
							<div class="modal-body">
								<div class="languages-wrapper">

									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/ca-ES.svg"></span><span
											class="language-title" data-key="0">Catalan</span><span
											class="language-code">ca-ES</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/zh-CN.svg"></span><span
											class="language-title" data-key="1">Chinese
											Simplified</span><span class="language-code">zh-CN</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/cs-CZ.svg"></span><span
											class="language-title" data-key="2">Czech</span><span
											class="language-code">cs-CZ</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/nl-NL.svg"></span><span
											class="language-title" data-key="3">Dutch</span><span
											class="language-code">nl-NL</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/fr-FR.svg"></span><span
											class="language-title" data-key="4">French</span><span
											class="language-code">fr-FR</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/de-DE.svg"></span><span
											class="language-title" data-key="5">German</span><span
											class="language-code">de-DE</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/hu-HU.svg"></span><span
											class="language-title" data-key="6">Hungarian</span><span
											class="language-code">hu-HU</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/it-IT.svg"></span><span
											class="language-title" data-key="7">Italian</span><span
											class="language-code">it-IT</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/pl-PL.svg"></span><span
											class="language-title" data-key="8">Polish</span><span
											class="language-code">pl-PL</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/pt-BR.svg"></span><span
											class="language-title" data-key="9">Portuguese Brazil</span><span
											class="language-code">pt-BR</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/ru-RU.svg"></span><span
											class="language-title" data-key="10">Russian</span><span
											class="language-code">ru-RU</span>
									</div>
									<div class="language-line">
										<span class="language-img"><img
											src="https://www.balbooa.com/updates/gridbox/language/flags/es-ES.svg"></span><span
											class="language-title" data-key="11">Spanish</span><span
											class="language-code">es-ES</span>
									</div>
								</div>
							</div>
						</div>
						<div id="import-joomla-content-modal"
							class="ba-modal-md modal hide" style="display: none">
							<div class="modal-body">
								<div class="ba-modal-header">
									<h3>Select an app to import articles</h3>
									<i data-dismiss="modal" class="zmdi zmdi-close"></i>
								</div>
								<div class="availible-folders">
									<ul class="root-list">

									</ul>
								</div>
							</div>
							<div class="modal-footer">
								<a href="#" class="ba-btn" data-dismiss="modal"> Cancel </a>

							</div>
						</div>
						<div id="import-dialog" class="ba-modal-sm modal hide"
							style="display: none">
							<div class="modal-header">
								<h3>Import</h3>
								<label class="ba-help-icon"> <i class="zmdi zmdi-help"></i>
									<span class="ba-tooltip ba-help ba-hide-element">
										Import a previously exported Gridbox Pages and Themes. Select
										.xml file to import. </span>
								</label>
							</div>
							<div class="modal-body">
								<div class="ba-input-lg">
									<input id="theme-import-trigger" class="theme-import-trigger"
										readonly="" type="text" placeholder="Select"> <i
										class="zmdi zmdi-attachment-alt theme-import-trigger"></i>

								</div>
							</div>
							<div class="modal-footer">
								<a href="#" class="ba-btn" data-dismiss="modal"> Cancel </a> <a
									href="#" class="ba-btn-primary apply-import"> Install </a>
							</div>
						</div>
						<input type="hidden" id="installing-const"
							value="Installing. Please wait...">
						<div id="photo-editor-dialog" class="ba-modal-lg modal hide"
							style="display: none">
							<div class="modal-header">
								<span class="ba-dialog-title">Photo Editor</span>
								<div class="modal-header-icon">
									<i class="zmdi zmdi-close" data-dismiss="modal"></i>
								</div>
							</div>
							<div class="modal-body">
								<div class="general-tabs">
									<ul class="nav nav-tabs uploader-nav">
										<li class="active"><a href="#resize-image-options"
											data-toggle="tab"> <i class="zmdi zmdi-wallpaper"></i> <span
												class="ba-tooltip ba-bottom">Resize</span>
										</a></li>
										<li><a href="#crop-image-options" data-toggle="tab">
												<i class="zmdi zmdi-crop"></i> <span
												class="ba-tooltip ba-bottom">Crop</span>
										</a></li>
										<li><a href="#filter-effects-image-options"
											data-toggle="tab"> <i class="zmdi zmdi-invert-colors"></i>
												<span class="ba-tooltip ba-bottom">Filter and
													Effects</span>
										</a></li>
										<li><a href="#adjust-image-options" data-toggle="tab">
												<i class="zmdi zmdi-tune"></i> <span
												class="ba-tooltip ba-bottom">Adjust</span>
										</a></li>
										<li><a href="#flip-rotate-image-options"
											data-toggle="tab"> <i class="zmdi zmdi-flip"></i> <span
												class="ba-tooltip ba-bottom">Flip and Rotate</span>
										</a></li>
										<span class="photo-editor-save-image"
											data-context="save-image-context-menu"> <span>Save</span>
											<i class="zmdi zmdi-caret-down"></i>
										</span>
									</ul>
									<div class="tabs-underline" style="left: 0px; right: 1914px;"></div>
									<div class="resize-image-wrapper">
										<div>
											<canvas id="photo-editor"></canvas>
										</div>
										<div class="ba-crop-overlay" style="opacity: 0;">
											<canvas id="ba-overlay-canvas"></canvas>
											<span class="ba-crop-overlay-resize-handle"
												data-resize="top-left"></span> <span
												class="ba-crop-overlay-resize-handle"
												data-resize="top-right"></span> <span
												class="ba-crop-overlay-resize-handle"
												data-resize="bottom-left"></span> <span
												class="ba-crop-overlay-resize-handle"
												data-resize="bottom-right"></span>
										</div>
									</div>
									<span class="show-photo-media-editor"> <i
										class="zmdi zmdi-camera"></i> <span class="ba-tooltip ba-top">SELECT_PICTURE_TO_START_EDIT</span>
									</span>
									<div class="tab-content">
										<div id="resize-image-options"
											class="row-fluid tab-pane active">
											<div class="ba-settings-group">
												<div class="ba-settings-toolbar">
													<div>
														<span>Width</span> <input type="number"
															class="resize-width" data-callback="emptyCallback">
													</div>
													<div>
														<span>Height</span> <input type="number"
															class="resize-height" data-callback="emptyCallback">
													</div>
												</div>
												<div class="ba-settings-item">
													<span>Quality</span>
													<div class="ba-range-wrapper">
														<span class="ba-range-liner"></span> <input type="range"
															class="ba-range" min="0" max="100"> <input
															type="number" class="photo-editor-quality"
															data-callback="photoEditorQuality">
													</div>
												</div>
											</div>
											<div class="photo-editor-footer">
												<a href="#" class="reset-image">Reset</a> <a href="#"
													class="resize-action">Apply</a>
											</div>
										</div>
										<div id="crop-image-options" class="row-fluid tab-pane">
											<div class="ba-settings-group">
												<div class="ba-settings-toolbar">
													<div>
														<span>Width</span> <input type="number"
															class="crop-width" data-callback="emptyCallback">
													</div>
													<div>
														<span>Height</span> <input type="number"
															class="crop-height" data-callback="emptyCallback">
													</div>
												</div>
												<div class="ba-settings-item">
													<span>Keep Proportions</span> <label class="ba-checkbox">
														<input type="checkbox" class="keep-proportions">
														<span></span>
													</label>
												</div>
												<div class="ba-settings-item">
													<span>Aspect Ratio</span>
													<div class="ba-custom-select aspect-ratio-select">
														<input readonly="" onfocus="this.blur()" type="text"
															value=""> <input type="hidden" value="3">
														<i class="zmdi zmdi-caret-down"></i>
														<ul>
															<li data-value="original">Original</li>
															<li data-value="1:1">1:1</li>
															<li data-value="3:2">3:2</li>
															<li data-value="3:4">3:4</li>
															<li data-value="16:9">16:9</li>
														</ul>
													</div>
												</div>
											</div>
											<div class="photo-editor-footer">
												<a href="#" class="reset-image">Reset</a> <a href="#"
													class="crop-action">Apply</a>
											</div>
										</div>
										<div id="filter-effects-image-options"
											class="row-fluid tab-pane">
											<div class="ba-settings-group">
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="original"></canvas>
													<span>original</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="1977"></canvas>
													<span>1977</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="aden"></canvas>
													<span>Aden</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="amaro"></canvas>
													<span>Amaro</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="brannan"></canvas>
													<span>Brannan</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="brooklyn"></canvas>
													<span>Brooklyn</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="clarendon"></canvas>
													<span>Clarendon</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="earlybird"></canvas>
													<span>Earlybird</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="gingham"></canvas>
													<span>Gingham</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="hudson"></canvas>
													<span>Hudson</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="inkwell"></canvas>
													<span>Inkwell</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="lofi"></canvas>
													<span>Lofi</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="maven"></canvas>
													<span>Maven</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="perpetua"></canvas>
													<span>Perpetua</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="reyes"></canvas>
													<span>Reyes</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="stinson"></canvas>
													<span>Stinson</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="toaster"></canvas>
													<span>Toaster</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="walden"></canvas>
													<span>Walden</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="valencia"></canvas>
													<span>Valencia</span>
												</div>
												<div class="filter-effects-thumbnail">
													<canvas class="filter-effect-canvas" data-key="xpro2"></canvas>
													<span>Xpro2</span>
												</div>
											</div>
											<div class="photo-editor-footer">
												<a href="#" class="reset-image">Reset</a> <a href="#"
													class="filter-effects-action">Apply</a>
											</div>
										</div>
										<div id="adjust-image-options" class="row-fluid tab-pane">
											<div class="ba-settings-group">
												<div class="ba-settings-item">
													<span>Contrast</span>
													<div class="ba-range-wrapper">
														<span class="ba-range-liner"></span> <input type="range"
															class="ba-range" min="0" max="200" step="1"> <input
															type="number" data-filter="contrast"
															data-callback="photoEditorFilters">
													</div>
												</div>
												<div class="ba-settings-item">
													<span>Brightness</span>
													<div class="ba-range-wrapper">
														<span class="ba-range-liner"></span> <input type="range"
															class="ba-range" min="0" max="200" step="1"> <input
															type="number" data-filter="brightness"
															data-callback="photoEditorFilters">
													</div>
												</div>
												<div class="ba-settings-item">
													<span>Saturate</span>
													<div class="ba-range-wrapper">
														<span class="ba-range-liner"></span> <input type="range"
															class="ba-range" min="0" max="200" step="1"> <input
															type="number" data-filter="saturate"
															data-callback="photoEditorFilters">
													</div>
												</div>
												<div class="ba-settings-item">
													<span>Sepia</span>
													<div class="ba-range-wrapper">
														<span class="ba-range-liner"></span> <input type="range"
															class="ba-range" min="0" max="100" step="1"> <input
															type="number" data-filter="sepia"
															data-callback="photoEditorFilters">
													</div>
												</div>
												<div class="ba-settings-item">
													<span>Grayscale</span>
													<div class="ba-range-wrapper">
														<span class="ba-range-liner"></span> <input type="range"
															class="ba-range" min="0" max="100" step="1"> <input
															type="number" data-filter="grayscale"
															data-callback="photoEditorFilters">
													</div>
												</div>
												<div class="ba-settings-item">
													<span>Blur</span>
													<div class="ba-range-wrapper">
														<span class="ba-range-liner"></span> <input type="range"
															class="ba-range" min="0" max="10" step="1"> <input
															type="number" data-filter="blur"
															data-callback="photoEditorFilters">
													</div>
												</div>
											</div>
											<div class="photo-editor-footer">
												<a href="#" class="reset-image">Reset</a> <a href="#"
													class="adjust-action">Apply</a>
											</div>
										</div>
										<div id="flip-rotate-image-options"
											class="row-fluid tab-pane">
											<span> <i class="zmdi zmdi-rotate-left rotate-action"
												data-rotate="-90"></i> <span class="ba-tooltip ba-bottom">Rotate
													Left</span>
											</span> <span> <i
												class="zmdi zmdi-rotate-right rotate-action"
												data-rotate="90"></i> <span class="ba-tooltip ba-bottom">Rotate
													Right</span>
											</span> <span> <i class="zmdi zmdi-flip flip-action"
												data-flip="horizontal"></i> <span
												class="ba-tooltip ba-bottom">Flip Horizontal</span>
											</span> <span> <i class="zmdi zmdi-flip flip-action"
												data-flip="vertical"></i> <span
												class="ba-tooltip ba-bottom">Flip Vertical</span>
											</span>
											<div class="photo-editor-footer">
												<a href="#" class="reset-image">Reset</a> <a href="#"
													class="flip-rotate-action">Apply</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="save-copy-dialog" class="ba-modal-sm modal hide">
							<div class="modal-body">
								<h3 class="ba-modal-title">Save as Copy</h3>
								<div class="ba-input-lg">
									<input type="text"
										class="photo-editor-file-title reset-input-margin"
										placeholder="Enter file name"> <span
										class="focus-underline"></span>
								</div>
								<div class="ba-checkbox-parent">
									<label class="ba-checkbox ba-hide-checkbox"> <input
										type="checkbox" class="save-as-webp"> <span></span>
									</label> <label>Save as WebP</label>
								</div>
							</div>
							<div class="modal-footer">
								<a href="#" class="ba-btn" data-dismiss="modal"> Cancel </a> <a
									href="#" class="ba-btn-primary disable-button"
									id="apply-save-copy"> Save </a>
							</div>
						</div>
						<div id="save-copy-notice-dialog" class="ba-modal-sm modal hide">
							<div class="modal-body">
								<h3 class="ba-modal-title">Save as Copy</h3>
								<p class="modal-text">The file already exists. Do you want
									to overwrite it?</p>
							</div>
							<div class="modal-footer">
								<a href="#" class="ba-btn" data-dismiss="modal"> Cancel </a> <a
									href="#" class="ba-btn-primary red-btn"
									id="apply-overwrite-copy"> Save </a>
							</div>
						</div>
						<div class="ba-context-menu save-image-context-menu"
							style="display: none;">
							<span class="photo-editor-save-copy"> <span>Save
									as Copy</span>
							</span> <span class="save-photo-editor-image"> <span>Save</span>
							</span>
						</div>
					</main>
				</div>
			</div>
		</section>
	</div>

		<!-- //container -->

<script>

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
	      text: '날짜별 현황',
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
	      text: '연령별 예매 현황',
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

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>
    
