<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">포인트 지급</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		      <div class="point_notice">
		      	<span><strong>${member.name }</strong>님의 현재 포인트는 <strong class="strong_blue">${member.point }</strong>점 입니다.</span>
		      </div>
		      
  				<form
					action="${pageContext.request.contextPath}/admin/adminMemberPoint.do?${_csrf.parameterName}=${_csrf.token}"
					name="member_point_frm"
					method="post">
		      <div class="modal-body">
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				    <tr>
				      <th scope="row">지급사유</th>
				      <td>
				      	<input class="form-control" name="reason" type="text">
				      	<input type="hidden" name="id" value="${member.id }"/>
				      	<input type="hidden" name="point" value="${member.point }"/>
				      </td>
				      </tr>
				      <tr>
				      <th scope="row">지급포인트</th>
				      <td><input class="form-control" name="change" type="text"></td>
				    </tr>
				  </tbody>
				</table>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary">포인트지급</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
			    </form>