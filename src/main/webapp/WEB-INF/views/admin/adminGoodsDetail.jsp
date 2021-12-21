<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">상품 정보</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    		  <div class="modal-body">
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">상품 상세</h5> -->
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
						   <tr>
						     <th scope="row">가격</th>
						     <td><fmt:formatNumber value="${goods.PPrice }" pattern="#,###" /></td>
						   </tr>
						   <tr>
						     <th scope="row">상품설명</th>
						     <td>${goods.PInfo }</td>
						   </tr>
						   <tr>
						     <th scope="row">분류</th>
						     <td>${goods.PCategory }</td>
						   </tr>
						   <tr>
						     <th scope="row">등록일자</th>
						     <td><fmt:formatDate value="${goods.PEnroll }" pattern="yyyy-MM-dd"/></td>
						   </tr>
					  </tbody>
					</table>
		      </div>
		      <div class="modal-footer">
<!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
		      	<button type="button" class="btn btn-success">수정</button>
		        <button type="button" class="btn btn-danger">삭제</button>
		      </div>