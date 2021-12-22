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
div#search-pId {display: ${searchType} == '' || ${searchType} == null || "pId".equals(${searchType}) ? "inline-block" : "none"; }
div#search-pName {display: "pName".equals(${searchType}) ? "inline-block" : "none";}
</style>

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
					<h2 class="heading-section">판매 상품 목록</h2>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
				
				<div class="add-product">
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModalLong1">
					  상품 등록
					</button>
				</div>
				
				<!-- 굿즈 추가 -->
				<div class="modal fade" id="exampleModalLong1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
	 				<form 
						name="adminGoodsFrm" 
						action="${pageContext.request.contextPath}/admin/adminGoodsInsert.do?${_csrf.parameterName}=${_csrf.token}" 
						method="post" 
						enctype="multipart/form-data">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle" style="font-weight: bold;">상품 등록</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      
				      <div class="modal-body">
		          		  <div class="form-group">
						    <input type="text" name="pName" class="form-control" id="exampleFormControlInput1" placeholder="상품명" required>
						  </div>
						  
		          		  <div class="form-group">
						    <input type="text" name="pPrice" class="form-control" id="exampleFormControlInput1" placeholder="가격" required>
						  </div>
						  
						  <div class="form-group">
						    <textarea name="pInfo" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="상품 설명을 입력하세요." required></textarea>
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleFormControlSelect1">카테고리</label>
						    <select name="pCategory" class="form-control" id="exampleFormControlSelect1" required>
						      <option value="">선택</option>
						      <option value="홈데코/리빙">홈데코/리빙</option>
						      <option value="폰케이스/테크">폰케이스/테크</option>
						      <option value="의류">의류</option>
						    </select>
						  </div>
						  
						  <div class="input-group">
							  <div class="custom-file">
							  	<input type="hidden" name="pImg" value="" />
							    <input name="upFile" type="file" class="custom-file-input" id="inputGroupFile04" required>
							    <label class="custom-file-label" for="inputGroupFile04">상품 이미지</label>
							  </div>
							  <div class="input-group-append">
							    <button class="btn btn-outline-secondary" type="button">Button</button>
							  </div>
							</div>
				      </div>
				      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				        <button type="submit" class="btn btn-outline-primary">등록</button>
				      </div>
				      
				      </form>
				    </div>
				  </div>
				</div>
				<!-- 굿즈 추가 끝 -->
				
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>상품코드</th>
									<th>상품명</th>
									<th>가격</th>
									<th>카테고리</th>
									<th>등록일자</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="list">
								<tr class="alert" role="alert">
									<!-- 체크박스 -->
									<td><label class="checkbox-wrap checkbox-primary">

									</label>
									</td>
									
									<!-- 이미지 -->
									<td>
										<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${list.PImg })"></div>
									</td>
									
									<!-- 상품코드 -->
									<td>
										<div class="email">
											<span>${list.PId }</span> 
										</div>
									</td>

									<!-- 상품명 -->
									<td>
										<div class="email">
												<span>${list.PName }</span> 
										</div>
									</td>
									
									<!-- 금액 -->
									<td><fmt:formatNumber value="${list.PPrice }" pattern="#,###" /></td>
									
									<!-- 카테고리  -->
									<td class="quantity">${list.PCategory }</td>
									
									<!-- 등록일자 -->
									<td><fmt:formatDate value="${list.PEnroll }" pattern="yyyy-MM-dd"/></td>

									<td>
										<button id="${list.PId }" type="button"
										class="btn btn-secondary" data-toggle="modal"
										data-target="#adminGoodsDetail"
										onclick="goodsDetail_btn('${list.PId}');">상세</button>
									</td>

								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						
						<!-- 회원 상세 -->
						<div class="modal fade" id="adminGoodsDetail" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document"
								style="max-width: 600px;">
								<div class="modal-content" id="modal_ajax"
									style="text-align: left;">
								    		  <div class="modal-body">
								    		  
								</div>
								<div class="modal-footer">
									<!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
									<button type="button" class="btn btn-primary">수정</button>
									<button type="button" class="btn btn-success">삭제</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 회원 상세 끝 -->
						
					</div>
				</div>	
			</div>
		</div>
	</section>
	
<!-- //footer -->
<footer id="ft" class="ft">

   <div class="input-group rounded" style="justify-content: center; margin: 20px 0 20px 0">
        <select 
        	id="searchType" 
        	style="display: block; padding: 0.375rem 2.25rem 0.375rem 0.75rem; -moz-padding-start: calc(0.75rem - 3px); font-size: 1rem; font-weight: 400; line-height: 1.5; color: #212529; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; -webkit-appearance: none; -moz-appearance: none; appearance: none;">
            <option value="pId" ${"pId".equals(searchType) ? "selected" : ""}>상품코드</option>		
            <option value="pName" ${"pName".equals(searchType) ? "selected" : ""}>상품명</option>
        </select>
        <div id="search-pId" class="search-type">
            <form action="${pageContext.request.contextPath}/admin/adminGoodsFinder.do">
            	<div style="display: flex;">
                <input type="hidden" name="searchType" value="pId"/>
                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="상품코드를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'pId' eq searchType ? searchKeyword : ''}"/>
                <button type="submit" class="btn btn-outline-primary">search</button>		
            	</div>
            </form>	
        </div>
        <div id="search-pName" class="search-type" style="display: none;">
            <form action="${pageContext.request.contextPath}/admin/adminGoodsFinder.do">
            <div style="display: flex;">
                <input type="hidden" name="searchType" value="pName"/>
                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="상품명을 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" value="${'pName' eq searchType ? searchKeyword : ''}"/>
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
 
function goodsDetail_btn(pId) {
	
	console.log(pId);
	var id = pId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminGoodsDetail.do",
		data: {pId: id},
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

</script>

	<!-- //container -->


</body>
</html>

<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include> --%>