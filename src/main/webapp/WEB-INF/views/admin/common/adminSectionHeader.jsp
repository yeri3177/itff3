<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminHeader.css"/>

	<div id="hd" class="hd">
		<div>
			<img src="https://i.imgur.com/b12DKk5.png" alt="logo" class="adminLogo" />
		</div>

		<ul class="nav navbar-nav nav-pull-right" group-state-code="layout" action-id="gnb.account">
			<li class="notify_li" id="notify" onclick="location.href='${pageContext.request.contextPath}/admin/adminNotify.do';">
				<input type="hidden" class="id" value="<sec:authentication property="principal.id"/>" />
			</li>
			
			<!---->
			<li ng-if="vm.loginInfo">
				<a href="${pageContext.request.contextPath}/member/memberDetail.do">
				<span class="my-info">MYPAGE</span>
				</a>
			</li>

			<li ng-if="vm.loginInfo">
				<form:form
	    		id="memberLogoutFrm"
	    		method="POST"
	    		action="${pageContext.request.contextPath}/member/memberLogout.do">
		    	<button class="logout_btn" type="submit">
				<span class="my-info">LOGOUT</span>		    	
		    	</button>
			   </form:form>
			</li>
		</ul>

	</div>
	
<script>

//알림 수
$(document).ready(function () {
	var mid = $(".id").val();
	console.log(mid)
	
	$.ajax({
		url:"${pageContext.request.contextPath}/notify/notifyCount.do",
		method: "get",
		contentType: "application/json",
		data: {id: mid},
		dateType: "text",
		success: function(data) {
			$("#notify").html(data);
		},
		complete: function() {
			console.log("complete")
		}
	});
});

</script>