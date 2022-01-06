<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">상품정보</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    		  <div class="modal-body">
					<table class="table">
					  <tbody>
						  <tr>
						      <th scope="row" style="width: 100px;">상품이미지</th>
						      <td><div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${goods.PImg })"></div></td>
						  </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">상품번호</th>
						     <td>${goods.PId }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">상품명</th>
						     <td>${goods.PName }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">가격</th>
						     <td><fmt:formatNumber value="${goods.PPrice }" pattern="#,###" /></td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">상품설명</th>
						     <td>${goods.PInfo }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">대분류</th>
						     <td>${goods.PCategory }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 120px;">소분류</th>
						     <td>${goods.PSubcategory }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">등록일자</th>
						     <td><fmt:formatDate value="${goods.PEnroll }" pattern="yyyy-MM-dd"/></td>
						   </tr>
					  </tbody>
					</table>
		      </div>
		      <div class="modal-footer">
<!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
		      	<button 
		      		type="button" 
		      		class="btn btn-outline-secondary"
		      		data-toggle="modal"
					data-target="#adminGoodsUpdate"
					onclick="goodsUpdate_btn('${goods.PId}');">수정</button>
		        <button 
		        	type="button" 
		        	class="btn btn-outline-secondary"
  			      	data-toggle="modal"
					data-target="#adminGoodsDelete"
					onclick="goodsDelete_btn('${goods.PId}');">삭제</button>
		      </div>

<script>

// 파일명 바꾸기 & 이미지 이름
$(() => {
	$("[name=upFile]").change((e) => {
		
		// 1.파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
		console.dir(e.target);
		console.log(file);
		console.log(filename);
		
		// 2.label에 설정하기
		const $label = $(e.target).next();
		console.log($label);
		
		if(file != undefined)
			$label.html(filename);
		else
			$label.html("파일을 선택하세요.");	
	});	
		$("[name=pImg]").val(filename);
});

</script>