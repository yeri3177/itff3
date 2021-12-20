<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

		<c:forEach items="${list}" var="chatLog">
				<li class="list-group-item">${chatLog.memberId eq "admin" ? "관리자" : chatLog.memberId} : ${chatLog.msg}</li>
		</c:forEach>
			