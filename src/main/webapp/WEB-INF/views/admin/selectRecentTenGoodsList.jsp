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
				${list.goodsOrder.orderNo }
			</a>
		</td>
		<td class="second-cell">${list.member.name }</td>
		<td class="second-cell">
			<div class="email">
				<c:if test="${list.payment.paymentNo eq '' }">
					<span style="color: #45a7b9; font-weight: bold;">결제대기</span>
				</c:if>
				<c:if test="${list.payment.paymentNo ne '' }">
					<span style="color: #ec7b65; font-weight: bold;">결제완료</span>
				</c:if>
			</div>
		</td>
		<td class="hits-cell" style="font-size: 13px; font-family: 'Montserrat';"><fmt:formatDate value="${list.goodsOrder.orderDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
</c:forEach>