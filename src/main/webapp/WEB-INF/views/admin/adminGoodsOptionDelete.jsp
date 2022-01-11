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
		        <h4 class="modal-title" id="exampleModalLabel">옵션 삭제</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    	    <form
				action="${pageContext.request.contextPath}/admin/adminGoodsOptionDelete.do?${_csrf.parameterName}=${_csrf.token}"
				name="goods_delete_frm"
				method="post">
		      
    		  <div class="modal-body">
    		  	<input type="hidden" name="optionId" value="${optionDetail.optionId }" />
					<table class="table">
					  <tbody>
						  <tr>
						      <th scope="row">이미지</th>
						      <td><div class="img" style="height: 120px; background-image: url(${pageContext.request.contextPath}/resources/upload/goods/${optionDetail.optionImg })"></div></td>
						  </tr>
						   <tr>
						     <th scope="row">옵션코드</th>
						     <td>${optionDetail.optionId }</td>
						   </tr>
						   <tr>
						     <th scope="row">타입</th>
						     <td>${optionDetail.optionType }</td>
						   </tr>
						   <tr>
						     <th scope="row">색상</th>
						     <td>${optionDetail.optionColor }</td>
						   </tr>
						   <tr>
						     <th scope="row">사이즈</th>
						     <td>${optionDetail.optionSize }</td>
						   </tr>
						   <tr>
						     <th scope="row">수량</th>
						     <td>${optionDetail.optionStock }</td>
						   </tr>
					  </tbody>
					</table>
					<p class="recheck">정말 삭제하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
				<button type="submit" class="btn btn-danger">삭제</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
			</form>
			
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