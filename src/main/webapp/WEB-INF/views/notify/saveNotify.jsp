<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<div class="modal-content" style="text-align: left;">
	   	<div class="modal-body" id="modal_ajax4">
											    		  									
		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">알림전송</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
  				<form name="member_point_frm">
		      <div class="modal-body">
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				      <tr>
				      <td>
				      <input type="hidden" class="modal-body input" name="target" value="${member.id }" />
				      <textarea class="form-control modal-body textarea" id="exampleFormControlTextarea1" name="content" rows="3"></textarea>
				      </td>
				    </tr>
				  </tbody>
				</table>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="submit" id="notifySendBtn" class="btn btn-dark">알림 전송</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
			    </form>
		</div>			
	</div>
	
	<script>

	$('#notifySendBtn').click(function(e){
	    let modal = $('.modal-content').has(e.target);
	    let type = '개인메세지';
	    let target = modal.find('.modal-body input').val();
	    let content = modal.find('.modal-body textarea').val();
	    let url = '${contextPath}/notify/saveNotify.do';
	    
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
	        	socket.send("관리자,"+target+","+content+","+url)

	    });
	    modal.find('.modal-body textarea').val('');	// textarea 초기화
	});

	</script>