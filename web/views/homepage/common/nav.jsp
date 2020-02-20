<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="semi.home.jsp.model.vo.*"%>

<%
 Member m = (Member)session.getAttribute("member"); 
%>    


	<header class="header">
		<nav class="navbar navbar-expand-lg navbar-light fixed-top "
			id="mainNav" style="background-color: white;">
			<div class="container">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/views/homepage/homeindex.jsp"
					style="font-size: 28px; color: black;">무슨무슨유치원</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">

					Menu <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">보육프로그램</a>
							<div class="dropdown-menu " aria-labelledby="dropdown01">
								<a class="dropdown-item" href="./edu_calendar.jsp">보육계획안</a> <a
									class="dropdown-item" href="./food_calender.jsp">식단 안내</a> <a
									class="dropdown-item" href="./event_calender.jsp">행사 안내</a>
							</div></li>
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="/semi/gboardlist" id="dropdown01">앨범</a></li>
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="/semi/boardlsit.do" id="dropdown01">커뮤니티</a></li>
						<li class="nav-item dropdown show"><a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">마이페이지</a>
							<div class="dropdown-menu " aria-labelledby="dropdown01">
								<a class="dropdown-item" href="/semi/views/homepage/edit_member.jsp">개인정보수정</a>
								<a class="dropdown-item" href="./alimNote.jsp">알림장작성</a>
								<a class="dropdown-item" href="/semi/qList.qna">문의신청</a>
							</div></li>
						<li class="nav-item dropdown show">
								
							<%if (m == null) { %>  
             				 <a class="nav-link" href="../../index.jsp" id="dropdown01">로그인</a>
         					    <%}else{ %>  
          	  				<a class="nav-link" href="/semi/homelogout" id="dropdown01">로그아웃</a>
          						<%} %>
				
				</li>
				</ul>
				</div>
			</div>
		</nav>
	</header class="masthead">