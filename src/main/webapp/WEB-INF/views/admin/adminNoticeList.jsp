<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.apache.tomcat.util.net.openssl.ciphers.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminList.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!--  
<style>
div#search-id {display: ${searchType} == '' || ${searchType} == null || "id".equals(${searchType}) ? "inline-block" : "none"; }
div#search-name {display: "name".equals(${searchType}) ? "inline-block" : "none";}
</style>
-->

<!-- 굿즈 nav -->
<jsp:include page="/WEB-INF/views/admin/common/adminNoticeNavBar.jsp"></jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

		<div class="container">	
		
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">공지사항 조회</h2>
				</div>
			</div>
			
			<div class="search-total-total">
			<div class="row" id="row">
				<div class="col-md-12">
					<div class="table-wrap">
					
					<!-- 
					<div class="search-total">
						<div class="input-group rounded">
					        <select 
					        	id="searchType" 
					        	class="custom-select"
					        	style="display: block; padding: 0.375rem 2.25rem 0.375rem 0.75rem; -moz-padding-start: calc(0.75rem - 3px); font-size: 1rem; font-weight: 400; line-height: 1.5; color: #212529; border: 1px solid #ced4da; border-radius: 0.25rem; transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out; -webkit-appearance: none; -moz-appearance: none; appearance: none; width: 150px;">
					            <option value="id" ${"id".equals(searchType) ? "selected" : ""}>아이디</option>		
					            <option value="name" ${"name".equals(searchType) ? "selected" : ""}>회원명</option>
					        </select>
					        <div id="search-id" class="search-type" style="width: 500px !important;">
					            <form action="${pageContext.request.contextPath}/admin/adminMemberFinder.do">
					            	<div style="display: flex;">
					                <input type="hidden" name="searchType" value="id"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="ID를 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" placeholder="검색할 아이디를 입력하세요." value="${'id' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-primary">search</button>		
					            	</div>
					            </form>	
					        </div>
					        <div id="search-name" class="search-type" style="display: none;">
					            <form action="${pageContext.request.contextPath}/admin/adminMemberFinder.do">
					            <div style="display: flex;">
					                <input type="hidden" name="searchType" value="name"/>
					                <input type="search" name="searchKeyword"  class="form-control rounded" placeholder="이름을 입력하세요." aria-label="Search" aria-describedby="search-addon" size="25" placeholder="검색할 이름을 입력하세요." value="${'name' eq searchType ? searchKeyword : ''}" style="margin: 0 auto;"/>
					                <button type="submit" class="btn btn-outline-primary">search</button>		
					            </div>
					            </form>	
					        </div>
					    </div>
					</div>
					 -->
					    
					<table class="table">
						<thead class="thead-primary">
							<tr>
								<th>&nbsp;</th>
								<th>글번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr class="alert" role="alert" data-no="${notice.noticeNo}">

									<td></td>

									<!-- 글번호 -->
									<td>
										<div class="email" data-id="${list.noticeNo }">
											<span>${list.noticeNo }</span> 
											<input type="hidden" name=id${status.index} value="${noticeNo }" />
										</div>
									</td>

									<!-- 제목 -->
									<td>
										<div class="email">
											<span>${list.noticeTitle }</span>
										</div>
									</td>

									<!-- 작성일 -->
									<td>
										<div class="email">
											<span><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd" /></span>
										</div>
									</td>

									<td>
										<button 
											type="button"
											class="btn btn-secondary" 
											data-toggle="modal"
											data-target="#adminNoticeDetail"
											onclick="notice_detail_btn('${list.noticeNo}');">상세</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>

					<!-- 회원 상세 -->
					<div class="modal fade" id="adminNoticeDetail" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document"
							style="max-width: 800px;">
							<div class="modal-content" style="text-align: left;">
							   	<div class="modal-body" id="modal_ajax1">
							    		  
								</div>

								</div>
							</div>
						</div>
						<!-- 회원 상세 끝 -->
					
					</div>
				</div>
			</div>
		</div>
	        
<!-- //container -->

${pagebar}

<!-- 
<script>
// 검색
$("#searchType").change((e) => {
	// e.target 이벤트발생객체 -> #searchType
	const type = $(e.target).val();
	
	// 1. .search-type 감추기
	$(".search-type").hide();
	
	// 2. #search-${type} 보여주기(display:inline-block)
	$(`#search-\${type}`).css("display", "inline-block");
});
</script>
 -->
	
<script>

// 공지사항 상세
function notice_detail_btn(noticeNo) {
	
	console.log(noticeNo);
	var no = noticeNo;

	$.ajax({
		url:"${pageContext.request.contextPath}/admin/adminNoticeDetail.do",
		data: {noticeNo: no},
		method: "get",
		contentType: "application/json",
		dateType: "text",
		success: function(data) {
			$("#modal_ajax1").html(data);
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

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>