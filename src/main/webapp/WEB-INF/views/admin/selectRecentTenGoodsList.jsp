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
	<td class="title-cell"><a target="_blank"
		href="index.php?option=com_gridbox&amp;task=gridbox.edit&amp;id=43">
			<span class="post-intro-image"
			style="background-image: url(https://i.ibb.co/Vgq006M/20211217-185555.png);"></span>
			${list.PName }
	</a></td>
	<td class="second-cell">${list.PId }</td>
	<td class="hits-cell"><fmt:formatDate value="${list.PEnroll }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>