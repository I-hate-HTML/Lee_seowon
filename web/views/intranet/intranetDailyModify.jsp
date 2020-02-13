<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="semi.intranet.daily.model.vo.Daily"%>
<%@ include file = "common/nav.jsp" %>
<% Daily d = (Daily)request.getAttribute("daily"); %>
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
          <h1 class="h3 mb-4 text-gray-800">교육일지 글수정</h1>
          <div class="card shadow mb-4">
            <div class="card-body">
              <div class="table-responsive">                  
                 <form action="<%= request.getContextPath() %>/dModifySave.da" method="post" enctype="multipart/form-data">
                  <table class="table table-bordered" style="font-size:.9rem;">
                    <tbody>                      
                      <tr>
                      	  <th style="text-align:center">게시판</th>
                      	  <td>
                      	  	<select disabled >
                      	  		<% if(d.getBcategory() == 1) {%>
                      	  		<option value="1" selected>공지사항</option>
                      	  		<option value="2">교육일지</option>                      	  		
                      	  		<% } else if(d.getBcategory() == 2) {%>
                      	  		<option value="1">공지사항</option>
                      	  		<option value="2" selected>교육일지</option>
                      	  		<% } %>
                      	  	</select>
                      	  </td>
                          <th style="text-align:center">작성자</th>
                          <td style="text-align:center">
                         	<input type = "text" style="width:100%" name = "writer" value="<%= d.getBwriter() %>" disabled >
                      		<input type = "hidden" name = "writerId" value="<%= d.getBwriterCode() %>">
                      		<input type = "hidden" name = "dno" value = "<%= d.getBno() %>">
                      		<input type = "hidden" name = "category" value = "<%= d.getBcategory() %>">
                          </td>
                      </tr>
                      <tr>
                          <th style="text-align:center">제목</th>
                          <td colspan="3"><input type="text" name="subject" class="form-control" value="<%= d.getBtitle() %>"/></td>
                      </tr>
                      <tr>
                          <th style="text-align:center">내용</th>
                          <td colspan="3">
                          	<textarea cols="10" name="content" class="form-control" style="height: 300px; resize: none;" >
<%= d.getBcontent() %>
                          	</textarea>
                          </td>
                      </tr>
                      <tr>
                          <th style="text-align:center">첨부파일</th>
                          <td colspan="3">
                          	<input type="text" name="filename" class="form-control" value=<%= d.getBfile() %> />
                          <span><input type="file" name="file" id="file"/></span>
                          </td>
                      </tr>                         
                    </tbody>
                  </table>
                  <div class="float-right">
                  	<button type="submit" class="btn btn-link btn-primary btn-sm text-gray-400"  class="pull-right">수정</button>
           			<input type ="button" class="btn btn-link btn-primary btn-sm text-gray-400" onclick="location.href = 'dRead.da?dno=<%= d.getBno() %>'" value="취소">             
           		  </div>
         		 </form>
   			</div>
   	  	</div>
 	</div>
          

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
<%@ include file = "common/footer.jsp" %>
</body>
</html>