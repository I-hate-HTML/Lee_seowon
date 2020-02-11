<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.intranet.form.model.vo.SignList, java.util.ArrayList, semi.intranet.form.model.vo.Form" %>
<%@ page import="semi.intranet.daily.model.vo.PageInfo" %>

<%

	ArrayList<Form> flist = (ArrayList<Form>)request.getAttribute("list");
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
<h1 class="h3 mb-4 text-gray-800">품의 관리</h1>

<div class="card shadow mb-4">
  <div class="card-header py-3">
  	
  	<table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
      <tr>
        <td>
          <h6 class="m-0 font-weight-bold text-primary">품의목록</h6>
    </td>
    <td align="right">
      <input type="button" class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fListOnly.fo'" value="글쓰기">
    </td>
  </tr>
</table>
  </div>
  <div class="card-body">
    <div class="table-responsive"> 
      <table id = "viewTable" class="table table-striped">
        <tr>
          <th width = "10%">품의번호</th>
          <th width = "10%">분류</th>
          <th width = "10%">상태</th>
          <th width = "35%">제목</th>
          <th width = "15%">기안자</th>               
          <th width = "20%">작성일</th>
        </tr>
        	<% for(Form f : flist) {%>
        <tr>
          <td style="text-align: center">
          	<input type="hidden" name ="fno" value="<%= f.getFno() %>">
         	 <%= f.getFno() %>
          </td>          
          <td style="text-align: center">
          	<input type="hidden" id="listCategory" name = "category" value="<%= f.getFcategory() %>">        
          	<span id = "typeChage"><%= f.getFcategory() %></span>
          </td>
          <td style="text-align: center"><%= f.getFstatus() %></td>
          <td style="text-align: center"><%= f.getFtitle() %></td>
          <td style="text-align: center">
          	<%= f.getFwriter() %>
          	<input type = "hidden" id="writerId" value ="<%= f.getfWriterId() %>"/>
          </td>
          <td style="text-align: center"><%= f.getFdate() %></td>    
        </tr>
        
        <% } %>                              
       </table>
       
          <nav aria-label="Page navigation example">
              <ul class="pagination pagination-sm justify-content-center">
                
                <!-- 현재 페이지가 1페이지면 이전 페이지 버튼 disabled -->
                <% if(currentPage <= 1){ %>
                <li class="page-item disabled">
                  <a class="page-link" href="<%= request.getContextPath() %>/fListOnly.fo?currentPage=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                 </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="<%= request.getContextPath() %>/fListOnly.fo?currentPage=<%=currentPage -1 %>" aria-label="Previous">
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
                	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/fListOnly.fo?currentPage=<%= p %>"><%= p %></a></li>	
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
                  <a class="page-link" href="<%= request.getContextPath() %>/fListOnly.fo?currentPage=<%=currentPage +1 %>" aria-label="Next">
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
  
  
 <script>
 
 $(function(){
	$('#viewTable td').click(function(){
		
		var fno = $(this).parent().find("input").val();
		var fwriterId = $('#writerId').val();
		
		$.ajax({
			url:"/semi/fRead.fo",
			type:"post",
			data{
				fno:fno,
				fwriterId:fwriterId
			}, success:function(page:"page", f:"form"){
		
				
			}
		});
		
		
		
	});
				location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;
 });
 
 
  $(function(){
	
	var type = $('#listCategory').val();
	/* var table = $('#viewTable td').eq(1).text(); */
	var table = $('#typeChage').text();
	
	if(type = '1') table = '지출결의서';	
	else if(type = '2') table = '휴가신청서';
	else if(type = '3') table = '교구신청서';
	else if(type = '4') table = '기타';

	</script>
 
 
    