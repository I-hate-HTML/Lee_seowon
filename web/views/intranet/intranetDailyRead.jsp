<%@page import="semi.intranet.daily.model.vo.Daily"%>
<%@page import="java.util.ArrayList"%>
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
        <h6 class="m-0 font-weight-bold text-primary">교육일지확인</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
         <table class="table table-bordered" style="font-size: 12px;">
           <tr>
             <th style="text-align: center;">제목</th>
             <td colspan="5"><%= d.getDtitle() %></td>
           </tr>
           <tr>
             <th style="text-align: center;">반</th>
             <td>1</td>
             <th style="text-align: center;">작성자</th>
             <td><%= d.getDwriter() %></td>
             <th style="text-align: center;">날짜</th>
             <td><%= d.getDdate() %></td>
           </tr>
           <tr>
             <th style="text-align: center;">내용</th>
             <td colspan = "5" style="hieht:300px">
               <%= d.getDcontent() %>
             </td>
           </tr>
           <tr>
             <th style="text-align: center;">첨부파일</th>
             <td colspan = "5"><%= d.getDoardfile() %></td>
           </tr>
         </table>
    	<a class="btn btn-secondary btn-sm pull-right" href="/intranetProject/dList.da">목록</a>
	  </div>
     </div>
     </div>
  <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->


<%@ include file = "../intranet/common/footer.jsp" %>