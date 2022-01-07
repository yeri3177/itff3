<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.spring.goods.model.vo.Goods"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:forEach items="${list }" var="list">
	<tr style="width: 600px; font-size: 13px;">
		<td class="second-cell">
			<a class="no" href="${pageContext.request.contextPath }/admin/adminGoodsOrderList.do">
				${list.payment.paymentNo }
			</a>
		</td>
		<td class="second-cell">${list.payment.memberId }</td>
		<td class="second-cell">${list.payment.totalPrice }</td>
		<td class="hits-cell" style="font-size: 13px; font-family: 'Montserrat';"><fmt:formatDate value="${list.payment.paymentDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
</c:forEach>