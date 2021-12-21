<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">회원정보</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <h5 class="modal-title" id="exampleModalLabel">회원정보</h5>
		        <table class="table" id="modal_table">
				  <tbody>
				    <tr>
				      <th scope="row">회원ID</th>
				      <td>${member.id }</td>
				      <th scope="row">닉네임</th>
				      <td>${member.nickname }</td>
				    </tr>
				    <tr>
				      <th scope="row">이름</th>
				      <td>${member.name }</td>
				      <th scope="row">연락처</th>
				      <td>${member.phone }</td>
				    </tr>
				    <tr>
				      <th scope="row">이메일</th>
				      <td>${member.email }</td>
				      <th scope="row">생년월일</th>
				      <td><fmt:formatDate value="${member.birthday }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				    <tr>
				      <th scope="row">주소</th>
				      <td>${member.address }</td>
				      <th scope="row">가입일자</th>
				      <td><fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd"/></td>
				    </tr>
				  </tbody>
				</table>
		      </div>
		      
		      <!-- 포인트 이력 -->
    		  <div class="modal-body">
		        <h5 class="modal-title" id="exampleModalLabel">포인트 이력</h5>
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">이력번호</th>
					      <th scope="col">날짜</th>
					      <th scope="col">내용</th>
					      <th scope="col">내역</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${list }" var="list">
					    <tr>
					      <th scope="row">${list.historyNo }</th>
					      <td><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></td>
					      <td>${list.reason }</td>
					      <td>${change }</td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="history.back()">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>