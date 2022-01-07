<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/notify.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<div class="page page1-2">
			

<!--//START: CONTENTS AREA-->

<div class="container">
<div>
		<div class="msg_section" style="margin-bottom: 55px;">
			<h2 class="m-3">
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
						<div class="row px-3 id-con">
					        <span>${list.content}</span>
					        <button class="readNotifyBtn btn btn-secondary ml-auto">읽기</button>
					        <span class="notifyId d-none">${list.NId}</span>
						</div>
				        
				    </div>
				</div>			
			</c:forEach>
			</div>
			</div>
			
			<hr />
			
			<div class="msg_section">	
			<h2 class="m-3">
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
			</div>
			<button id="searchMoreNotify" class="btn btn-outline-primary btn-block col-sm-10 mx-auto">더 보기</button>
	</div>
</div>
</div><!-- // conwid80 -->

<script type="text/javascript">
	$(document).ready(function(){
		// 읽은 알림 총 갯수
		var oldListCnt = '${oldListCnt}';
		
		// 조회 인덱스
		var startIndex = 1;	// 인덱스 초기값
		var searchStep = 5;	// 5걔씩 로딩
		
		// 아이디
		var _m_id = $(".id").val();
		console.log(_m_id)
		
		// 로딩시 실행 - 읽은 알림 5개 얻기 
		readOldNotify(startIndex);

		// 더보기 클릭시
		$('#searchMoreNotify').click(function(){
			startIndex += searchStep;
			readOldNotify(startIndex);
		});
		
		// 클릭 시
		$('.newElem').click(function(e){
			let _n_id = $(this).find('.notifyId').text();
			let notifyElem = $(this);
			// 읽기로 보내주기!
			readNewNotifyElem(_n_id, notifyElem);
		});
		
		// 읽기버튼 클릭시 
		$('.readNotifyBtn').click(function(e){
			e.stopPropagation();	// 부모 이벤트 끊기
			let _n_id = $(this).siblings('.notifyId').text();
			let notifyElem = $('.newElem').has(this);
			readNewNotifyElem(_n_id, notifyElem);
			$(e.target).remove();	// 읽기버튼 삭제
		});
		
		// 읽기 ajax
		function readNewNotifyElem(_n_id, notifyElem){
			$.ajax({
                url: "${pageContext.request.contextPath}/notify/readNotify.do",
                type: "post",
                async: "true",
                dataType: "text",
                contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                data: {
                    n_id: _n_id,
                    m_id: _m_id 
                },
                beforeSend : function(xhr) {   
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data, textStatus) { 
                	let targetElem = document.getElementById('oldList').firstChild;
                	$(targetElem).before(notifyElem);
//                 	$(e.target).remove();
                	// 안읽은 알림 카운트 줄이기
                	let newCnt = $('#newNoticeCnt').text()-1;
                	if(newCnt!='0'){
	                	$('#newNoticeCnt').text(newCnt);
                	}
                }
			});
		}
		
		// 더보기 실행함수
		function readOldNotify(index){
			let _endIndex = index+searchStep-1;	// endIndex설정
			$.ajax({
				url: "${pageContext.request.contextPath}/notify/searchMoreNotify.do",
				type: "post",
				async: "true",
				dataType: "json",
	            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				data: {
					m_id: _m_id,
					startIndex: index,
					endIndex: _endIndex
				},
                beforeSend : function(xhr) {   
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
	            success: function (data, textStatus) {
	            	let NodeList = "";
					for(i = 0; i < data.length; i++){
						let newNode = "<div style='display: none;' class='card form-group col-sm-10 mx-auto p-0' onClick='window.open('"+data[i].n_url+"')>";
						newNode += "<div class='card-body pt-3'><div class='row px-3 mb-2'>";
						newNode += "<strong class='d-block text-gray-dark'>"+data[i].type+"</strong>";
						newNode += "<span class='text-muted ml-auto'>"+data[i].time+"</span>";
						newNode += "</div><span>"+data[i].content+"</span></div></div>";
						NodeList += newNode;
					}
	            	$(NodeList).appendTo($("#oldList")).slideDown();
	        		// 더보기 버튼 삭제
	            	if(startIndex + searchStep > oldListCnt){
	        			$('#searchMoreNotify').remove();
	        		}
	            }
			});
		}
		
	});

</script>

<!-- //container -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>