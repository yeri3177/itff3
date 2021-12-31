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
		        <h4 class="modal-title" id="exampleModalLabel">${movie.titleKor }(${movie.titleEng })</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
    		  <div class="modal-body" style="width: 970px;">
	    		  <div>
	    		  <div style="display: flex; justify-content: space-between;">
		    		  <c:forEach items="${date }" var="date">
		    		  	<input type="hidden" value="${movieId }" />
		    		  	<button 
		    		  		type="button" 
		    		  		class="btn btn-outline-dark"
		    		  		style="border-radius: 0;"
		    		  		onclick="one_movie_schedule_date_btn('${date}', '${movieId }');">
		    		  		${date }
		    		  	</button>
		    		  </c:forEach>
	    		  </div>
		    		  <div id="modal_ajax3" class="list-group">
		    		  
		    		  </div>
	    		  </div>
			</div>
			
		      <div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		      
<script>

// 시간표
function one_movie_schedule_date_btn(date, movieId) {
	
	console.log(date);
	console.log(movieId);
	
	var start = date;
	var id = movieId;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminOneMovieScheduleDate.do",
		data: {movieId: id,startDate: start},
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax3").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
}

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