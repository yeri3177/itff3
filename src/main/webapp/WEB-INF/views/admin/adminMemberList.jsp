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
			
			<div class="row">
				<div class="col-md-12">
<!-- 					<h3 class="h5 mb-4 text-center">Table Accordion</h3> -->
				
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>&nbsp;</th>
									<th>아이디</th>
									<th>닉네임</th>
									<th style="width: 120px;">이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>생년월일</th>
									<th>주소</th>
									<th style="width: 100px">포인트</th>
									<th>가입일자</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="list">
								<tr class="alert" role="alert">

									<td></td>
									
									<!-- 아이디 -->
									<td>
										<div class="email">
											<span>${list.id }</span> 
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
									<td style="width: 200px;">
										<div class="quantity">
											<span><fmt:formatDate value="${list.birthday }" pattern="yyyy-MM-dd"/> </span> 
										</div>
									</td>
									
									<!-- 주소 -->
									<td>
										<div class="email">
											<span>${list.address }</span> 
										</div>
									</td>
									
									<!-- 포인트  -->
									<td class="quantity"><fmt:formatNumber value="${list.point }" pattern="#,###" /></td>
									
									<!-- 가입일자 -->
									<td style="width: 200px;"><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></td>

									<!-- 버튼 -->
									<td><button type="button" class="btn btn-outline-success">수정</button></td>
									<td></td>
									<!-- 취소버튼 -->
<!-- 									<td> -->
<!-- 										<button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 											<span aria-hidden="true"><i class="fa fa-close"></i></span> -->
<!-- 										</button> -->
<!-- 									</td> -->
								</tr>
								</c:forEach>
								

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	
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



	<!-- //container -->

<!-- //footer -->
<footer id="ft" class="ft">

${pagebar}

</footer>
<!-- //footer -->

</body>
</html>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>