<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">회원 정보 수정</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
  				<form
					action="${pageContext.request.contextPath}/admin/adminMemberUpdate.do?${_csrf.parameterName}=${_csrf.token}"
					name="member_update_frm"
					method="post">
		      <div class="modal-body">
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				    <tr>
				      <th scope="row">회원ID</th>
				      <td>
				      	<input class="form-control" type="text" placeholder="Default input" value="${member.id }">
				      	<input type="hidden" name="id" value="${member.id }"/>
				      </td>
				      <th scope="row">닉네임</th>
				      <td><input class="form-control" name="nickname" type="text" placeholder="Default input" value="${member.nickname }"></td>
				    </tr>
				    <tr>
				      <th scope="row">이름</th>
				      <td><input class="form-control" id="disabledInput" type="text" value="${member.name }" placeholder="Disabled input here..." disabled></td>
				      <th scope="row">연락처</th>
				      <td><input class="form-control" name="phone" type="text" placeholder="Default input" value="${member.phone }"></td>
				    </tr>
				    <tr>
				      <th scope="row">이메일</th>
				      <td><input class="form-control" type="email" name="email" placeholder="Default input" value="${member.email }"></td>
				      <th scope="row">생년월일</th>
				      <td><input class="form-control" id="disabledInput" name="birthday" type="text" value="<fmt:formatDate value="${member.birthday }" pattern="yyyy-MM-dd"/>"  placeholder="Disabled input here..." disabled></td>
				    </tr>
				    <tr>
				      <th scope="row">주소</th>
				      <td><input class="form-control" type="text" name="address" placeholder="Default input" value="${member.address }"></td>
				      <th scope="row">가입일자</th>
				      <td><input class="form-control" id="disabledInput" type="text" value="<fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd"/>" placeholder="Disabled input here..." disabled></td>
				    </tr>
				  </tbody>
				</table>
		      </div>
		      
		      <div class="modal-footer">
<%-- 		        <button type="button" class="btn btn-primary" onclick="memberUpdate_btn2('${member.id}');">수정</button> --%>
		        <button type="submit" class="btn btn-primary">수정</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
			    </form>