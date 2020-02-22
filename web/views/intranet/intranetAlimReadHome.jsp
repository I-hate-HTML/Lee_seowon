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
		              <h6 class="m-0 font-weight-bold text-primary">귀가 의뢰서</h6>        		
		            </td>
		            <td align="right" id="btnTable">
		            	<button class = "btn btn-primary btn-sm readBtn" value='Y'>읽음 확인</button>
		              	<button class = "btn btn-primary btn-sm readBtn" value='N'>읽음 취소</button>                                                        
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
                        <td style="text-align: center;" id="chk">
                        	<input type="hidden" class = "tCK" name="ck" value="<%= b.getAck() %>">
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
                      <tr>
                        <th style="text-align: center;">귀가방법</th>
                        <td style="text-align: center;" colspan="2">
                          <select style="width:100%;" id="wayhome" disabled>
                          	<option><%= a.getAlhm_wayhome() %></option>
                          </select>
                        </td>
                        <th style="text-align: center;">귀가요청시간</th>
                        <td style="text-align: center;" colspan="2">
                          <select style="width:100%;" id="time" disabled>
                         	<option>
                         		<%
                         			String time = "";
                         		
                         			if(a.getAlhm_time().equals("오전")){
                         				time = "오전(12:00)";
                         			} else {
                         				time = "오후(15:00)";
                         			}
                         		%>
                         		<%= time %>
                         	</option>
                          </select>                                          
                        </td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">보호자</th>
                        <td colspan="2" style="text-align: center;">
                          	 <%= a.getAlhm_status() %>
                        </td>
                        <th style="text-align: center; border-right:hidden; border-left:hidden;">전화번호</th>
                        <td colspan="2" style="text-align: center;">
                            <%= a.getAlhm_phone() %>     
                        </td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">비상연락망</th>
                        <td colspan="2" style="text-align: center;">
                        	<%= a.getAlhm_status2() %>
                        </td>
                        <th style="text-align: center;  border-right:hidden; border-left:hidden;">전화번호</th>
                        <td colspan="2" style="text-align: center;">
                           <%= a.getAlhm_phone2() %>                                  
                        </td>
                      </tr>
                  </table>
                  <div class="float-right">
                    <input type="button" class="btn btn-link btn-primary btn-sm text-gray-400" value="반 목록" onclick="location.href='/semi/aListClass.al'"/>
                    <input type="button" class="btn btn-link btn-primary btn-sm text-gray-400" value="전체 목록" onclick="location.href='/semi/aListAll.al'"/>
                  </div>
              </form>
          
        </div>

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      
 <script>
 
 $('.readBtn').on("click", function(){
	console.log("버튼 클릭")
	
	if(<%= b.getCclass()%> == $('#classNum').val() ){
	
	
	var result = $(this).val();
	var ano = '<%= a.getAlhm_no() %>';
	var category = '<%= a.getAl_code() %>';
	var empno = '<%= m.getUserId()%>';
	
	$.ajax({
		url:"/semi/aReadCk.al",
		type:"post",
		data: {
			'result' : result,
			'ano' : ano,
			'category' : category,
			'empno' : empno
		},
		success:function(data){
			$('.tCK').val(result);
			$('#chk').text(result);
		}, error:function(data){
			alert("권한이 없습니다.");
		}
	});
	
	} else {
		alert("권한이 없습니다.");
	}
});
 </script>

<%@ include file = "../intranet/common/footer.jsp" %>
</body>
</html>