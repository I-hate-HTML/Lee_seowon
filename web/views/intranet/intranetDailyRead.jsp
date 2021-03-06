<%@page import="semi.intranet.daily.model.vo.Daily"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav.jsp" %>

<%
	Daily d = (Daily)request.getAttribute("daily");
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
        		<h6 class="m-0 font-weight-bold text-primary">교육일지</h6>
            </td>
            <td align="right">
              <button class = "btn btn-primary btn-sm readBtn" onclick="location.href='dModifyView.da?dno=<%= d.getBno() %>'">수정</button>
              <button class = "btn btn-primary btn-sm readBtn" onclick="location.href='<%= request.getContextPath() %>/dDelete.da?dno=<%= d.getBno() %>'">삭제</button>                              
            </td>
          </tr>
        </table>
      </div>
      <div class="card-body">
        <div class="table-responsive">
         <table class="table table-bordered" style="font-size: .9rem;">
           <tr>
             <th style="text-align: center;">제목</th>
             <td colspan="5"><%= d.getBtitle() %></td>
           </tr>
           <tr>
             <th style="text-align: center;">반</th>
             <td>
             	<input type = "hidden" name = "dclassNum" value="<%= d.getBclass() %>"/>
                <%= d.getBclassName() %>
             </td>
             <th style="text-align: center;">작성자</th>
             <td>
             	<input type = "hidden" id="dwriterCode" name = "dwriterCode" value="<%= d.getBwriterCode() %>"/>
             	<%= d.getBwriter() %>
             </td>
             <th style="text-align: center;">날짜</th>
             <td><%= d.getBdate() %></td>
           </tr>
           <tr>
             <th style="text-align: center;">내용</th>
             <td colspan = "5" style="height:300px">
               <pre style="height:90%; width:90%"><%= d.getBcontent() %></pre>
             </td>
           </tr>
           <tr>
             <th style="text-align: center;">첨부파일</th>
             <td colspan = "5">
             	<% if(d.getBfile() != null) {%>
	             	<a href="<%= request.getContextPath()%>/resources/intranet/uploadFiles/Daily/<%= d.getBfile() %>"
	             	download="<%= d.getBfile()%>">
		             	<%= d.getBfile() %>
	             	</a>             
             	<% } else {%>
             		첨부파일 없음
             	<% } %>
             </td>
           </tr>
         </table>
    	<a class="btn btn-secondary btn-sm pull-right" href="<%= request.getContextPath() %>/dList.da">목록</a>
     	

	  </div>
     </div>
     </div>
  <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
	$(function(){
		 if(<%= m.getUserId()%> != $('#dwriterCode').val()){
			 $('.readBtn').css('display','none');
		 }
	 });
</script>

<%@ include file = "../intranet/common/footer.jsp" %>