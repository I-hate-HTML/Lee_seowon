<%@page import="java.util.*,semi.home.qna.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav.jsp" %>
<% 
	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 
</head>
<body>
<!-- Begin Page Content -->
        <div class="container-fluid">
		<form id="updateForm" method="post">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">문의 확인</h1>
		
          <div class="card shadow mb-4">
            <div class="card-header py-3"> 
              <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
                <tr>
                  <td>
                  </td>
                  <td align="right">
                    <button class = "btn btn-primary btn-sm" onclick="studentDelete();">삭제</button>                              
                  </td>
                </tr>
              </table>
            </div>
            <div class="card-body">
              <div class="table-responsive"> 
                  <table id = "viewTable" class="table table-striped" style="font-size:12px; text-align: center;">
                    
            <tr>
              <th><input type="checkbox" id="chkalltop" onclick="checkAll()"></th>
              <th>글번호</th>
              <th>반</th>
              <th>원아명</th>
              <th>제목</th>
              <th>ID</th>
              <th>학부모명</th>
              <th>작성 날짜</th>
              <th>문의확인</th>
            </tr>
            <%
            for(QnA q : list) {
            %>
            <tr>
              <td><input type ="checkbox" name="sangdham"> </td>
              <td name = "num"><%=q.getQno()%></td>
              <td name = "class"><%=q.getQcclass()%>반</td>
              <td name = "studentName"><%=q.getQcname()%></td>
              <td name = "title"><%=q.getQtitle()%></td>
              <td name = "parentId"><%=q.getQwriter()%></td>
              <td name = "parentName"><%=q.getQusername()%></td>
              <td name = "date"><%=q.getQdate()%></td>
              <td name = "chk_status"><%=q.getChk_status()%></td>
            </tr>
            <% 
            } 
            %>
          </table>

          <div>
            <nav aria-label="Page navigation example">
              <ul class="pagination pagination-sm justify-content-center">
                <li class="page-item disabled">
                  <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                </li>
                <li class="page-item disabled"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
              </ul>
            </nav>  
          </div>                   
        </div>
        
   		<script>
		$(function(){
			
			$("#viewTable td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"pink"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var nno = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/selectOne.qna?qno=" + qno;
			});
		});
		
	   		function checkAll(){
				if($("#chkalltop").is(':checked')){
					$("input[name=sangdham]").prop("checked", true);
				}else{
					$("input[name=sangdham]").prop("checked", false);
				}
			}
	   		
	   		function studentDelete(){				
				$("#updateForm").attr("action","<%=request.getContextPath() %>/qdelete.qna");
			}
   		</script>
        <!-- /.container-fluid -->
		</form>
      </div>
      <!-- End of Main Content -->

<%@ include file = "../intranet/common/footer.jsp" %>
</body>
</html>