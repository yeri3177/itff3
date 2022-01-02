<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.apache.tomcat.util.net.openssl.ciphers.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminList.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<style>
div#search-id {display: ${searchType} == '' || ${searchType} == null || "id".equals(${searchType}) ? "inline-block" : "none"; }
div#search-name {display: "name".equals(${searchType}) ? "inline-block" : "none";}
</style>

<!-- 굿즈 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminMemberNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

		<div class="container">	
		
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">회원목록</h2>
				</div>
			</div>
			
			<div class="search-total-total">
			<div class="row" id="row">
				<div class="col-md-12">
					<div class="table-wrap">
					
					<div class="search-total">
					
					<button 
					type="button" 
		      		class="btn btn-info"
		      		data-toggle="modal"
					data-target="#adminTotalMsg"
					onclick="tt_msg_btn();">전체 메세지</button>
					
						<div class="input-group rounded">
					        <select 
					        	id="searchType" 
					        	class="custom-select"
					        	style="display: block; padding: 0.375rem 2.25rem 0.375rem 0.75rem; -moz-padding-start: calc(0.75rem - 3px); font-size: 1rem; font-weight: 400; line-height: 1.5; color: #212529; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; -webkit-appearance: none; -moz-appearance: none; appearance: none; width: 150px;">
					            <option value="id" ${"id".equals(searchType) ? "selected" : ""}>아이디</option>		
					            <option value="name" ${"name".equals(searchType) ? "selected" : ""}>회원명</option>
					        </select>
					        <div id="search-id" class="search-type" style="width: 500px !important;">
					            <form action="${pageContext.request.contextPath}/admin/adminMemberFinder.do">
					            	<div style="display: flex;">
					                <input type="hidden" name="searchType" value="id"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="ID를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" placeholder="검색할 아이디를 입력하세요." value="${'id' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            	</div>
					            </form>	
					        </div>
					        <div id="search-name" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminMemberFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="name"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="이름을 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" placeholder="검색할 이름을 입력하세요." value="${'name' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-dark">search</button>		
					            </div>
					            </form>	
					        </div>
					    </div>
					</div>
					    
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>아이디</th>
									<th>닉네임</th>
									<th>이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>생년월일</th>
									<th style="width: 300px;">주소</th>
									<th>포인트</th>
									<th>가입일자</th>
									<th style="width: 105px;">권한</th>
									<th style="width: 105px;">활성화여부</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list" varStatus="status">

									<tr class="alert" role="alert">

										<td></td>

										<!-- 프로필 사진 -->
										<td>
											<div class="email">
												<img class="profile_img" src="${pageContext.request.contextPath}/resources/upload/member/${list.image}" alt="" />
											</div>
										</td>

										<!-- 아이디 -->
										<td>
											<div class="email" data-id="${list.id }">
												<span>${list.id }</span> 
												<input type="hidden" name=id${status.index} value="${list.id }" />
											</div>
										</td>

										<!-- 닉네임 -->
										<td>
											<div class="email">
												<span>${list.nickname }</span>
											</div>
										</td>

										<!-- 이름 -->
										<td>
											<div class="email">
												<span>${list.name }</span>
											</div>
										</td>

										<!-- 연락처 -->
										<td>
											<div class="email">
												<span>${list.phone }</span>
											</div>
										</td>

										<!-- 이메일  -->
										<td class="quantity">${list.email }</td>

										<!-- 생년월일 -->
										<td>
											<div class="quantity">
												<span>
												<fmt:formatDate value="${list.birthday }" pattern="yyyy-MM-dd" />
												</span>
											</div>
										</td>

										<!-- 주소 -->
										<td>
											<div class="email">
												<span>${list.address }</span>
											</div>
										</td>

										<!-- 포인트  -->
										<td class="quantity"><fmt:formatNumber
												value="${list.point }" pattern="#,###" /></td>

										<!-- 가입일자 -->
										<td><fmt:formatDate value="${list.regDate }"
												pattern="yyyy-MM-dd" /></td>

										<!-- 권한 -->
										<td>${list.authorities eq "[ROLE_USER]" ? "회원" : "관리자" }</td>

										<!-- 활성화 여부 -->
										<td>${list.enabled}</td>

										<td>
											<button 
												type="button"
												class="btn btn-outline-dark"
												data-toggle="modal"
												data-target="#adminMemberDetail"
												onclick="memberDetail_btn('${list.id}');">상세</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>

					<!-- 회원 상세 -->
					<div class="modal fade" id="adminMemberDetail" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document"
							style="max-width: 800px;">
							<div class="modal-content" style="text-align: left;">
							   	<div class="modal-body" id="modal_ajax1">
							    		  
								</div>

								</div>
							</div>
						</div>
						<!-- 회원 상세 끝 -->
						<!-- 회원 정보 수정 -->
						<div class="modal fade" id="adminMemberUpdate" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 1000px;">
								<div class="modal-content" style="text-align: left;">
								   	<div class="modal-body" id="modal_ajax2">
								    		  
									</div>
	
									</div>
								</div>
							</div>
							<!-- 회원 정보 수정 끝 -->
							<!-- 회원 포인트 지급 -->
							<div class="modal fade" id="adminMemberPoint" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document"
									style="max-width: 500px;">
									<div class="modal-content" style="text-align: left;">
									   	<div class="modal-body" id="modal_ajax3">
									    		  
										</div>
		
										</div>
									</div>
								</div>
								<!-- 회원 포인트 지급 끝 -->
								<!-- 회원 차단 -->
								<div class="modal fade" id="adminMemberCut" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document"
										style="max-width: 500px;">
										<div class="modal-content" style="text-align: left;">
										   	<div class="modal-body" id="modal_ajax5">
										    		  
											</div>
			
											</div>
										</div>
									</div>
								<!-- 회원 차단 끝 -->
								<!-- 회원 차단 해제 -->
								<div class="modal fade" id="adminMemberUnblock" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document"
										style="max-width: 500px;">
										<div class="modal-content" style="text-align: left;">
										   	<div class="modal-body" id="modal_ajax6">
										    		  
											</div>
			
											</div>
										</div>
									</div>
								<!-- 회원 차단 해제 끝 -->
								<!-- 전체 메세지 -->
								<div class="modal fade" id="adminTotalMsg" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document"
										style="max-width: 500px;" >
									<div class="modal-content tt_msg_content" style="text-align: left;">
								   	<div class="modal-body">				    		  									
									      <div class="modal-header">
									        <h4 class="modal-title" id="exampleModalLabel">전체 메세지</h4>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
							  				<form name="total_msg_frm">
									      <div class="modal-body">
									        <table class="table" id="modal_table">
											  <tbody>
											    <tr>
											      <td>
											      <textarea class="form-control modal-body textarea tt_msg_text" id="exampleFormControlTextarea1" name="content" rows="3"></textarea>
											      </td>
											    </tr>
											  </tbody>
											</table>
									      </div>
									      
									      <div class="modal-footer">
									        <button type="submit" id="totalNotifySendBtn" class="btn btn-dark">알림 전송</button>
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									      </div>
										    </form>
										</div>			
									</div>	
									
									</div>
								</div>
								
								<!-- 전체 메세지 끝  -->
								<!--  개별 메세지 -->
								<div class="modal fade" id="adminSaveNotify" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div id="modal_ajax4" class="modal-dialog" role="document"
										style="max-width: 500px;" >
									</div>
								</div>
								<!-- 개별 메세지 끝 -->
						
						</div>
					</div>
				</div>
			</div>
	        
<!-- //container -->

${pagebar}

<script>
// 검색
$("#searchType").change((e) => {
	// e.target 이벤트발생객체 -> #searchType
	const type = $(e.target).val();
	
	// 1. .search-type 감추기
	$(".search-type").hide();
	
	// 2. #search-${type} 보여주기(display:inline-block)
	$(`#search-\${type}`).css("display", "inline-block");
});
</script>
	
<script>

$(() => {
	$("[name=upFile]").change((e) => {
		// 1.파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
		console.dir(e.target);
		console.log(filename);
		
		// 2.label에 설정하기
		const $label = $(e.target).next();
		if(file != undefined)
			$label.html(filename);
		else
			$label.html("파일을 선택하세요.");
		
		$("[name=pImg]").val(filename);
		
	});	
});

</script>

<script>
// 회원 상세
function memberDetail_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberDetail.do",
		data: {id: id},
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax1").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}
</script>

<script>
// 회원 정보 수정
function memberUpdate_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberUpdate.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax2").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 포인트 지급
function memberPoint_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberPoint.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax3").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 회원 차단
function member_cut_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberCut.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax5").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 회원 차단 해제
function member_unblock_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminMemberUnblock.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax6").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 개별 메세지
function save_btn(memberId) {
	
	console.log(memberId);
	var id = memberId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/saveNotify.do",
		data: {id: id},
		method: "get",
		contentType: "application/json;charset=UTF-8",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax4").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

<script>

// 전체 메세지

$('#totalNotifySendBtn').click(function(e){
    let modal = $('.tt_msg_content').has(e.target);
    let target = 'all';
    let type = '70';
    let content = modal.find('.tt_msg_text').val();
    let url = '${contextPath}/admin/saveNotify.do';
    
    // 전송한 정보를 db에 저장	
    $.ajax({
        type: "post",
        url:"${pageContext.request.contextPath}/admin/saveNotify.do",
        dataType: "text",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        data: {
            target: target,
            content: content,
            type: type,
            url: url
        },
        beforeSend : function(xhr) {   
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success:    // db전송 성공시 실시간 알림 전송
            // 소켓에 전달되는 메시지
            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
        	socket.send("관리자,"+target+","+content+","+url)
    });
    modal.find('.modal-body textarea').val('');	// textarea 초기화
});

</script>

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>