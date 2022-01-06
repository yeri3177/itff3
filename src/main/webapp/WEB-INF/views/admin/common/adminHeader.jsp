<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib는 사용 시 jsp마다 넣어야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ITFF Admin</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<!-- favicon -->
<link rel="icon" href="${pageContext.request.contextPath }/resources/upload/favicon.ico" type="image/x-icon" sizes="16x16">

<!-- 카카오맵 API -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f83d8937bb78b8df31e1796445fc8213&libraries=services,clusterer"></script>

<!-- bootstrap js: jquery load 이후에 작성할 것.-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- sock.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"
	integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- stomp.js 추가 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"
	integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- toastr -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>

toastr.options = {
		  "debug": false,
		  "newestOnTop": false,
		  "progressBar": true,
		  "positionClass": "toast-top-right",
		  "preventDuplicates": false,
		  "onclick": null,
		  "showDuration": "100",
		  "hideDuration": "1000",
		  "timeOut": "5000",
		  "extendedTimeOut": "1000",
		  "showEasing": "swing",
		  "hideEasing": "linear",
		  "showMethod": "fadeIn",
		  "hideMethod": "fadeOut"
		}
		
$('#error').on('click', function(){
	toastr.error('error');
});
$('#warning').on('click', function(){
	toastr.warning('warning');
});
$('#success').on('click', function(){
	toastr.success('success');
});
$('#info').on('click', function(){
	toastr.info('info');
});

</script>

<script>

var socket = null;

$(document).ready(function() {
		sock = new SockJS("<c:url value="/echo-ws"/>");
		socket = sock;
		
		sock.onopen = function() {
	   		console.log('Info: connection opened.');
		};

		sock.onmessage = function(evt) {
	   		console.log('Info: connection onmessage.');
	   		console.log(evt.data);
	   		toastr.info(evt.data);
		};

		sock.onclose = function(event) {
	   		console.log('Info: connection closed');
		};
	    
		sock.onerror = function(err) {
	   		console.log('Error:', err);
		};

		console.log(socket);

		// send 클릭시
		// 		 $("#sendBtn").click(function(){
		// 			 sendMessage();
		// 		 })
	});

// 	function sendMessage(){
// 		sock.send($("#inputMsg").val());	// 소켓으로 전송
// 	}

</script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<script type="text/javascript">

    $(document).ready(function () {
    	
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 showButtonPanel: true,
                 currentText: '오늘',
                 closeText: '닫기',                     
                 maxDate: 60,
                 onSelect: function (date) {
         			var endDate = $('#endDate');
         			var startDate = $(this).datepicker('getDate');
         			var minDate = $(this).datepicker('getDate');
         			endDate.datepicker('setDate', minDate);
         			startDate.setDate(startDate.getDate() + 30);
         			minDate.setDate(startDate.getDate() + 1);
         			endDate.datepicker('option', 'maxDate', startDate);   // 반납일 선택가능한 maxDate를 선택한 시작일로부터 30일 후까지로 제한
         			endDate.datepicker('option', 'minDate', minDate);     // 반납일 선택가능한 minDate를 선택한 시작일의 내일로 제한
         		}  
            });
            
            // 페이지 로딩 완료시 검색바의 예약시작일 초기값을 오늘로 설정
            $("#startDate").datepicker('setDate', 'today');
            
            $( "#startDate2" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 showButtonPanel: true,
                 currentText: '오늘',
                 closeText: '닫기',                     
                 maxDate: 60,
                 onSelect: function (date) {
         			var endDate = $('#endDate2');
         			var startDate = $(this).datepicker('getDate');
         			var minDate = $(this).datepicker('getDate');
         			endDate.datepicker('setDate', minDate);
         			startDate.setDate(startDate.getDate() + 30);
         			minDate.setDate(startDate.getDate() + 1);
         			endDate.datepicker('option', 'maxDate', startDate);   // 반납일 선택가능한 maxDate를 선택한 시작일로부터 30일 후까지로 제한
         			endDate.datepicker('option', 'minDate', minDate);     // 반납일 선택가능한 minDate를 선택한 시작일의 내일로 제한
         		}  
            });
            
            // 페이지 로딩 완료시 검색바의 예약시작일 초기값을 오늘로 설정
            $("#startDate2").datepicker('setDate', 'today');
         
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 showButtonPanel: true,
                 currentText: '오늘',
                 closeText: '닫기', 
                 maxDate: 60 
 
            });    
            
            // 초기값을 내일로 설정함
            $("#endDate").datepicker('setDate', '+1D');

            $( "#endDate2" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 showButtonPanel: true,
                 currentText: '오늘',
                 closeText: '닫기', 
                 maxDate: 60 
 
            });    
            
            // 초기값을 내일로 설정함
            $("#endDate2").datepicker('setDate', '+1D');
                 
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

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

</head>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8" />

<body style="padding: 0 0 0 5.7rem;">
	<!-- // hd_bg -->

	<!-- 	Header -->
	<header>


	</header>

	<!-- 	//header -->

	<section class="ftco-section">