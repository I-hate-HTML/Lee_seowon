<%@page import="semi.home.jsp.model.vo.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%Member c = ((Member)request.getAttribute("member")); %>

 
  <footer>
  
    <br>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <ul >
              <li><a>이용약관</a></li>
              <li><strong><a>개인정보처리방침</a></strong></li>
              <li><a>책임의 한계와 법적고지</a></li>
              <li><a>회원정보 고객센터 </a></li>
             <%if((int)(c.getJob_code()) != 6){ %>
              <li><strong><a href="<%=request.getContextPath()%>/views/intranet/intranetMain.jsp">INTRANET</a></strong></li>
              <%} %>
            </ul>
            <small>팡팡어린이집  대표 : 서하연,  원장 : 박막례,  주소 : 서울특별시 강동구 아리수로97길 68  <br>
			대표번호 : 02)222-0202, 교육상담 : 02)222-2222, 사업자등록번호 : 606-66-66666 <br> 개인정보보호관리책임자 : 서하연(E-mail : hyseo@hanmail.net)
			</small>
		<br>
            <address >
              <em class="copy">Copyright</em>
              <em class="u_cri">©</em>
              <a> 팡팡어린이집</a>
              <span class="all_r">All Rights Reserved.</span>
            </address>
        </div>
      </div>
    </div>
    <br>
    <br>
  </footer>