<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css" />

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="title"/>
</jsp:include>

<!-- 제목 -->
<div class="sub_title_wrap">
	<div class="container">
		<h2 class="en">회원가입</h2>
	</div>
</div>

<!-- 메인 콘텐츠 -->
<div id="enroll-container" class="mx-auto text-center">
	<form 
		name="memberEnrollFrm" 
		action="${pageContext.request.contextPath}/member/memberEnroll.do" 
		method="post">
		<table>				
				<tr>
					<td>
						<div class="enrollLeft">아이디<sup>*</sup></div>
						<input type="text" name="userId" id="_userId" class="enrollInput" required/>
						
						<input type="button" value="중복검사" id="btnCheckId" onclick="checkIdDuplicate();" />
						<input type="hidden" id="idValid" value="0" />
					</td>
				</tr>
				<tr>
					<td>
						<div class="enrollLeft">비밀번호<sup>*</sup></div>
						<input type="password" name="password" id="_password" class="enrollInput1" required />
					</td>
				</tr>
				<tr>
					<td>
						<div class="enrollLeft">비밀번호 확인<sup>*</sup></div>
						<input type="password" id="password2" class="enrollInput1" required />
					</td>
				</tr>
				<tr>
					<td>
						<div class="enrollLeft">이메일<sup>*</sup></div> 
						<input type="text" name="emailId" id="emailId" class="enrollInput2" required> @ 
						<input type="text" name="emailAddress" id="emailAddress" class="enrollInput2" required readonly> 
						
						<select name="emailSelect" id="emailSelect" required>
							<option value="" disabled selected>이메일선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="enrollLeft">이름<sup>*</sup></div>
						<input type="text" name="userName" id="userName" class="enrollInput1" required />
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="enrollLeft">전화번호<sup>*</sup></div>
						<input type="text" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" class="enrollInput1" required />
					</td>
				</tr>
			
				<tr>
					<td>
						<div class="enrollLeft">생일</div>
						<input type="text" placeholder="년(4자)" name="birthyear" id="birthyear" maxlength="4" class="enrollInput3"/>
						<input type="number" placeholder="월" name="birthmonth" id="birthmonth" maxlength="2" class="enrollInput3"/>
						<input type="text" placeholder="일" name="birthday" id="birthday" maxlength="2" class="enrollInput3"/>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="enrollLeft">주소<sup>*</sup></div>
						<input id="member_post"  type="text" placeholder="주소검색" readonly onclick="findAddr()" class="enrollInput4"><br>
						<input id="member_addr" type="text" name="address1" id="address1" placeholder="도로명 주소" class="enrollInput5" readonly> <br>
						<input type="text" name="address2" id="address2" placeholder="상세 주소" class="enrollInput5">
					</td>
				</tr>
	
				<tr>
					<td id="submitbtn">
						<input type="submit" value="가입하기" >
					</td>
				</tr>
			</table>	  		
	</form>
</div>
<script>

$(id).keyup((e) => {
	const $id = $(e.target);
	const $error = $(".guide.error");
	const $ok = $(".guide.ok");
	const $idValid = $(idValid);
	
	if($id.val().length < 4) {
		$(".guide").hide();
		$idValid.val(0);
		return;
	}
	
	$.ajax({
		url: `${pageContext.request.contextPath}/member/checkIdDuplicate2.do`,
		data: {
			id: $id.val()
		},
		success(data){
			console.log(data);
			const {available} = data;
			if(available) {
				$ok.show();
				$error.hide();
				$idValid.val(1);
			}
			else {
				$ok.hide();
				$error.show();
				$idValid.val(0);
			}
		},
		error: console.log
	});
	
});

	
$("#passwordCheck").blur(function(){
	var $password = $("#password"), $passwordCheck = $("#passwordCheck");
	if($password.val() != $passwordCheck.val()){
		alert("패스워드가 일치하지 않습니다.");
		$password.select();
	}
});
	
$("[name=memberEnrollFrm]").submit(function(){

	var $id = $("#id");
	if(/^\w{4,}$/.test($id.val()) == false) {
		alert("아이디는 최소 4자리이상이어야 합니다.");
		$id.focus();
		return false;
	}
	
	return true;
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
