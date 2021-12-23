<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="shadow-sm p-3 mb-5 bg-body">
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="font-family: 'Noto Sans KR';">
  <a class="navbar-brand" href="#" style="font-weight: bold; color: #145ee9;">회원관리</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminMemberList.do">전체회원목록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">회원</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">회원</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">회원</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">회원</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown link
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
</div>