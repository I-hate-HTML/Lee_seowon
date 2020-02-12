<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.home.alimjang.model.vo.AlimNote" %>
<%@ page import="semi.intranet.alimjang.model.vo.Alim" %>
<%@ include file = "../intranet/common/nav.jsp" %>

<%
	AlimNote a = (AlimNote)request.getAttribute("a");
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
		              <h6 class="m-0 font-weight-bold text-primary">알림 노트</h6>        		
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
                  <table class="table table-bordered" style="font-size: .9rem;">
                    <tbody>
                      <tr>
                        <th style="text-align: center;">글번호</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="ano" value="<%= a.getAl_no() %>">
                        	<%= a.getAl_no() %>
                        </td>
                        <th style="text-align: center;">작성자</th>
                        <td style="text-align: center;"><%= b.getAwriter() %></td>
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
                        	<input type="hidden" name="ccode" value="<%= b.getAck() %>">
                        	<%= b.getAchild() %>
                        </td>
                        <th style="text-align: center;">날짜</th>
                        <td style="text-align: center;"><%= b.getAdate() %></td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">내용</th>
                        <td colspan="5"><%= a.getAl_content() %></td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">기분</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "hidden" id="conditionType" value="<%= a.getAl_feel()%>">
                          <input type = "radio" class="condition" name = "condition" value="좋음" disabled>
                          <span>좋음</span>
                          <input type = "radio" class="condition" name = "condition" value="보통" disabled>
                          <span>보통</span>
                          <input type = "radio" class="condition" name = "condition" value="나쁨" disabled>
                          <span>나쁨</span>
                        </td>
                        
                       
                        
                        
                        
                        <th style="text-align: center;">건강</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="health_1" name = "health" disabled>
                          <span>좋음</span>
                          <input type = "radio" id="health_2" name = "health" checked="true" disabled>
                          <span>보통</span>
                          <input type = "radio" id="health_3" name = "health" disabled>
                          <span>나쁨</span>
                        </td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">체온체크</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="tem_1" name = "tem" checked="true" disabled>
                          <span>정상</span>
                          <input type = "radio" id="tem_2" name = "tem" disabled>
                          <span>미열</span>
                          <input type = "radio" id="tem_3" name = "tem" disabled>
                          <span>고열</span>
                        </td>
                        <th style="text-align: center;">식사여부</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="eat_1" name = "eat" checked="true" disabled >
                          <span>좋음</span>
                          <input type = "radio" id="eat_2" name = "eat" disabled>
                          <span>보통</span>
                          <input type = "radio" id="eat_3" name = "eat" disabled>
                          <span>나쁨</span>
                        </td>
                      </tr>
                      <tr>
                      <th style="text-align: center;">수면시간</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="sleep_1" name = "sleep" checked="true;" disabled>
                          <span>좋음</span>
                          <input type = "radio" id="sleep_2" name = "sleep" disabled>
                          <span>보통</span>
                          <input type = "radio" id="sleep_3" name = "sleep" disabled>
                          <span>나쁨</span>
                        </td>
                        <th style="text-align: center;">배변상태</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="toilet_1" name = "toilet" checked="true;" disabled>
                          <span>좋음</span>
                          <input type = "radio" id="toilet_2" name = "toilet" disabled>
                          <span>보통</span>
                          <input type = "radio" id="toilet_3" name = "toilet" disabled>
                          <span>나쁨</span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="float-right">
                    <input type="button" class="btn btn-link btn-primary btn-sm text-gray-400" value="목록" onclick="history.back()"/>
                  </div>
              </form>
          
        </div>

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

 <script>
                        	
$(function(){
	console.log($('.condition').val());
	console.log($('#conditionType').val());
	
	if($('.condition').val() == $('#conditionType').val()) {
		$(this).attr('checked',true);
	}
	
});

</script>

<%@ include file = "../intranet/common/footer.jsp" %>
</body>
</html>