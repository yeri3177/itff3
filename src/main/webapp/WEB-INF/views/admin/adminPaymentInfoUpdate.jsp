<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/admin/adminFrm.css" />

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">주문자 정보 수정</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
	    		<form
					action="${pageContext.request.contextPath}/admin/adminPaymentInfoUpdate.do?${_csrf.parameterName}=${_csrf.token}"
					name="goods_option_update_frm"
					method="post">
		      
		      <div class="modal-body">
				  
					<div class="input_wrap">
					
						  <div class="form-group">
						    <label for="exampleFormControlInput1">수령인</label>
						    <input type="hidden" name="paymentNo" value="${payment.paymentNo }">
						    <input type="text" name="receiver" class="form-control" id="exampleFormControlInput1" value="${payment.receiver}">
						  </div>
				  
						  <div class="form-group">
						    <label for="exampleFormControlInput1">연락처</label>
						    <input type="text" name="phone" class="form-control" id="exampleFormControlInput1" value="${payment.phone}">
						  </div>

					 	 <div class="form-group">
								<div class="form_group_wrap">
									<label for="strHomeAddr" class="form_tit need">주소지</label>
									<div class="form_group wid100" style="position:relative;"> <!-- // focus 시 on 클래스 -->
										<div class="d_tbl">
											<span class="form_txt">
												<input name="postCode" class="form-control" id="zipcode" type="text" size="7" maxlength="7" value="${payment.postCode }" class="inputTxt">
												&nbsp;			
												<!-- <input name="address" type="hidden" size="4" maxlength="3"   value="" class="inputTxt"> -->
																						
												<a href="javascript:findZip();" class="btn btn-s btn_cancel" style="position:absolute; right:5px; top:1px; z-index:1;">우편번호 찾기</a>
							
											</span>
										</div>
									</div>
									
									<div class="form_group wid100" style="margin-top:5px"> <!-- // focus 시 on 클래스 -->
										<div class="d_tbl">
											<span class="form_txt">
												<input name="address" class="form-control" id="address1" type="text" size="50" value="${payment.address }" required placeholder="주소 입력" class="inputTxt mt10">
												<input name="detailAddress" class="form-control" id="address2" type="text" size="50" value="${payment.detailAddress }" required placeholder="상세주소 입력">
											</span>
										</div>
									</div>													
								</div>
							</div>
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">베송메모</label>
						    <input type="text" class="form-control" name="orderComment" id="exampleFormControlTextarea1" value="${payment.orderComment }"/>
						  </div>
						  </div>

						  
						</div>
				      
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-outline-secondary">수정</button>
		        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
		      </div>
		      
		     </form>
		 
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
	
	$("[name=postCode]").val('');
	$("[name=address]").val('');
	$("[name=detailAddress]").val('');
}
	
//-->

</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script><script charset="UTF-8" type="text/javascript" src="//t1.daumcdn.net/postcode/api/core/211103/1635999227231/211103.js"></script>		 
		     
<script>

//파일명 바꾸기 & 이미지 이름
$(() => {
	$("#inputGroupFile01").change((e) => {
		
		// 1.파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // optional chaining 객체가 undefined경우에도 오류가 나지 않는다.
		console.dir(e.target);
		console.log(file);
		console.log(filename);
		
		// 2.label에 설정하기
		const $label = $(e.target).next();
		console.log($label);
		
		if(file != undefined) {
			$label.html(filename);
			$("[name=optionImg]").val(filename);			
		}
	});	
});

</script>

<script>

//사진 미리보기
$(function() {
 $("#inputGroupFile01").on('change', function(){
 readURL1(this);
 });
});
function readURL1(input) {
 if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
     $('#View1').attr('src', e.target.result);
     }
     reader.readAsDataURL(input.files[0]);
 }
}

</script>