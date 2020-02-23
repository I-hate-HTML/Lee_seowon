<%@page import="java.util.*,semi.intranet.qna.model.vo.*,semi.intranet.qna.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav.jsp" %>
<% 
	ArrayList<IntranetQna> list = (ArrayList<IntranetQna>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

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
               <h6 class="m-0 font-weight-bold text-primary">문의확인</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive"> 
                  <table id = "viewTable" class="table table-striped" style="font-size:12px; text-align: center;">
                    
            <tr>
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
            for(IntranetQna q : list) {
            %>
            <tr>
              <td name = "num" >
              	<input type = "hidden" id = "qno1" name = "qno" value="<%= q.getQno() %>">
              	<%=q.getQno()%>
              </td>
              <td name = "className">
              	<%= q.getqClassName() %>반
              	<input type="hidden" name="classNum" value="<%= q.getQcclass() %>">
              </td>
              <td name = "studentName">
              	<%=q.getQcname()%>
              	<input type="hidden" name="CNO" value="<%= q.getQcnum() %>">
              </td>
              <td name = "title"><%=q.getQtitle()%></td>
              <td name = "parentId">
              	<%=q.getQwriter()%>
              	<input type="hidden" name="MNO" value="<%= q.getQusernum() %>">
              </td>
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
                <!-- 현재 페이지가 1페이지면 이전 페이지 버튼 disabled -->
                <% if(currentPage <= 1){ %>
                <li class="page-item disabled">
                  <a class="page-link" href="<%= request.getContextPath() %>/aListAll.al?currentPage=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                 </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="<%= request.getContextPath() %>/aListAll.al?currentPage=<%=currentPage -1 %>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                </li>
                <% } %>
                
                
                <!-- 페이지 버튼 만들고 현재 페이지는 버튼 disabled -->                
                <%	for(int p = startPage; p <= endPage; p++){
                		if(p == currentPage){ 
                %>               
                	<li class="page-item disabled"><a class="page-link"><%= p %></a></li>
                <%		} else {%>	
                	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/aListAll.al?currentPage=<%= p %>"><%= p %></a></li>	
                <%		} %>
                <%	} %>
                		
                <% if(currentPage >= maxPage){ %>
                <li class="page-item disabled">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="<%= request.getContextPath() %>/aListAll.al?currentPage=<%=currentPage +1 %>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
                <% } %>
              </ul>
            </nav>
          </div>                   
        </div>
        
   		<script>
   		
	 	//게시물 이동용 스크립트 
	 	 $('#viewTable td').click(function(){
	 	 		
	 	 		var qno = $(this).parent().children().find("input[type=hidden]").val(); 
	 	 		location.href="<%= request.getContextPath() %>/qSelectOne.qna?qno=" + qno;
	 	 
	 	 });

		<%-- $(function(){
			
			$("#viewTable td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var qno = $(this).parent().children().eq(0).text();
				alert(qno);
				location.href="<%=request.getContextPath()%>/selectOne.qna?qno=" + qno;
			});
		}); --%>
		
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