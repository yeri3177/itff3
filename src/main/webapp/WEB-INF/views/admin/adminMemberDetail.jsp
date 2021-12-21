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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminDetail.css" />
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
	<!-- // hd_bg -->

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
					<h2 class="heading-section">회원 상세페이지</h2>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
<!-- 					<h3 class="h5 mb-4 text-center">Table Accordion</h3> -->

					<div class="table-wrap">
					<div class="table_list">
						<table class="table">
							<!-- 							<thead class="thead-primary"> -->
							<tr>
								<th>아이디</th>
								<td>
									<span>${member.id }</span>
								</td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td>
									<span>${member.nickname }</span>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<div class="email">
										<span>${memeber.name }</span>
									</div>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<div class="email">
										<span>${member.phone }</span>
									</div>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<div class="email">
										<span>${member.email }</span>
									</div>
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<div class="email">
										<span><fmt:formatDate value="${member.birthday }" pattern="yyyy-MM-dd"/></span>
									</div>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
								<div class="email">
										<span>${member.address }</span>
								</div>
								</td>
							</tr>
							<tr>
								<th>포인트</th>
								<td>
								<div class="email">
										<span><fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
								</div>
								</td>
							</tr>
							<tr>
								<th>등록일자</th>
								<!-- 등록일자 -->
								<td><fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd" /></td>
							</tr>

						</table>
						
					</div>
				
					<div>
						<table class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col">이력번호</th>
						      <th scope="col">포인트 내역</th>
						      <th scope="col">변동 포인트</th>
						      <th scope="col">누적포인트</th>
						      <th scope="col">이용일자</th>
						    </tr>
						  </thead>
						  <tbody>
						  <c:forEach items="${list }" var="pointHistory">
						    <tr>
						      <td>${pointHistory.historyNo }</td>
						      <td>${pointHistory.reason }</td>
						      <td>${pointHistory.change }</td>
						      <td>${pointHistory.point }</td>
						      <td><fmt:formatDate value="${pointHistory.regDate }" pattern="yyyy-MM-dd" /></td>
						    </tr>
						  </c:forEach>
						  </tbody>
						</table>
					</div>		
					</div>
					
						<div class="btn_wrap">
							<button 
								type="button" class="btn btn-outline-success"
								data-toggle="modal" data-target="#updateGoodsModal"
								value="${member.id }">회원 정보 수정
							</button>
							<button 
								type="button" 
								class="btn btn-outline-primary" 
								value="${member.id }">포인트 수정
							</button>
						</div>
				</div>
				
			<!-- 회원정보 수정 -->
				<div class="modal fade" id="updateGoodsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
	 				<form 
						name="adminGoodsUpdateFrm" 
						action="${pageContext.request.contextPath}/admin/adminGoodsUpdate.do?${_csrf.parameterName}=${_csrf.token}" 
						method="post" 
						enctype="multipart/form-data">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle" style="font-weight: bold;">상품 수정</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body">
		          		  <div class="form-group">
						    <input type="text" name="pName" class="form-control" id="exampleFormControlInput1" placeholder="상품명" value="${goods.PName }" required>
						  </div>
						  
		          		  <div class="form-group">
						    <input type="text" name="pPrice" class="form-control" id="exampleFormControlInput1" placeholder="가격" value="${goods.PPrice }" required>
						  </div>
						  
						  <div class="form-group">
						    <textarea name="pInfo" class="form-control" id="exampleFormControlTextarea1" rows="3" required>${goods.PInfo }</textarea>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleFormControlSelect1">카테고리</label>
						    <select name="pCategory" class="form-control" id="exampleFormControlSelect1" required>
						      <option value="">선택</option>
						      <option value="홈데코/리빙" ${goods.PCategory eq "홈데코/리빙" ? "selected" : "" }>홈데코/리빙</option>
						      <option value="폰케이스/테크" ${goods.PCategory eq "폰케이스/테크" ? "selected" : "" }>폰케이스/테크</option>
						      <option value="의류" ${goods.PCategory eq "의류" ? "selected" : "" }>의류</option>
						    </select>
						  </div>
						  
						  <div class="input-group">
							  <div class="custom-file">
							  	<input type="hidden" name="pId" value="${goods.PId }" />
							  	<input type="hidden" name="pImg" value="" />
							    <input name="upFile" type="file" class="custom-file-input" id="inputGroupFile04" required>
							    <label class="custom-file-label" for="inputGroupFile04">${goods.PImg }</label>
							  </div>
							  <div class="input-group-append">
							    <button class="btn btn-outline-secondary" type="button">Button</button>
							  </div>
							</div>
				      </div>
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button type="submit" class="btn btn-outline-primary">수정</button>
				      </div>
				      
				      </form>
				    </div>
				  </div>
				</div>
				<!-- 회원정보 수정 끝 -->
				
			</div>
		</div>
	</section>
	
<script>

// 파일명 바꾸기 & 이미지 이름
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

// 굿즈 삭제
$(".btn-outline-danger").click((e) => {
	$("[name=pId]").val($(e.target).val());
	$("#deleteGoodsModal").modal();
	console.log($(e.target).val());
	console.log("[name=pId]".val());
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