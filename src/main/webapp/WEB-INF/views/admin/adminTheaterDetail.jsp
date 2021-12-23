<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminTheaterInfo.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">${theaterId }관 좌석정보</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
  	  <div class="modal-body" style="display: flex; align-items: center; background-color: rgb(64, 64, 64) !important;">
    	<div class="container" style="text-align: -webkit-center;">
		  <div></div>
		  <div class="row_seat">

	      <c:forEach items="${seats }" var="seat" varStatus="vs">
		    <div class="seat" style="color:white; background-color: ${seat.isBooked eq 1 ? 'lightgray' : 'rgb(127, 127, 127)'}">
		      <div>${seat.seatNo }</div>
		    </div>
   		    <c:if test="${fn:endsWith(seat.seatNo, '3')}">
		    	<div style="width: 40px; height: 40px;"></div>
		    </c:if>
		    <c:if test="${fn:endsWith(seat.seatNo, '6')}">
		    	<br>
		    </c:if>
		      </c:forEach>
		    </div>
		      <div></div>
		  </div>
		</div>
      <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>