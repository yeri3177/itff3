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
		        <h4 class="modal-title" id="exampleModalLabel">옵션 삭제</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    	    <form
				action="${pageContext.request.contextPath}/admin/adminGoodsOptionDelete.do?${_csrf.parameterName}=${_csrf.token}"
				name="goods_delete_frm"
				method="post">
		      
    		  <div class="modal-body">
    		  	<input type="hidden" name="optionId" value="${optionDetail.optionId }" />
					<table class="table">
					  <tbody>
						  <tr>
						      <th scope="row">이미지</th>
						      <td><div class="img" style="height: 120px; background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${optionDetail.optionImg })"></div></td>
						  </tr>
						   <tr>
						     <th scope="row">옵션코드</th>
						     <td>${optionDetail.optionId }</td>
						   </tr>
						   <tr>
						     <th scope="row">타입</th>
						     <td>${optionDetail.optionType }</td>
						   </tr>
						   <tr>
						     <th scope="row">색상</th>
						     <td>${optionDetail.optionColor }</td>
						   </tr>
						   <tr>
						     <th scope="row">사이즈</th>
						     <td>${optionDetail.optionSize }</td>
						   </tr>
						   <tr>
						     <th scope="row">수량</th>
						     <td>${optionDetail.optionStock }</td>
						   </tr>
					  </tbody>
					</table>
					<p class="recheck">정말 삭제하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
				<button type="submit" class="btn btn-danger">삭제</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
			</form>