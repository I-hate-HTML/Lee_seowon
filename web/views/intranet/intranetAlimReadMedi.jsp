<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.home.alimjang.model.vo.AlimHome" %>
<%@ page import="semi.intranet.alimjang.model.vo.Alim" %>
<%@ include file = "../intranet/common/nav.jsp" %>

<%
	AlimHome a = (AlimHome)request.getAttribute("a");
	Alim b = (Alim)request.getAttribute("b");
%>
<!-- Begin Page Content -->

        <div class="container-fluid">
          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">알림장</h1>

          <div class="card shadow mb-4">
            <div class="card-header py-3">
               <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
		          <tr>
		            <td>
		              <h6 class="m-0 font-weight-bold text-primary">귀가 동의서</h6>        		
		            </td>
		            <td align="right">
		            	<button class = "btn btn-primary btn-sm" >읽음 확인</button>
		              	<button class = "btn btn-primary btn-sm" >읽음 취소</button>                                                        
		            </td>
		          </tr>
		        </table>
            </div>
            <div class="card-body">
              <div class="table-responsive">                  
                <form action="write_ok.jsp" method="post" encType="multiplart/form-data"></form>
                  <form action="write_ok.jsp" method="post" encType="multiplart/form-data"></form>
                  <table class="table table-bordered" style="font-size: 0.9rem;">
                    <tr>
                        <th style="text-align: center;">글번호</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="ano" value="<%= a.getAlhm_no() %>">
                        	<%= a.getAlhm_no() %>
                        </td>
                        <th style="text-align: center;">작성자</th>
                        <td style="text-align: center;"><%= a.getAlhm_writer() %></td>
                        <th style="text-align: center;">선생님확인</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="ck" value="<%= b.getAck() %>">
                        	<%= b.getAck() %>
                        </td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">반</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="class" value="<%= b.getCclass() %>">
                        	<%= b.getCclass() %>반
                        </td>
                        <th style="text-align: center;">아이 이름</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="ccode" value="<%= b.getAchild() %>">
                        	<%= b.getAchild() %>
                        </td>
                        <th style="text-align: center;">날짜</th>
                        <td style="text-align: center;"><%= a.getAlhm_date() %></td>
                      </tr>
                      
                  </table>
                  <div class="float-right">
                    <input type="button" class="btn btn-link btn-primary btn-sm text-gray-400" value="목록" onclick="history.back()"/>
                  </div>
              </form>
          
        </div>

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

<%@ include file = "../intranet/common/footer.jsp" %>
</body>
</html>