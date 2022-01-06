<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminMovieReservationDetail.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">예매상세</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    		  <div class="modal-body">
				
				<div>
				<div style="background: url('${pageContext.request.contextPath }/resources/upload/poster/${movie.image}');"></div>

					<table class="table">
						<tbody>
						
						  <!-- 예매 정보 -->  
						  <tr>
						  	<th class="title_tr">예매정보</th>
						  	<td class="receiver" style="justify-content: flex-start;">	
							  	<button 
					      		type="button" 
					      		class="btn btn-outline-secondary orderUpdateBtn"
					      		data-toggle="modal"
								data-target="#adminMemberDetail"
								onclick="order_member_info_btn('${movieReservation.memberId }');">회원상세정보보기
								</button>	
							  	<button 
					      		type="button" 
					      		class="btn btn-outline-secondary orderUpdateBtn"
					      		data-toggle="modal"
								data-target="#adminMovieInfo"
								onclick="movieInfo_btn('${movieReservation.movieId }');">상영작정보보기
								</button>	
							</td>
						  </tr>
						  
						  <tr>
						  	<th class="title_th">예매번호</th>
						    <td class="receiver">${movieReservation.movieReservationId }</td>
						  	<th class="title_th">예매일자</th>
						    <td class="receiver"><fmt:formatDate value="${movieReservation.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
						  </tr>
						  
					  		<tr>
							  	<th class="title_th">아이디</th>
								<td class="receiver">
									${movieReservation.memberId }
								</td>
								<th class="title_th">예매영화</th>
								<td class="receiver">
									${movieReservation.titleKor }					
								</td>
						  	</tr>	

					  		<tr>
							  	<th class="title_th">상영일자</th>
								<td class="receiver">
									${movieReservation.startDate }
									${movieReservation.startTime }
								</td>
								<th class="title_th">좌석정보</th>
								<td class="receiver">
									${movieReservation.theaterId }관 
									${movieReservation.selectedSeat }					
								</td>
						  	</tr>	

						</tbody>					
					</table>					  
				</div>
				
					<!-- 결제 정보 -->
					<table class="table">
						<tbody> 
						
						  <tr>
							<th class="title_tr">결제 정보</th>
							<td></td>
						  </tr>
						  
						  <tr>
						  	<th class="title_th pay">결제금액</th>
							<td class="pay_td" style="font-weight: 700;"><fmt:formatNumber value="${movieReservation.amount }" pattern="#,###" /></td>
						  </tr>
						  
						</tbody>
					</table>
					
					 <!-- 좌석 정보 -->
					 <div class="seat_container">
					 <span class="arrangement">좌석배치도</span>
					<div class="row_seat">

				      <c:forEach items="${seats }" var="seat" varStatus="vs">
					    <div class="seat" style="color:white; background-color: ${seat.isBooked eq 1 ? '#ec7b65' : 'rgb(127, 127, 127)'}">
					      <div class="seatNo">${seat.seatNo }</div>
					    </div>
			   		    <c:if test="${fn:endsWith(seat.seatNo, '3')}">
					    	<div style="width: 40px; height: 40px;"></div>
					    </c:if>
					    <c:if test="${fn:endsWith(seat.seatNo, '6')}">
					    	<br>
					    </c:if>
					  </c:forEach>
					</div>
			      </div>
				</div>

		      <div class="modal-footer">
<!-- 		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->

		        <button 
		        	type="button" 
		        	class="btn btn-outline-secondary"
  			      	data-toggle="modal"
					data-target="#adminMovieReservationDelete"
					onclick="movie_reservation_delete_btn('${movieReservationId}');">예매취소</button>
		      </div>

<script>

//Bootstrap multiple modal
var count = 0; // 모달이 열릴 때 마다 count 해서  z-index값을 높여줌

$(document).on('show.bs.modal', '.modal', function () {
    var zIndex = 1040 + (10 * count);

    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);

    count = count + 1

});

// multiple modal Scrollbar fix
$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});

</script>