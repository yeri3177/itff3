<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/memberEnroll.css" />

<div class="join">
	<div class="container">

		<h2 class="tit_sec txt-center txt-white">회원가입</h2>
		<div class="top_txt_box txt-center">
			<p>
				정보기술영화제 홈페이지에 방문하신 것을 환영합니다!<br> 모든 내용을 정확히 숙지하신 후에 개인정보의 수집 및
				이용에 대한 동의 여부를 결정해 주시기 바랍니다.
			</p>
		</div>
		
		<form:form action="${pageContext.request.contextPath}/member/memberEnroll.do?test=wtf" method="post">
			<input type="hidden" name="test" value="ITFF">
			<input value="회원가입" type="submit" name="imageField" class="btn btn-m btn-action" style="width: 200px;">  
		</form:form>

		<div class="join_con">
			<div class="row">

				<form:form 
					name="theForm"
					action="${pageContext.request.contextPath}/member/memberEnroll.do" 
					class="chk_member" 
					method="post"
					onsubmit="return OnSubmitAction();" 
					enctype="multipart/form-data">
					<input type="hidden" name="strBirthdayR"> 


					<!-- TEXT 입력양식이라면 -->

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="strLoginName" class="form_tit need">회원이름 확인</label>
							<div class="form_group wid100">
								<!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt"> <input name="name"
										id="name" type="text" maxlength="30" size="20" placeholder="이름을 입력해 주세요." placeholder="테스트"
										style="-webkit-ime-mode: inactive; ime-mode: inactive;"
										 >
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="id" class="form_tit need">회원아이디</label>
							<div class="form_group wid100" style="position:relative;"> <!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt">
										
										<input name="id" id="id" type="text" maxlength="30" size="20" onchange="document.all['bitIdCheck'].value='0';" style="-webkit-ime-mode:inactive;ime-mode:inactive;text-transform:lowercase;" placeholder="test">
										
									</span>
								</div>
								<a href="#" class="btn btn-s" style="position:absolute; right:5px; top:10px; z-index:1;">중복확인</a>
							</div>
							
						</div>
					</div>

					<!-- 비밀번호 입력양식이라면 -->
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="strLoginPwd" class="form_tit need">비밀번호</label>
							<div class="form_group wid100">
								<!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt"> <input name="password"
										id="password" type="password" maxlength="30" size="20"
										value="" placeholder="비밀번호를 입력해 주시기 바랍니다."
										style="-webkit-ime-mode: inactive; ime-mode: inactive;">
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="strLoginPwd2" class="form_tit need">비밀번호 확인</label>
							<div class="form_group wid100">
								<!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt"> <input name="passwordCheck"
										id="passwordCheck" type="password" maxlength="30" size="20"
										value="" placeholder="비밀번호를 입력해 주시기 바랍니다."
										style="-webkit-ime-mode: inactive; ime-mode: inactive;">
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="strEmail" class="form_tit need">닉네임</label>
							<div class="form_group wid100" style="position: relative;">
								<!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt"> <input name="nickname"
										id="nickname" type="text"
										maxlength="64" size="40" placeholder="이메일을 입력해 주세요."
										style="-webkit-ime-mode: inactive; ime-mode: inactive;">
										<a class="btn btn-s btn_cancel"
										href="#"
										style="position: absolute; right: 5px; top: 10px; z-index: 1;">중복확인</a>
									</span>

								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="strBirthday" class="form_tit need">생년월일 확인</label>
							<div class="row">
								<div class="col-md-4 col-sm-4 col-xs-12">
									<div class="form_group wid100">
										<!-- // focus 시 on 클래스 -->
										<div class="d_tbl">
											<span class="form_txt"> 
											<input name="birthday"
												type="text" onblur="onlynum(this, '1');" size="4"
												maxlength="4" style="-webkit-ime-mode: inactive; ime-mode: inactive;"
												placeholder="년 ex)2000"  >
											</span>
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-4 col-xs-12">
									<div class="form_group wid100">
										<!-- // focus 시 on 클래스 -->
										<div class="d_tbl">
											<span class="form_txt"> 
											<input name="birthday"
												type="text" onblur="onlynum(this, '1');" size="2"
												maxlength="2" style="-webkit-ime-mode: inactive; ime-mode: inactive;"
												placeholder="월"  >
											</span>
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-4 col-xs-12">
									<div class="form_group wid100">
										<!-- // focus 시 on 클래스 -->
										<div class="d_tbl">
											<span class="form_txt"> <input name="birthday"
												type="text" onblur="onlynum(this, '1');" size="2"
												maxlength="2" style="-webkit-ime-mode: inactive; ime-mode: inactive;"
												placeholder="일"  >
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<input type="hidden" name="birthday" id="birthday0" value="0" checked=""> 
					<input type="hidden" name="birthday" id="birthday1" value="1">

					<!-- E-MAIL 입력양식이라면 -->
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="strEmail" class="form_tit need">이메일 확인</label>
							<div class="form_group wid100" style="position: relative;">
								<!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt"> <input name="email"
										id="email" type="text" onblur="checkNotEmail(this);"
										maxlength="64" size="40" value="" placeholder="이메일을 입력해 주세요."
										style="-webkit-ime-mode: inactive; ime-mode: inactive;">
										<a class="btn btn-s btn_cancel" href="#" style="position: absolute; right: 5px; top: 10px; z-index: 1;">중복확인</a>
									</span>
								</div>
							</div>
						</div>
					</div>

					<!-- 휴대폰번호 입력양식이라면 -->

					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="form_group_wrap">
							<label for="strMobile" class="form_tit need">휴대폰번호 확인</label>
							<div class="row">		
							<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="form_group  wid100"> <!-- // focus 시 on 클래스 -->
									<select name="phone" class="form-control input-lg" style="height:45px;">
										<option value="">선택하세요</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="013">013</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
										<option value="0502">0502</option>
										<option value="0505">0505</option>
										<option value="0506">0506</option>
										<option value="00">없음</option>
									</select>
								</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="form_group wid100"> <!-- // focus 시 on 클래스 -->
									<div class="d_tbl">
										<span class="form_txt">
											<input name="phone" type="text" onblur="onlynum(this, '1');" size="4" maxlength="4" value="" style="-webkit-ime-mode:inactive;ime-mode:inactive;">
										</span>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="form_group wid100"> <!-- // focus 시 on 클래스 -->
									<div class="d_tbl">
										<span class="form_txt">
											<input name="phone" type="text" onblur="onlynum(this, '1');" size="4" maxlength="4" value="" style="-webkit-ime-mode:inactive;ime-mode:inactive;">
										</span>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>

					<!-- 주소 입력양식이라면 -->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form_group_wrap">
							<label for="strHomeAddr" class="form_tit need">자택주소 확인</label>
							<div class="form_group wid100" style="position:relative;" "=""> <!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt">
										<input name="address" id="zipcode" type="text" size="7" maxlength="7"   value="" class="inputTxt">
										&nbsp;			
										<input name="address" type="hidden" size="4" maxlength="3"   value="" class="inputTxt">
																				
										<a href="javascript:findZip();" class="btn btn-s btn_cancel" style="position:absolute; right:5px; top:10px; z-index:1;">우편번호 찾기</a>
					
									</span>
								</div>
							</div>
							
							<div class="form_group wid100" style="margin-top:5px"> <!-- // focus 시 on 클래스 -->
								<div class="d_tbl">
									<span class="form_txt">
										<input name="address" id="address1" type="text" size="50"   value="" class="inputTxt mt10">
										<input name="address" id="address2" type="text" size="50" value="" placeholder="상세주소 입력">
					
									</span>
								</div>
							</div>													
						</div>
					</div>


<script>													
function findZip() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('address1').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('address2').focus();
		}
	}).open();
}
	
//-->
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script><script charset="UTF-8" type="text/javascript" src="//t1.daumcdn.net/postcode/api/core/211103/1635999227231/211103.js"></script>



					<div class="btn-group txt-center mt30">

						<input value="회원가입" type="submit" name="imageField" class="btn btn-m btn-action" style="width: 200px;"> 
						&nbsp;<a class="btn btn-m btn-primary" href="javascript:;" onclick="history.go(-1);" style="background-color: #fff; width: 200px;">취소하기</a>
					</div>
				</form:form>

			</div>
		</div>
	</div>
</div>

<script>
	
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
