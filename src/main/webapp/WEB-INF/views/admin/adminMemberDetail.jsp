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
		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5>
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
		        <h5 class="detail-modal-title" id="exampleModalLabel">포인트 이력</h5>
					<table class="table">
					  <thead>
					  <c:choose>
					  <c:when test="${not empty list}">
					    <tr>
					      <th scope="col" style="color:#212121;">이력번호</th>
					      <th scope="col" style="color:#212121;">날짜</th>
					      <th scope="col" style="color:#212121;">내용</th>
					      <th scope="col" style="color:#212121;">내역</th>
					      <th scope="col" style="color:#212121;">포인트</th>
					    </tr>
					  </c:when>
					  <c:otherwise>
					  	<p style="margin-top: 20px;">포인트 내역이 없습니다.</p>
					  </c:otherwise>
					  </c:choose>

					  </thead>
					  <tbody>
					  <c:forEach items="${list }" var="list">
					    <tr>
					      <th scope="row">${list.historyNo }</th>
					      <td><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></td>
					      <td>${list.reason }</td>
					      <td>${list.change }</td>
					      <td><fmt:formatNumber value="${list.point }" pattern="#,###" /></td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
		      </div>
		      <div class="modal-footer">
<!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				<button 
					type="button" 
		      		class="btn btn-dark"
		      		data-toggle="modal"
					data-target="#adminSaveNotify"
					onclick="save_btn('${member.id}');">알림 전송</button>
		      	<button 
		      		type="button" 
		      		class="btn btn-primary"
		      		data-toggle="modal"
					data-target="#adminMemberPoint"
					onclick="memberPoint_btn('${member.id}');">포인트 지급</button>
		        <button 
		        	type="button" 
		        	class="btn btn-success" 												
		        	data-toggle="modal"
					data-target="#adminMemberUpdate"
					onclick="memberUpdate_btn('${member.id}');">회원 정보 수정</button>
		       <c:if test="${member.enabled eq true }">
		        <button 
		        	type="button" 
		        	class="btn btn-danger" 												
		        	data-toggle="modal"
					data-target="#adminMemberCut"
					onclick="member_cut_btn('${member.id}');">차단</button>
		       </c:if>
		       <c:if test="${member.enabled eq false }">
		        <button 
		        	type="button" 
		        	class="btn btn-danger" 												
		        	data-toggle="modal"
					data-target="#adminMemberUnblock"
					onclick="member_unblock_btn('${member.id}');">차단해제</button>
		       </c:if>
					
		      </div>