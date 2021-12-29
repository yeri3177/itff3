<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

                     <div href="#" class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                       <ion-icon name="film-outline"></ion-icon>
                        <span class="nav_name">영화관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminMovieList.do" class="collapse__sublink">상영목록</a><br />
                            <a href="${pageContext.request.contextPath}/admin/adminTheaterInfo.do" class="collapse__sublink">상영관정보</a><br />
                             <a href="#" class="collapse__sublink">Members</a> 
                        </ul> 
                     </div>
                      
                     <div href="#" class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="file-tray-stacked-outline"></ion-icon>
                        <span class="nav_name">상품관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminGoodsList.do" class="collapse__sublink">상품조회</a><br />
<!--                             <a href="#" class="collapse__sublink">상품등록</a><br /> -->
<%--                              <a href="#" class="collapse__sublink">상품별 옵션관리</a><br />  --%>
                             <a href="#" class="collapse__sublink">Members</a> 
                        </ul> 
                     </div> 

                    <div href="#" class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="people-outline"></ion-icon>
                        <span class="nav_name">회원관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminMemberList.do" class="collapse__sublink">회원목록</a><br />
                             <a href="#" class="collapse__sublink">Group</a><br />
                             <a href="#" class="collapse__sublink">Members</a>
                         </ul> 
                     </div> 

                    <div href="#" class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="reader-outline"></ion-icon>
                        <span class="nav_name">공지사항</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="${pageContext.request.contextPath}/admin/adminNoticeForm.do" class="collapse__sublink">공지사항 작성</a><br />
                             <a href="${pageContext.request.contextPath}/admin/adminNoticeList.do" class="collapse__sublink">공지사항 조회</a><br />
                         </ul> 
                     </div> 

                    <div href="#" class="nav__link collapse" style="grid-template-columns: 20px max-content 1fr; display: grid; align-items: center; column-gap: 0.75rem; padding: 0.75rem; color: var(--white-color); border-radius: 0.5rem; margin-bottom: 1rem; transition: .3s; cursor: pointer;">
                        <ion-icon name="help-outline"></ion-icon>
                        <span class="nav_name">문의사항</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link md hydrated rotate" role="img" aria-label="chevron down outline"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="#" class="collapse__sublink">신규문의</a><br />
                             <a href="${pageContext.request.contextPath}/admin/adminQuestionList.do" class="collapse__sublink">문의 리스트</a><br />
                         </ul> 
                     </div> 


                    
                          <a href="${pageContext.request.contextPath}/admin/chat.do" class="nav__link">
                        <ion-icon name="chatbubbles-outline"></ion-icon>
                        <span class="nav_name">채팅</span>
                    </a>
                    
                    
                    <a href="${pageContext.request.contextPath}/admin/calendar.do" class="nav__link">
                        <ion-icon name="calendar-clear-outline"></ion-icon>
                        <span class="nav_name">캘린더</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/admin/chart.do" class="nav__link">
                        <ion-icon name="pie-chart-outline"></ion-icon>
                        <span class="nav_name">통계</span>
                    </a>


                    <a href="#" class="nav__link">
                      	<ion-icon name="settings-outline"></ion-icon>
                        <span class="nav_name">설정</span>
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