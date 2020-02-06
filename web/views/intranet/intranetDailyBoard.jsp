<%@page import="semi.intranet.daily.model.vo.Daily"%>
<%@page import="semi.intranet.daily.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav.jsp" %>

<%
	ArrayList<Daily> list = (ArrayList<Daily>)request.getAttribute("list"); 
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<!-- Begin Page Content -->
  <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">교육일지</h1>

    <div class="card shadow mb-4">
      <div class="card-header py-3"> 
        <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
          <tr>
            <td>
              <a class="btn btn-primary btn-sm" href="/intranetProject/views/intranet/intranetWrite.jsp">글쓰기</a>
            </td>
            <td align="right">
              <button class = "btn btn-primary btn-sm" onclick="studentModify();">수정</button>
              <button class = "btn btn-primary btn-sm" onclick="studentDelete();">삭제</button>                              
            </td>
          </tr>
        </table>
      </div>
      <div class="card-body">
        <div class="table-responsive"> 
            <table id = "viewTable" class="table table-striped" style="font-size:12px; text-align: center;">
              <tr>
                <th width = "10%">번호</th>
                <th width = "5%">반</th>
                <th width = "35%">제목</th>
                <th width = "15%">작성자</th>
                <th width = "20%">작성일</th>
                <th width = "15%">조회수</th>
              </tr>
              <% for(Daily d : list) { %>
              <tr>
                <td><%= d.getDno() %></td>
                <td><%= d.getDclass() %></td>
                <td><%= d.getDtitle() %></td>
                <td><%= d.getDwriter() %></td>
                <td><%= d.getDdate() %></td>     
                <td><%= d.getDcount() %></td>           
              </tr>
              <% } %>
            </table>
            
            
            <!-- 페이징 처리 -->

            <nav aria-label="Page navigation example">
              <ul class="pagination pagination-sm justify-content-center">
                
                <!-- 현재 페이지가 1페이지면 이전 페이지 버튼 disabled -->
                <% if(currentPage <= 1){ %>
                <li class="page-item disabled">
                  <a class="page-link" href="<%= request.getContextPath() %>/dList.da?currentPage=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                 </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="<%= request.getContextPath() %>/dList.da?currentPage=<%=currentPage -1 %>" aria-label="Previous">
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
                	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/dList.da?currentPage=<%= p %>"><%= p %></a></li>	
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
                <li class="page-item disabled">
                  <a class="page-link" href="<%= request.getContextPath() %>/dList.da?currentPage=<%=currentPage +1 %>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
                <% } %>
              </ul>
            </nav> 
                 
        </div>
      </div>

  </div>
  <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
  $(function(){
    $('#viewTable td').click(function(){
    	/* console.log($(this).parent().children().eq(1).text()); */
      var dno = $(this).parent().children().eq(0).text();
      location.href = "<%= request.getContextPath() %>/dRead.da?dno=" + dno;
    });
  });
</script>

<%@ include file = "../intranet/common/footer.jsp" %>