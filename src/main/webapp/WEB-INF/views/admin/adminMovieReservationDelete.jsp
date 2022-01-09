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
				name="movie_reser_delete_frm"
				id="movie_reser_delete_frm"
				method="post">
		      
    		  <div class="modal-body">
    		  	<input type="hidden" name="movieReservationId" value="${movieReservation.movieReservationId }" />
    		  	<input type="hidden" name="memberId" class="memberId" value="${movieReservation.memberId }" />
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

<script>

$('#movie_reser_delete_frm').submit(function(e){
    let type = '예매취소';
    let target = $('.memberId').val();
    let content = '예매가 취소되었습니다.'
    let url = '${contextPath}/notify/saveNotify.do';
    	    
    console.log(type);
    console.log(target);
    console.log(content);
    console.log(url);
    
    // 전송한 정보를 db에 저장	
    $.ajax({
        type: "post",
        url:"${pageContext.request.contextPath}/notify/saveNotify.do",
        dataType: "text",
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        data: {
            target: target,
            content: content,
            type: type,
            url: url
        },
        beforeSend : function(xhr) {   
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success:    // db전송 성공시 실시간 알림 전송
            // 소켓에 전달되는 메시지
            // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다.
        	socket.send("ITFF,"+target+","+content+","+url)
//			console.log("관리자,"+target+","+content+","+url)

    });
});

</script>