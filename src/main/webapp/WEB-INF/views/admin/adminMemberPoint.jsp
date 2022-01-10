<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalLabel">포인트 지급</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		      <div class="point_notice">
		      	<span><strong>${member.name }</strong>님의 현재 포인트는 <strong class="strong_blue">${member.point }</strong>점 입니다.</span>
		      </div>
		      
  				<form
					action="${pageContext.request.contextPath}/admin/adminMemberPoint.do?${_csrf.parameterName}=${_csrf.token}"
					name="member_point_frm"
					id="member_point_frm"
					method="post">
		      <div class="modal-body">
<!-- 		        <h5 class="detail-modal-title" id="exampleModalLabel">회원정보</h5> -->
		        <table class="table" id="modal_table">
				  <tbody>
				    <tr>
				      <th scope="row">지급사유</th>
				      <td>
				      	<input class="form-control" name="reason" type="text">
				      	<input type="hidden" name="id" class="memberId" value="${member.id }"/>
				      	<input type="hidden" name="point" value="${member.point }"/>
				      </td>
				      </tr>
				      <tr>
				      <th scope="row">지급포인트</th>
				      <td><input class="form-control" name="change" id="point" type="text"></td>
				    </tr>
				  </tbody>
				</table>
		      </div>
		      
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary">포인트지급</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
			    </form>

<script>

$('#member_point_frm').submit(function(e){
    let type = '포인트지급';
    let target = $('.memberId').val();
    let point = $('#point').val();
    let content = '[ITFF] '+point+'포인트가 지급되었습니다.'
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