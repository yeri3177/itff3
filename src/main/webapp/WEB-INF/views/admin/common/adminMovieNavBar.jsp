<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="shadow-sm p-3 mb-5 bg-body">
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="font-family: 'Noto Sans KR';">
  <a class="navbar-brand" href="#" style="font-weight: bold; color: #45a7b9;">영화/예매관리</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminMovieList.do">상영목록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/adminTheaterInfo.do">상영관정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">영화</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">영화</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">영화</a>
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