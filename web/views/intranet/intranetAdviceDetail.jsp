<%@page import="semi.home.qna.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav.jsp" %>
<% 
	QnA q = (QnA)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷</title>
</head>
<body>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">상담신청</h1>
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">상담신청확인</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">                  
                <form action="write_ok.jsp" method="post" encType="multiplart/form-data"></form>
                  <table class="table table-bordered" style="font-size: 12px;">
                    <%
                    	for(QnA q : qna) {
                    %>                    
                    <tr>
                      <th style="text-align: center;">글번호</th>
                      <td><%=q.getQno()%></td>
                      <th style="text-align: center;">제목</th>
                      <td colspan="3" name = "subject"><%=q.getQtitle()%></td>            
                      <th style="text-align: center;">작성 날짜</th>
                      <td name = "date"><%=q.getQdate() %></td>
                    </tr>
                    <tr>
                      <th style="text-align: center;">반</th>
                      <td name = "class"><%=q.getQcclass()%>반</td>
                      <th style="text-align: center;">원아명</th>
                      <td name = "studentName"><%=q.getQcname()%></td>
                      <th style="text-align: center;">작성자</th>
                      <td name = "writer"><%=q.getQusername()%></td>
                      
                    </tr>
                    <tr>
                      <th style="text-align: center;">내용</th>
                      <td colspan = "5" name = "content"><span><%=q.getQcontent().charAt(0)%></span><%=q.getQcontent().substring(1) %></td>
                    </tr>
                    <%
                    	}
                    %>
                  </table>

          <a class="btn btn-primary btn-sm pull-right" href="../intranet/intranetAdviceBoard.jsp">목록</a>


        
        </div>
          

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

       <!-- Footer -->
       <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © 꿈나라어린이집 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">로그아웃 버튼을 누르면 로그인페이지로 이동합니다.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="../intranet/intranet_logout.html">로그아웃</a>
        </div>
      </div>
    </div>
  </div>
<%@ include file = "../intranet/common/footer.jsp" %>
</body>
</html>