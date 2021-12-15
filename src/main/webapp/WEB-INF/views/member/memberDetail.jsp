<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.spring.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원정보" name="title"/>
</jsp:include>
<style>
div#update-container{width:400px; margin:0 auto; text-align:center;}
div#update-container input, div#update-container select {margin-bottom:10px;}
</style>


<div id="update-container">
	<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
		<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="id" id="id" value="${loginMember.id}" readonly required/>
		<input type="text" class="form-control" placeholder="이름" name="name" id="name" value="${loginMember.name}" required/>
		<input type="date" class="form-control" placeholder="생일" name="birthday" id="date" value="<fmt:formatDate value="${loginMember.birthday}" pattern="yyyy-MM-dd"/>" />
		<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="${loginMember.email}" required/>
		<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="${loginMember.phone}" required/>
		<input type="text" class="form-control" placeholder="주소" name="address" id="address" value="${loginMember.address}" />
		<select class="form-control" name="gender" required>
		  <option value="" disabled selected>성별</option>
		  <option value="M" <c:if test="${'M' eq loginMember.gender}">selected</c:if> >남</option>   <!-- 여긴 selected -->
		  <option value="F" ${'F' eq loginMember.gender ? 'selected' : ''}>여</option>               <!-- 여긴 'selected' -->
		</select>
		<div class="form-check-inline form-check">
			취미 : &nbsp;                                      <!-- 취미가 배열에 담겨있는데, 각 체크박스들의 value가 이 취미배열에 포함되어있으면 checked를 해야 한다. 근데 어떻게 해야할지 도저히 모르겠어서 예리님거 보니까 Arrays.toString이었다. 이게 되는거였나? -->
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby0" value="운동" ${Arrays.toString(loginMember.hobby).contains('운동') ? 'checked' : ''} >
			<label for="hobby0" class="form-check-label" >운동</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby1" value="등산" ${Arrays.toString(loginMember.hobby).contains('등산') ? 'checked' : ''} >
			<label for="hobby1" class="form-check-label" >등산</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby2" value="독서" ${Arrays.toString(loginMember.hobby).contains('독서') ? 'checked' : ''} >
			<label for="hobby2" class="form-check-label" >독서</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby3" value="게임" ${Arrays.toString(loginMember.hobby).contains('게임') ? 'checked' : ''} >
			<label for="hobby3" class="form-check-label" >게임</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby4" value="여행" ${Arrays.toString(loginMember.hobby).contains('여행') ? 'checked' : ''} >
			<label for="hobby4" class="form-check-label" >여행</label>&nbsp;
		</div>
		<br />
		<input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
		<input type="reset" class="btn btn-outline-success" value="취소">
	</form>
</div>
<script>
console.log("now is = ${now}");   /* 멤버컨트롤러의 멤버디테일의 MapAndView에 넣어둔 now */
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>




<%-- 선생님 풀이

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.spring.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	/* List.contains메소드를 사용하기 위해 String[] => List로 형변환함.  */
	String[] hobby = ((Member)session.getAttribute("loginMember")).getHobby();
	List<String> hobbyList = (hobby != null) ? Arrays.asList(hobby) : null;
	pageContext.setAttribute("hobbyList", hobbyList);
%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원정보" name="title"/>
</jsp:include>
<style>
div#update-container{width:400px; margin:0 auto; text-align:center;}
div#update-container input, div#update-container select {margin-bottom:10px;}
</style>
<div id="update-container">
	<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
		<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="id" id="id" value="${loginMember.id}" readonly required/>
		<input type="text" class="form-control" placeholder="이름" name="name" id="name" value="${loginMember.name}" required/>
		<input type="date" class="form-control" placeholder="생일" name="date" id="date" value='<fmt:formatDate value="${loginMember.birthday}" pattern="yyyy-MM-dd"/>'/>
		<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="${loginMember.email}" required/>
		<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="${loginMember.phone}" required/>
		<input type="text" class="form-control" placeholder="주소" name="address" id="address" value="${loginMember.address}"/>
		<select class="form-control" name="gender" required>
		  <option value="" disabled selected>성별</option>
		  <option value="M" ${loginMember.gender eq 'M' ? 'selected' : ''}>남</option>
		  <option value="F" ${loginMember.gender eq 'F' ? 'selected' : ''}>여</option>
		</select>
		<div class="form-check-inline form-check">
			취미 : &nbsp; 
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby0" value="운동" ${hobbyList.contains("운동") ? "checked" : ""}>
			<label for="hobby0" class="form-check-label" >운동</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby1" value="등산" ${hobbyList.contains("등산") ? "checked" : ""}>
			<label for="hobby1" class="form-check-label" >등산</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby2" value="독서" ${hobbyList.contains("독서") ? "checked" : ""}>
			<label for="hobby2" class="form-check-label" >독서</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby3" value="게임" ${hobbyList.contains("게임") ? "checked" : ""}>
			<label for="hobby3" class="form-check-label" >게임</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby4" value="여행" ${hobbyList.contains("여행") ? "checked" : ""}>
			<label for="hobby4" class="form-check-label" >여행</label>&nbsp;
		</div>
		<br />
		<input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
		<input type="reset" class="btn btn-outline-success" value="취소">
	</form>
</div>
<script>
console.log("now = ${now}");
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

--%>