<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<c:forEach items="${oneDateSchedule }" var="ods">
  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start" style="width: 695px;">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">${ods.theaterId }관</h5>
    </div>
    <p class="mb-1">${ods.startTime }</p>
  </a>
</c:forEach>