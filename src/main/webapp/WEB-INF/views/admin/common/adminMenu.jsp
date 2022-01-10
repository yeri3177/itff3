<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Member loginMember = (Member) authentication.getPrincipal();
pageContext.setAttribute("loginMember", loginMember);
%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adminMenu.css">

    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo">ITFF</a>
                </div>

			<div class="nav__list">
                    <a href="${pageContext.request.contextPath}/admin/adminManage.do" class="nav__link">
                        <ion-icon name="home-outline"></ion-icon>
                        <span class="nav_name">대시보드</span>
                    </a>

                     <div class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                       <ion-icon name="film-outline" onclick="location.href='${pageContext.request.contextPath}/admin/adminMovieList.do';"></ion-icon>
                        <span class="nav_name">상영/예매관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminMovieList.do" class="collapse__sublink">상영목록</a><br />
                            <a href="${pageContext.request.contextPath}/admin/adminTheaterInfo.do" class="collapse__sublink">상영관정보</a><br />
                            <a href="${pageContext.request.contextPath}/admin/adminMovieReservationStatusList.do" class="collapse__sublink">예매현황</a><br />
                            <a href="${pageContext.request.contextPath}/admin/adminMovieReservationList.do" class="collapse__sublink">예매관리</a><br />
                        </ul> 
                     </div>
                      
                     <div class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="file-tray-stacked-outline" onclick="location.href='${pageContext.request.contextPath}/admin/adminGoodsList.do';"></ion-icon>
                        <span class="nav_name">상품/주문관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminGoodsList.do" class="collapse__sublink">상품관리</a><br />
                            <a href="${pageContext.request.contextPath}/admin/adminGoodsOrderList.do" class="collapse__sublink">주문관리</a><br />
                            <a href="${pageContext.request.contextPath}/admin/adminGoodsOrderCancelList.do" class="collapse__sublink">취소관리</a><br />
                        </ul> 
                     </div> 
                     

                    <div class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="list-outline" onclick="location.href='${pageContext.request.contextPath}/admin/adminReviewList.do';"></ion-icon>
                        <span class="nav_name">게시판관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminReviewList.do" class="collapse__sublink">리뷰게시판</a><br />
                             <a href="${pageContext.request.contextPath}/admin/adminSharingList.do" class="collapse__sublink">티켓나눔터</a><br />
                         </ul> 
                     </div> 
                     
                     <div class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="help-outline" onclick="location.href='${pageContext.request.contextPath}/admin/adminNewQuestion.do';"></ion-icon>
                        <span class="nav_name">문의관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminNewQuestion.do" class="collapse__sublink">신규 문의</a><br />
                             <a href="${pageContext.request.contextPath}/admin/adminQuestionList.do" class="collapse__sublink">문의 리스트</a><br />
                         </ul> 
                     </div> 

                    <div class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="alert-outline" onclick="location.href='${pageContext.request.contextPath}/admin/adminNoticeForm.do';"></ion-icon>
                        <span class="nav_name">공지사항</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminNoticeForm.do" class="collapse__sublink">공지사항 작성</a><br />
                             <a href="${pageContext.request.contextPath}/admin/adminNoticeList.do" class="collapse__sublink">공지사항 조회</a><br />
                         </ul> 
                     </div> 

                    <a href="${pageContext.request.contextPath}/admin/adminMemberList.do" class="nav__link">
                        <ion-icon name="people-outline"></ion-icon>
                        <span class="nav_name">회원관리</span>
                    </a> 
                    
                    <a href="${pageContext.request.contextPath}/admin/chat.do" class="nav__link">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                        <span class="nav_name">채팅</span>
                    </a>
                    
                    
                    <a href="${pageContext.request.contextPath}/admin/calendar.do" class="nav__link">
                        <ion-icon name="calendar-clear-outline"></ion-icon>
                        <span class="nav_name">캘린더</span>
                    </a>

                </div>
                <a href="${pageContext.request.contextPath }" class="nav__link">
                    <ion-icon name="exit-outline"></ion-icon>
                    <span class="nav_name">나가기</span>
                </a>
            </div>
        </nav>
    </div>

<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

<script type="text/javascript">
/* EXPANDER MENU */
const showMenu = (toggleId, navbarId, bodyId) => {
    const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId),
    bodypadding = document.getElementById(bodyId)

    if( toggle && navbar ) {
        toggle.addEventListener('click', ()=>{
            navbar.classList.toggle('expander');

            bodypadding.classList.toggle('body-pd')
        })
    }
}

showMenu('nav-toggle', 'navbar', 'body-pd')

/* LINK ACTIVE */
const linkColor = document.querySelectorAll('.nav__link')
function colorLink() {
    linkColor.forEach(l=> l.classList.remove('active'))
    this.classList.add('active')
}
linkColor.forEach(l=> l.addEventListener('click', colorLink))

/* COLLAPSE MENU */
const linkCollapse = document.getElementsByClassName('collapse__link')
var i

for(i=0;i<linkCollapse.length;i++) {
    linkCollapse[i].addEventListener('click', function(){
        const collapseMenu = this.nextElementSibling
        collapseMenu.classList.toggle('showCollapse')

        const rotate = collapseMenu.previousElementSibling
        rotate.classList.toggle('rotate')
    });
}
</script>