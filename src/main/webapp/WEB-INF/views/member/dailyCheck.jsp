<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title"/>
</jsp:include>

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/event/eventRoulette.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<link href='${pageContext.request.contextPath }/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/resources/fullcalendar/timegrid/main.css' rel='stylesheet' />

<script src='${pageContext.request.contextPath }/resources/fullcalendar/core/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/interaction/main.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/timegrid/main.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/fullcalendar/core/locales/ko.js'></script>

		<div class="roulette_total_con">
		<div class="inner title-area">
			<h2 class="hidden">EVENT</h2>

			<h3>[Happy New Year!] 1월 출석체크 이벤트</h3>

			<div class="btns">
				<span class="txt-date">2022.01.01 ~ 2022.01.31</span>
			</div>
		</div>

 <div id="external-events">
	
    <input type="hidden" id="memNum" class="memNumber" name="memNum" value="${member.member_id}">
    	
    <!--1.출석체크 -->	
	<!--스크립트에서 배열에 넣기위해 컨트롤에서 받은 출석날짜값이있는 ar을 반복문을돌림.-->
    <c:forEach items="${getCheck}" var="gcheck">
    	<input type="hidden" value="${gcheck.checkDate}" class="checkDate">
    </c:forEach>
  <!-- 
  <p>출석체크 버튼을 눌러야 </p>
  <p> 출석이 완료됩니다.</p>
   -->
		</div>
		<div class="container calendar-container" style="background-color: whitesmoke; padding: 30px 0 30px 0; width: 1140px;">
			<div id="calendar" style="max-width:900px; margin:40px auto; width: 100%; height: 100%;"></div>
		</div>

			<div class="btnbbs">
				<a class="btn medium" onclick="location.href='${pageContext.request.contextPath}/event/eventMenu.do';">목록보기</a>
			</div>
					</div>

 <script type="text/javascript">
 	//풀캘린더
 	document.addEventListener('DOMContentLoaded', function() {
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendarInteraction.Draggable;
	 
	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
	    var checkbox = document.getElementById('drop-remove');
	 
	    // initialize the external events(이벤트초기화)
	    new Draggable(containerEl, {
	      itemSelector: '.fc-event',
	      eventData: function(eventEl) {
	        return {
	          title: eventEl.innerText
	        };
	      }
	    });
	    /*2.출석체크 */
		//db에있는 출석날짜를 가져와서 화면에 출력하는 폼에 넣은 후 check라는 배열에 넣음(push).
		var check = [];
		$(".checkDate").each(function(){
			var dateC = {};
			dateC.title = "출석";
			dateC.start = $(this).val();
			dateC.end = $(this).val();
			dateC.imageurl="${pageContext.request.contextPath }/resources/fullcalendar/core/check2.jpg";
			check.push(dateC);
			console.log(check);
			
		});
		
	    // initialize the calendar(캘린더초기화)
	    var calendar = new Calendar(calendarEl, {
		  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'checkBtn'
	      },
	      customButtons: { 
		        checkBtn: {
		          text: '출석체크하기',
		          id: 'check',
		          click: function() {	
	                    var today = new Date();
	                    var today = new Date();
	                    var year = today.getFullYear();
	                    var month = today.getMonth()+1;
	                    var day = today.getDate();
	                    
	                    var currentDate = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2));
	                    $.ajax({
	                    	url: "${pageContext.request.contextPath}/member/dailyCheckInsert.do?${_csrf.parameterName}=${_csrf.token}",
	                    	method: "POST",
	                    	data:{
	                    		checkDate: currentDate
	                    	},
	                    	success(data) {
	                    		//alert(data);
 	                    		if(data == 1){
	                    			alert("출석체크 완료!");
	                    		}
	                    		if(data == 0){
	                    			alert("이미 출석하셨습니다. 내일 다시 참여해주세요.");
	                			//$(".fc-checkBtn-button").prop('disabled', true);
	                			//$(".fc-checkBtn-button").html('출석완료');
	                    		}
	                			console.log(data);
	                			
	                			location.reload();
	                		},
	                		error: console.log
	                    });
		          }
		        }
		  },
	      editable: false,
	      droppable: true, // this allows things to be dropped onto the calendar
	      drop: function(info) {
	        // is the "remove after drop" checkbox checked?
	        if (checkbox.checked) {
	          // if so, remove the element from the "Draggable Events" list
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
	      },
	      locale: 'ko',
	      /*3.출석체크 */
	      //이벤트안에 체크배열을 넣어줌.
	      events: check,
	      eventRender:function(event, eventElement) {
	    	  console.log(event);
              if(event.imageurl) {
            	  eventElement.find("span.fc-title").prepend("<center><img src='" + event.imageurl + "'><center>");
              }
          }
	    });
	    calendar.render();
	  });
 	$(".test").parent().addClass("test2");
 	
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
