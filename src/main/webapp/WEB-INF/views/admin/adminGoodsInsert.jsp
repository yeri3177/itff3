<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminFrm.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">상품 등록</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
	    		<form
					action="${pageContext.request.contextPath}/admin/adminGoodsInsert.do?${_csrf.parameterName}=${_csrf.token}"
					name="goods_insert_frm"
					method="post"
					enctype="multipart/form-data">
		      
		      <div class="modal-body">
				  <div class="form-group">
				    <label for="exampleFormControlInput1">상품명</label>
				    <input type="text" name="pName" class="form-control" id="exampleFormControlInput1">
				  </div>
				  
				  <div class="form_side_container">
				  <div class="form-group">
				  <label for="exampleFormControlTextarea1">상품대표이미지</label>
					<div id="image_container">
						<img id="View1"/>
					</div>
					</div>
				  
					<div class="input_wrap">
						  <div class="form-group">
						    <label for="exampleFormControlInput1">상품가격</label>
						    <input type="number" name="pPrice" class="form-control" id="exampleFormControlInput1">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">상품설명</label>
						    <input type="text" class="form-control" name="pInfo" id="exampleFormControlTextarea1" rows="3" style="height: 100px;"/>
						  </div>
						  
						  <div class="form-group">
						   <label for="exampleFormControlTextarea1">상품이미지</label>
							<div class="input-group-prepend">
							  </div>
							  <div class="custom-file">
							  	<input type="hidden" name="pImg" value="" />
							    <input type="file" name="upFile" class="custom-file-input" id="inputGroupFile01" accept="image/*">
							    <label class="custom-file-label" for="inputGroupFile01">파일을 선택하세요.</label>
							  </div>
							</div>
							
						  <div class="form-group">
						    <label for="exampleFormControlSelect1">카테고리</label>
						    <select class="form-control" id="exampleFormControlSelect1" name="pCategory">
						      <option value="">선택</option>
						      <option value="의류">의류</option>
						      <option value="홈데코/리빙">홈데코/리빙</option>
						      <option value="폰케이스/테크">폰케이스/테크</option>
						    </select>
						    </div>
						
						  <div class="form-group">
						    <label for="exampleFormControlSelect1"> 세부 카테고리</label>
							 <input type="text" name="pSubcategory" class="form-control" id="exampleFormControlInput1">
						  </div>
						</div>

				 	 </div>
		    	  </div>
				      
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-outline-secondary">등록</button>
		        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
		      </div>
		      
		     </form>
		     
<script>

//파일명 바꾸기 & 이미지 이름
$(() => {
	$("#inputGroupFile01").change((e) => {
		
		// 1.파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
		console.dir(e.target);
		console.log(file);
		console.log(filename);
		
		// 2.label에 설정하기
		const $label = $(e.target).next();
		console.log($label);
		
		if(file != undefined) {
			$label.html(filename);
			$("[name=pImg]").val(filename);			
		}
	});	
});

</script>

<script>

//사진 미리보기
$(function() {
 $("#inputGroupFile01").on('change', function(){
 readURL1(this);
 });
});
function readURL1(input) {
 if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
     $('#View1').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
 }
}

</script>