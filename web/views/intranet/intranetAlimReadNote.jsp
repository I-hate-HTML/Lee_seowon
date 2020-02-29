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
		            	<button class = "btn btn-primary btn-sm readBtn" name="ck" value="Y">읽음 확인</button>
		              	<button class = "btn btn-primary btn-sm readBtn" name="cs" value="N">읽음 취소</button>                                                        
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
                        <td style="text-align: center;"><%= a.getAl_writer() %></td>
                        <th style="text-align: center;">선생님확인</th>
                        <td style="text-align: center;" id="chk">
                        	<input type="hidden" class="tCK" name="ck" value="<%= b.getAck() %>">
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
                        <td style="text-align: center;"><%= a.getAl_date() %></td>
                      </tr>
                      <tr>
                        <th style="text-align: center; height:300px">내용</th>
                        <td colspan="5" style="height:300px">
                        <pre style="height:90%; width:90%"><%= a.getAl_content() %></pre>
                        </td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">기분</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="condition_1" name = "condition" value="좋음" disabled>
                          <span>좋음</span>     
                          <input type = "radio" id="condition_2" name = "condition" value="보통" disabled>
                          <span>보통</span>     
                          <input type = "radio" id="condition_3" name = "condition" value="나쁨" disabled>
                          <span>나쁨</span>
                        </td>
                        <th style="text-align: center;">건강</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="health_1" name = "health" value="좋음" disabled>
                          <span>좋음</span>                                                
                          <input type = "radio" id="health_2" name = "health" value="보통" disabled>
                          <span>보통</span>                                                
                          <input type = "radio" id="health_3" name = "health" value="나쁨" disabled>
                          <span>나쁨</span>                                                
                        </td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">식사여부</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="eat_1" name = "eat" value="약간" disabled >
                          <span>약간</span>                                       
                          <input type = "radio" id="eat_2" name = "eat" value="보통" disabled>
                          <span>보통</span>                                       
                          <input type = "radio" id="eat_3" name = "eat" value="많이" disabled>
                          <span>많이</span>
                        </td>
                        <th style="text-align: center;">배변상태</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="toilet_1" name = "toilet" value="좋음" disabled>
                          <span>좋음</span>                                              
                          <input type = "radio" id="toilet_2" name = "toilet" value="보통" disabled>
                          <span>보통</span>                                              
                          <input type = "radio" id="toilet_3" name = "toilet" value="나쁨" disabled>
                          <span>나쁨</span>
                        </td>
                      </tr>
                      <tr>
                      <th style="text-align: center;">수면시간</th>
                        <td style="text-align: center;" colspan="5">
                          <input type = "radio" id="sleep_1" name = "sleep" value="8시간 이상" disabled>
                          <span>8시간 이상</span>                                            
                          <input type = "radio" id="sleep_2" name = "sleep" value="6~8시간" disabled>
                          <span>6~8시간</span>                                            
                          <input type = "radio" id="sleep_3" name = "sleep" value="4~6시간" disabled>
                          <span>4~6시간</span>
                          <input type = "radio" id="sleep_4" name = "sleep" value="4시간 미만" disabled>
                          <span>4시간 미만</span>
                        </td>
                       </tr>
                       <tr>
                        <th style="text-align: center;">체온체크</th>
                        <td style="text-align: center;" colspan="2">
                          <input type = "radio" id="tem_1" name = "tem" value="정상" disabled>
                          <span>정상</span>                                    
                          <input type = "radio" id="tem_2" name = "tem" value="미열" disabled>
                          <span>미열</span>                                    
                          <input type = "radio" id="tem_3" name = "tem" value="고열" disabled>
                          <span>고열</span>
                        </td>
                        <td style="border-left:hidden; border-right:hidden">
                        </td>
                        <td style="text-align: center;" colspan="2">
                        </td>
                      </tr>
                    </tbody>
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
                        	
$(function(){

	var condition = '<%= a.getAl_feel()%>'; 
	var health = '<%= a.getAl_health() %>';
	var tem = '<%= a.getAl_temp() %>';
	var sleep = '<%= a.getAl_sleep() %>';
	var meal = '<%= a.getAl_meal() %>';
	var poop = '<%= a.getAl_poop() %>';
		

	/* 기분  */
	if($('#condition_1').val() == condition) {
		$('#condition_1').attr('checked', true);
	} else if($('#condition_2').val() == condition){
		$('#condition_2').attr('checked', true);
	} else {
		$('#condition_3').attr('checked', true);
	}
	
	/* 건강  */
	if($('#health_1').val() == health) {
		$('#health_1').attr('checked', true);
	} else if($('#health_2').val() == health){
		$('#health_2').attr('checked', true);
	} else {
		$('#health_3').attr('checked', true);
	}
	
	/* 체온체크  */
	if($('#tem_1').val() == tem) {
		$('#tem_1').attr('checked', true);
	} else if($('#tem_2').val() == tem){
		$('#tem_2').attr('checked', true);
	} else {
		$('#tem_3').attr('checked', true);
	}	
	
	/* 식사여부  */
	if($('#eat_1').val() == meal) {
		$('#eat_1').attr('checked', true);
	} else if($('#eat_2').val() == meal){
		$('#eat_2').attr('checked', true);
	} else {
		$('#eat_3').attr('checked', true);
	}
	
	/* 수면시간  */
	if($('#sleep_1').val() == sleep) {
		$('#sleep_1').attr('checked', true);
	} else if($('#sleep_2').val() == sleep){
		$('#sleep_2').attr('checked', true);
	} else {
		$('#sleep_3').attr('checked', true);
	}
	
	/* 배변상태  */
	if($('#toilet_1').val() == poop) {
		$('#toilet_1').attr('checked', true);
	} else if($('#toilet_2').val() == poop){
		$('#toilet_2').attr('checked', true);
	} else {
		$('#toilet_3').attr('checked', true);
	}
});	
	

	$('.readBtn').click(function(){
		console.log("버튼 클릭")
		
		if(<%= b.getCclass()%> == $('#classNum').val() ){
	
		
		var result = $(this).val();
		var ano = '<%= a.getAl_no()%>';
		var category = '<%= a.getAl_code() %>';
		var text = $('.tCK').val(result);
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