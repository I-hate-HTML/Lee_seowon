<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.home.alimjang.model.vo.AlimMedi" %>
<%@ page import="semi.intranet.alimjang.model.vo.Alim" %>
<%@ include file = "../intranet/common/nav.jsp" %>

<%
	AlimMedi a = (AlimMedi)request.getAttribute("a");
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
		              <h6 class="m-0 font-weight-bold text-primary">투약 의뢰서</h6>        		
		            </td>
		            <td align="right">
		            	<button class = "btn btn-primary btn-sm readBtn" value="Y">읽음 확인</button>
		              	<button class = "btn btn-primary btn-sm readBtn" value="N">읽음 취소</button>                                                        
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
                        	<input type="hidden" name="ano" value="<%= a.getAlmd_no() %>">
                        	<%= a.getAlmd_no() %>
                        </td>
                        <th style="text-align: center;">작성자</th>
                        <td style="text-align: center;"><%= a.getAlmd_writer() %></td>
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
                        	<%= b.getCclassName() %>반
                        </td>
                        <th style="text-align: center;">아이 이름</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="ccode" value="<%= b.getAchild() %>">
                        	<%= b.getAchild() %>
                        </td>
                        <th style="text-align: center;">날짜</th>
                        <td style="text-align: center;"><%= a.getAlmd_date() %></td>
                      </tr>
                      <tr>
	                      <th style="text-align: center;">증상</th>
	                      <td style="text-align: center;"><%= a.getAlmd_con()%></td>
	                      <th style="text-align: center;">약의 종류</th>
	                      <td style="text-align: center;"><%= a.getAlmd_type() %></td>
	                      <th style="text-align: center;">투약 용량</th>
	                      <td style="text-align: center;"><%= a.getAlmd_vol() %></td>
                      </tr>
                      <tr>
	                      <th style="text-align: center;">투약 횟수</th>
	                      <td>
	                        <select style="width:100%;" id="num" disabled>
                          		<option><%= a.getAlmd_num() %></option>
                      		</select>
                      	  </td>
	                      <th style="text-align: center;">투약 시간</th>
	                      <td style="text-align: center;"><%= a.getAlmd_time() %></td>
	                      <th style="text-align: center;">보관 방법</th>
	                      <td style="text-align: center;">
                            <input type = "radio" id="temp_1" name = "temp" value="실온" disabled>
                            <span>실온</span>     
                            <input type = "radio" id="temp_2" name = "temp" value="냉장" disabled>
                            <span>냉장</span>
                         </td>
                      </tr>
                      <tr>
                      	<th style="text-align: center; height:300px">특이사항</th>
                        <td colspan="5" style="height:300px">
                       	 <pre style="height:90%; width:90%"><%= a.getAlmd_ps() %></pre>
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

	var temp = '<%= a.getAlmd_temp()%>';
	
	if($('#temp_1').val() == temp) {
		$('#temp_1').attr('checked', true);
	} else if($('#temp_2').val() == temp){
		$('#temp_2').attr('checked', true);
	} 
	
	$('.readBtn').click(function(){
		console.log("버튼 클릭")
		
	if(<%= b.getCclass()%> == $('#classNum').val() ){
		
		var result = $(this).val();
		var ano = '<%= a.getAlmd_no() %>';
		var category = '<%= a.getAl_code() %>';
		var empno = '<%= m.getUserId()%>'
		
		console.log(result);
		console.log(ano);
		console.log(category);
		
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