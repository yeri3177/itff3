<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.spring.goods.model.vo.Goods"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:forEach items="${list }" var="list">
	<tr>
		<td class="title-td" style="width: 200px; text-align: left;">
			<img src="${pageContext.request.contextPath}/resources/upload/member/${list.image }" alt="memberImage" style="width: 40px; height: 40px; border-radius: 30px; margin-right: 10px;"/>
			<span class="file-title"> ${list.id } </span>
		</td>
		<td class="filesize-td"><span><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></span></td>
	</tr>
</c:forEach>