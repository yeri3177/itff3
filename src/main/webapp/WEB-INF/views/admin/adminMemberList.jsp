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
<html>
<head>
<meta charset="UTF-8">

<title>ITFF Admin</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 카카오맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f83d8937bb78b8df31e1796445fc8213&libraries=services,clusterer"></script>

<!-- bootstrap js: jquery load 이후에 작성할 것.-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminList.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminMenu.css">

<!-- sock.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"
	integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- stomp.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"
	integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 babel-standalone -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js"
	integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용: babel-polyfill -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js"
	integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<style>
div#search-id {display: ${searchType} == '' || ${searchType} == null ||"id".equals(${searchType}) ? "inline-block" : "none"; }
div#search-name {display: "name".equals(${searchType}) ? "inline-block" : "none";}
</style>

<body>

<!-- 	Header -->
<header id="hd" class="hd"> 
</header> 
<!-- 	//header -->

	<section class="ftco-section">
	
	<!-- 관리자 공통 메뉴 -->
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp"></jsp:include>

		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">전체 회원 목록</h2>
				</div>
			</div>
			
			<div class="row" id="row">
				<div class="col-md-12">

					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
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
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list" varStatus="status">

									<tr class="alert" role="alert">

										<td></td>

										<!-- 아이디 -->
										<td>
											<div class="email" data-id="${list.id }">
												<span>${list.id }</span> <input type="hidden"
													name=id${status.index} value="${list.id }" />
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
												<span><fmt:formatDate value="${list.birthday }"
														pattern="yyyy-MM-dd" /></span>
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

										<td>
											<button 
												type="button"
												class="btn btn-secondary" 
												data-toggle="modal"
												data-target="#adminMemberDetail"
												onclick="memberDetail_btn('${list.id}');">상세</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

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
						
						</div>
					</div>
				</div>
			</div>
	</section>
	        
<!-- //container -->
	

<!-- //footer -->
<footer id="ft" class="ft">

   <div class="input-group rounded" style="justify-content: center; margin: 20px 0 20px 0">
        <select 
        	id="searchType" 
        	style="    display: block; padding: 0.375rem 2.25rem 0.375rem 0.75rem; -moz-padding-start: calc(0.75rem - 3px); font-size: 1rem; font-weight: 400; line-height: 1.5; color: #212529; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; -webkit-appearance: none; -moz-appearance: none; appearance: none;">
            <option value="id" ${"id".equals(searchType) ? "selected" : ""}>아이디</option>		
            <option value="name" ${"name".equals(searchType) ? "selected" : ""}>회원명</option>
        </select>
        <div id="search-id" class="search-type">
            <form action="${pageContext.request.contextPath}/admin/adminMemberFinder.do">
            	<div style="display: flex;">
                <input type="hidden" name="searchType" value="id"/>
                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="ID를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" placeholder="검색할 아이디를 입력하세요." value="${'id' eq searchType ? searchKeyword : ''}"/>
                <button type="submit" class="btn btn-outline-primary">search</button>		
            	</div>
            </form>	
        </div>
        <div id="search-name" class="search-type" style="display: none;">
            <form action="${pageContext.request.contextPath}/admin/adminMemberFinder.do">
            <div style="display: flex;">
                <input type="hidden" name="searchType" value="name"/>
                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="이름을 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" placeholder="검색할 이름을 입력하세요." value="${'name' eq searchType ? searchKeyword : ''}"/>
                <button type="submit" class="btn btn-outline-primary">search</button>		
            </div>
            </form>	
        </div>
    </div>

${pagebar}

</footer>
<!-- //footer -->

<script>
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

//Bootstrap multiple modal
var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌

$(document).on('show.bs.modal', '.modal', function () {
    var zIndex = 1040 + (10 * count);

    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);

    count = count + 1

});

// multiple modal Scrollbar fix
$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});

</script>

</body>
</html>
