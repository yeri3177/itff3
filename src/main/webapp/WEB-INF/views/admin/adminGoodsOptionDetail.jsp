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
		        <h4 class="modal-title" id="exampleModalLabel">상품 옵션 정보</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    		  <div class="modal-body">
    		  
    		  	<div>
					<table class="table">
					  <tbody>
						  <tr>
						      <th scope="row">상품이미지</th>
						      <td><div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${goods.PImg })"></div></td>
						  </tr>
						   <tr>
						     <th scope="row">상품번호</th>
						     <td>${goods.PId }</td>
						   </tr>
						   <tr>
						     <th scope="row">상품명</th>
						     <td>${goods.PName }</td>
						   </tr>
						  </tbody>
						</table>
    		  		</div>
						<hr />
						<div style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: space-evenly; align-items: center;">
						
						<c:forEach items="${optionDetail }" var="od">
						<div style="margin-bottom: 30px; border: 1px solid whitesmoke; padding: 15px;">
						  
						<table class="table" style="width: 300px !important;">
					  	  <tbody>
						   <tr>
						     <th scope="row">옵션별 이미지</th>
						     <td><div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${od.optionImg })"></div></td>
						   </tr>
						   <tr>
						     <th scope="row">옵션코드</th>
						     <td>${od.optionId }</td>
						   </tr>
						   <tr>
						     <th scope="row">타입</th>
						     <td>${od.optionType }</td>
						   </tr>
						   <tr>
						     <th scope="row">색상</th>
						     <td>${od.optionColor }</td>
						   </tr>
						   <tr>
						     <th scope="row">색상코드</th>
						     <td>${od.optionRgb }</td>
						   </tr>
						   <tr>
						     <th scope="row">크기</th>
						     <td>${od.optionSize }</td>
						   </tr>
						   <tr>
						     <th scope="row">수량</th>
						     <td>${od.optionStock }</td>
						   </tr>
						  </tbody>
						</table>
						<div style="text-align: center;">
					   <button
				      		id="option_update_select_btn" 
				      		type="button" 
				      		class="btn btn-outline-secondary"
				      		data-toggle="modal"
							data-target="#adminGoodsOptionUpdate"
							onclick="goods_option_update_btn('${od.optionId}');"
							style="font-size: 12px;">수정</button>
						<button 
				        	type="button" 
				        	class="btn btn-outline-secondary"
		  			      	data-toggle="modal"
							data-target="#adminGoodsOptionDelete"
							onclick="goods_option_delete_btn('${od.optionId}');"
							style="font-size: 12px;">삭제</button>
						</div>
						</div>
					</c:forEach>
					
				</div>
				
		      </div>
		      <div class="modal-footer">
		      	<button 
		      		type="button" 
		      		class="btn btn-info"
		      		data-toggle="modal"
					data-target="#adminGoodsOptionInsert"
					onclick="goods_option_insert_btn('${goods.PId }');">옵션등록</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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