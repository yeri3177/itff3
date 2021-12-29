<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.spring.goods.model.vo.Goods"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminChart.css">

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 관리자 공통 메뉴 -->
<jsp:include page="/WEB-INF/views/admin/common/adminMenu.jsp"></jsp:include>

<div class="container">
	<!-- 회원 통계 -->
	<h2 class="mx-5 mt-5 mb-3">ITFF 통계</h2>
	<div class="row mx-5">
		<div class="col-6 card p-3" style="margin-left:-3px">
			<h5>나이대 비율 현황</h5>
			<section class="chart1_section">
			    <div class="pieID pie">
			      
			    </div>
			    <ul class="pieID legend">
			      <li>
			        <em>Humans</em>
			        <span>718</span>
			      </li>
			      <li>
			        <em>Dogs</em>
			        <span>531</span>
			      </li>
			      <li>
			        <em>Cats</em>
			        <span>868</span>
			      </li>
			      <li>
			        <em>Slugs</em>
			        <span>344</span>
			      </li>
			      <li>
			        <em>Aliens</em>
			        <span>1145</span>
			      </li>
			    </ul>
			  </section>
		</div>
		<div class="col-6 card p-3" style="margin-left:3px">
			<h5>영화별 예매 현황</h5>
			<div class="skills">
			
	  <ul class="lines">
	    <li class="line l--0">
	    </li>
	    <li class="line l--25">
	    </li>
	    <li class="line l--50">
	    </li>
	    <li class="line l--75">
	    </li>
	    <li class="line l--100">
	    </li>
	  </ul>
	  
	  <div class="charts">
	    <div class="chart chart--dev">

	      <ul class="chart--horiz">
	        <li class="chart__bar" style="width: 98%;">
	          <span class="chart__label">
	            아이로봇
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 98%;">
	          <span class="chart__label">
	            이글아이
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 70%;">
	          <span class="chart__label">
	            에이 아이
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 60%;">
	          <span class="chart__label">
	            패스워드
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 25%;">
	          <span class="chart__label">
	            가타카
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 60%;">
	          <span class="chart__label">
	            13층
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 55%;">
	          <span class="chart__label">
	            매트릭스
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 50%;">
	          <span class="chart__label">
	            그녀
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 40%;">
	          <span class="chart__label">
	            시티즌포
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 60%;">
	          <span class="chart__label">
	            007 카지노 로얄
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 60%;">
	          <span class="chart__label">
	            미션 임파서블: 고스트 프로토콜
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 60%;">
	          <span class="chart__label">
	            에린 브로코비치
	          </span>
	        </li>
	        <li class="chart__bar" style="width: 60%;">
	          <span class="chart__label">
	            루퍼
	          </span>
	        </li>
	      </ul>
	    </div>
	    
	    
  </div>
</div>

		</div>
	</div>
	
	<div class="row mx-5">
<div class="col-6 card p-3" style="margin-left:-3px">
			<h5>성별 비율 현황</h5>
			<canvas id="genderChart"></canvas>
		</div>
		<div class="col-6 card p-3" style="margin-left:3px">
			<h5>나이대 비율 현황</h5>
			<canvas id="myChart3" width="400" height="400"></canvas>
		</div>
	</div>
	<div class="row mx-5" style="margin-top: 3px">
<div class="col-6 card p-3" style="margin-left:-3px">
			<h5>성별 비율 현황</h5>
			<canvas id="genderChart"></canvas>
		</div>
		<div class="col-6 card p-3" style="margin-left:3px">
			<h5>나이대 비율 현황</h5>
			<canvas id="myChart4" width="400" height="400"></canvas>
		</div>
	</div>
	
	<div class="mb-5"></div>

</div>


<script>
function sliceSize(dataNum, dataTotal) {
	  return (dataNum / dataTotal) * 360;
	}
	function addSlice(sliceSize, pieElement, offset, sliceID, color) {
	  $(pieElement).append("<div class='slice "+sliceID+"'><span></span></div>");
	  var offset = offset - 1;
	  var sizeRotation = -179 + sliceSize;
	  $("."+sliceID).css({
	    "transform": "rotate("+offset+"deg) translate3d(0,0,0)"
	  });
	  $("."+sliceID+" span").css({
	    "transform"       : "rotate("+sizeRotation+"deg) translate3d(0,0,0)",
	    "background-color": color
	  });
	}
	function iterateSlices(sliceSize, pieElement, offset, dataCount, sliceCount, color) {
	  var sliceID = "s"+dataCount+"-"+sliceCount;
	  var maxSize = 179;
	  if(sliceSize<=maxSize) {
	    addSlice(sliceSize, pieElement, offset, sliceID, color);
	  } else {
	    addSlice(maxSize, pieElement, offset, sliceID, color);
	    iterateSlices(sliceSize-maxSize, pieElement, offset+maxSize, dataCount, sliceCount+1, color);
	  }
	}
	function createPie(dataElement, pieElement) {
	  var listData = [];
	  $(dataElement+" span").each(function() {
	    listData.push(Number($(this).html()));
	  });
	  var listTotal = 0;
	  for(var i=0; i<listData.length; i++) {
	    listTotal += listData[i];
	  }
	  var offset = 0;
	  var color = [
	    "cornflowerblue", 
	    "olivedrab", 
	    "orange", 
	    "tomato", 
	    "crimson", 
	    "purple", 
	    "turquoise", 
	    "forestgreen", 
	    "navy", 
	    "gray"
	  ];
	  for(var i=0; i<listData.length; i++) {
	    var size = sliceSize(listData[i], listTotal);
	    iterateSlices(size, pieElement, offset, i, 0, color[i]);
	    $(dataElement+" li:nth-child("+(i+1)+")").css("border-color", color[i]);
	    offset += size;
	  }
	}
	createPie(".pieID.legend", ".pieID.pie");

</script>

<script>
const ctx = document.getElementById('myChart2').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>

<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"></jsp:include>

