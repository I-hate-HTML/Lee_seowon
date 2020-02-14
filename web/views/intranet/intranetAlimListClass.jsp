<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi.intranet.alimjang.model.vo.Alim"%>
<%@page import="semi.intranet.alimjang.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ include file = "../intranet/common/nav.jsp" %>

<%
	ArrayList<Alim> list = (ArrayList<Alim>)request.getAttribute("list");

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
</head>
<body>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">알림장</h1>

          <div class="card shadow mb-4">
            <div class="card-header py-3"> 
             <ul class="nav nav-pills">
			  <li class="nav-item">
			    <a class="nav-link active" href="/semi/aListClass.al">Class</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/semi/aListAll.al">All</a>
			  </li>
			</ul>
            </div>
            <div class="card-body">
              <div class="table-responsive"> 
                  <table id = "viewTable" class="table table-striped" style="font-size:.8rem; text-align: center;">
                    <tr>
                      <th style="width:10%">번호</th>
                      <th style="width:20%">구분</th>
                      <th style="width:10%">반</th>
                      <th style="width:15%">원아명</th>
                      <th style="width:15%">작성자</th>
                      <th style="width:20%">날짜</th>
                      <th style="width:11%">확인</th>
                    </tr>
                    <% for(Alim a : list) { %>
                    <tr>
	                  <td> 
	                    <input type = "hidden" id = "ano1" name = "ano" value="<%= a.getAno() %>">
	                  	<%= a.getArownum() %>
	                  </td>
	                  <td>
	                  	<input type = "hidden" name = "category" value="<%= a.getAcategory() %>">
	                  	<%= a.getCategory() %>
	                  </td>
	                  <td><%= a.getCclass() %>반</td>
	                  <td>
	                  	<input type = "hidden" name = "ccode" value="<%= a.getCcode() %>">
	                  	<%= a.getAchild() %>
	                  </td>
	                  <td><%= a.getAwriter() %></td>
	                  <td><%= a.getAdate() %></td>
	                  <td>
	                  	<input type = "hidden" name = "ck" value="<%= a.getAck() %>">
	                  	<%= a.getAck() %>
	                  </td>
                    </tr>
                    <% } %>
                  </table>


				<!-- 페이징 처리 -->
                  <nav aria-label="Page navigation example">
              <ul class="pagination pagination-sm justify-content-center">
                
                <!-- 현재 페이지가 1페이지면 이전 페이지 버튼 disabled -->
                <% if(currentPage <= 1){ %>
                <li class="page-item disabled">
                  <a class="page-link" href="<%= request.getContextPath() %>/aListClass.al?currentPage=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                 </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="<%= request.getContextPath() %>/aListClass.al?currentPage=<%=currentPage -1 %>" aria-label="Previous">
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
                	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/aListClass.al?currentPage=<%= p %>"><%= p %></a></li>	
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
                  <a class="page-link" href="<%= request.getContextPath() %>/aListClass.al?currentPage=<%=currentPage +1 %>" aria-label="Next">
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
    	var ano = $(this).parent().children().find("input[type=hidden]").val(); 
    	var category = $(this).parent().children().eq(1).find("input[type=hidden]").val();
      
    	console.log('ano : ' + ano);
    	console.log('category : ' + category);
    	
    	location.href = "<%= request.getContextPath() %>/aRead.al?ano=" + ano + "&category=" + category;
    });
  });
</script>

<%@ include file = "../intranet/common/footer.jsp" %>
</body>
</html>