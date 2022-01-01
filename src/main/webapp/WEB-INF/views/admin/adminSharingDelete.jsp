<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">게시글 삭제</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div>
		      
 			<form 
				name="boardFrm"
				action="${pageContext.request.contextPath}/admin/adminSharingDelete.do?${_csrf.parameterName}=${_csrf.token}"
				method="POST"
				enctype="multipart/form-data">
				
		      <div class="modal-body">
		      	<input type="hidden" name="no" value="${sharing.no}" id="no" />
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
				<span>정말 삭제하시겠습니까?</span>
		      </div>
		      
		      <div class="modal-footer">
		      	<input type="submit" class="btn btn-danger" value="삭제">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		      
		     </form>
		      </div>