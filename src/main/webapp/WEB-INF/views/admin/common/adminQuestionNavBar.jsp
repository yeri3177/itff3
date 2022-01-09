<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="shadow-sm p-3 mb-5 bg-body" style="width: 100%;">
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="font-family: 'Noto Sans KR'; height: 45px;">
  <a class="navbar-brand" href="#" style="font-weight: bold; color: #45a7b9;">문의사항</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminNewQuestion.do">신규 문의</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminQuestionList.do">문의 리스트</a>
      </li>
    </ul>
  </div>
</nav>
</div>