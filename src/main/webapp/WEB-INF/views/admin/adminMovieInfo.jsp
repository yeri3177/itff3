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
		        <h4 class="modal-title" id="exampleModalLabel">작품정보</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    		  <div class="modal-body" style="display: flex; align-items: center;">
    		  <div>
				<div class="img" style="width: 290px; height: 400px; margin-right: 20px; background-image: url(${pageContext.request.contextPath}/resources/upload/poster/${movie.image })"></div>
    		  </div>
					<table class="table">
					  <tbody>
						  <tr>
						   <tr>
						     <th scope="row" style="width: 100px;">작품명</th>
						     <td><strong>${movie.titleKor }</strong>, ${movie.titleEng }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">작품설명</th>
						     <td>${movie.description }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">개봉</th>
						     <td><fmt:formatDate value="${movie.openingDate }" pattern="yyyy-MM-dd"/></td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">출연배우</th>
						     <td>${movie.actors }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">장르</th>
						     <td>${movie.genre }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">러닝타임</th>
						     <td>${movie.runningTime }</td>
						   </tr>
						   <tr>
						     <th scope="row" style="width: 100px;">등급</th>
						     <td>${movie.ageLimit }</td>
						   </tr>
					  </tbody>
					</table>
		      </div>
		      <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>