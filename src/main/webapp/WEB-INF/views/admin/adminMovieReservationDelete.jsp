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
		        <h4 class="modal-title" id="exampleModalLabel">예매취소</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    	    <form
				action="${pageContext.request.contextPath}/admin/adminMovieReservationDelete.do?${_csrf.parameterName}=${_csrf.token}"
				name="goods_delete_frm"
				method="post">
		      
    		  <div class="modal-body">
    		  	<input type="hidden" name="movieReservationId" value="${movieReservation.movieReservationId }" />
					<table class="table">
					  <tbody>
						   <tr>
						     <th scope="row">예매일자</th>
						     <td><fmt:formatDate value="${movieReservation.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
						   </tr>
						   <tr>
						     <th scope="row">예매번호</th>
						     <td>${movieReservation.movieReservationId}</td>
						   </tr>
						   <tr>
						     <th scope="row">아이디</th>
						     <td>${movieReservation.memberId }</td>
						   </tr>
						   <tr>
						     <th scope="row">예매영화</th>
						     <td>${movieReservation.titleKor }</td>
						   </tr>
						   <tr>
						     <th scope="row">상영일자</th>
						     <td>
 								${movieReservation.startDate }
								${movieReservation.startTime }
						     </td>
						   </tr>
						   <tr>
						     <th scope="row">좌석정보</th>
						     <td>
								${movieReservation.theaterId }관 
								${movieReservation.selectedSeat }
						     </td>
						   </tr>
					  </tbody>
					</table>
					<p class="recheck">예매를 취소하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
				<button type="submit" class="btn btn-danger">예매취소</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">돌아가기</button>
		      </div>
			</form>