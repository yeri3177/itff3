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
   <td class="name-cell">
       <span class="comments-text-wrapper">
           <span class="ba-author-avatar" style="background-image: url(https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50);"></span>
           <img src="https://www.gravatar.com/avatar/1e6e0982c3fd69a61c3f06091d61858b?d=https://www.balbooa.com/demo-admin/components/com_gridbox/assets/images/default-user.png&amp;s=50" style="display: none !important;" onerror="setGravatarDefault(this);">
            <span class="comments-text">
                <span class="comments-name-wrapper">
                    <span class="comments-name">
                        <span>${list.memberId }</span>
                        <span class="review-rating-wrapper">
                        </span>
                    </span>
                </span>
                <span class="comments-message">${list.reviewContent }</span>
            </span>
        </span>
    </td>
</tr>
</c:forEach>