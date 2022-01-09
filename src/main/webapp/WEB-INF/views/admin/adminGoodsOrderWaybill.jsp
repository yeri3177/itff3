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
		        <h5 class="modal-title" id="exampleModalLongTitle">운송장 등록</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
	    		<form
					action="${pageContext.request.contextPath}/admin/adminGoodsOrderWaybill.do?${_csrf.parameterName}=${_csrf.token}"
					name="goods_option_update_frm"
					method="post">
		      
		      <div class="modal-body">
				  
					<div class="input_wrap" style="margin-left: 20px; display: flex; flex-direction: row; justify-content: space-around;">
					
						  <div class="form-group" style="display: flex; flex-direction: column;">
						    <input type="hidden" name="orderDetailNo" value="${orderDetailNo }">

						    <label for="exampleFormControlInput1">택배회사</label>
	 							<select class="form-select order_select" id="exampleFormControlInput1" name="delivery" aria-label="Default select example">
								  <option selected>선택</option>
								  <option value="우체국택배">우체국택배</option>
								  <option value="CJ대한통운">CJ대한통운</option>
								  <option value="한진택배">한진택배</option>
								  <option value="롯데택배">롯데택배</option>
								  <option value="로젠택배">로젠택배</option>
								</select>
						  </div>
				  
						  <div class="form-group">
						    <label for="exampleFormControlInput1">운송장번호</label>
						    <input type="text" name="waybill" class="form-control order_select" id="exampleFormControlInput1" style="border: 1px solid whitesmoke; border-radius: 0;">
						  </div>

						  </div>

						  
						</div>
				      
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-outline-secondary">등록</button>
		        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
		      </div>
		      
		     </form>