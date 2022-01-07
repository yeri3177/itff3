<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/intro/greeting.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<style type="text/css">
	#newList, #oldList{
		cursor: pointer;
	}
	#newList .card{
    	background-color: #cce5ff;
    	border-color: #b8daff;
	}
	#newList .card:hover{
    	background-color: #b8daff;
	}
</style>

<div class="page page1-2">
			

<!--//START: CONTENTS AREA-->

<div class="container">
<div class="container">
			<h2 class="m-5">
			새로 온 알림
			</h2>
			<div id="newList">
			<c:if test="${empty newList}">
				<div class="card form-group col-sm-10 mx-auto p-0 bg-light border-light">
					<div class="card-body pt-3 text-center">
				        새로 받은 알림이 없습니다.
				    </div>
				</div>			
			</c:if>
			<c:forEach var="list" items="${newList}">
				<div class="newElem card form-group col-sm-10 mx-auto p-0">
					<div class="card-body pt-3" onclick="window.open('${list.url}')">
						<div class="row px-3 mb-2">
					        <strong class="d-block text-gray-dark">${list.type}</strong>
					        <span class="text-muted ml-auto">${list.time}</span>
						</div>
						<div class="row px-3">
					        <span>${list.content}</span>
					        <button class="readNotifyBtn btn btn-sm btn-primary ml-auto">읽기</button>
					        <span class="notifyId d-none">${list.NId}</span>
						</div>
				        
				    </div>
				</div>			
			</c:forEach>
			</div>
			<h2 class="m-5">
			읽은 알림
			</h2>
			<div id="oldList">
<%-- 			<c:forEach var="list" items="${oldList}"> --%>
<%-- 				<div class="card form-group col-sm-10 mx-auto p-0" onClick="location.href='${list.n_url}'"> --%>
<!-- 					<div class="card-body pt-3"> -->
<!-- 						<div class="row px-3 mb-2"> -->
<%-- 					        <strong class="d-block text-gray-dark">${list.n_type}</strong> --%>
<%-- 					        <span class="text-muted ml-auto">${list.n_time}</span> --%>
<!-- 						</div> -->
<%-- 				        <span>${list.n_content}</span> --%>
<!-- 				    </div> -->
<!-- 				</div>			 -->
<%-- 			</c:forEach> --%>
			</div>
			<button id="searchMoreNotify" class="btn btn-outline-primary btn-block col-sm-10 mx-auto">더 보기</button>
	</div>
</div><!-- // conwid80 -->
</div>



<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>