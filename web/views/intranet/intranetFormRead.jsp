<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%@ page import="semi.intranet.form.model.vo.Form" %>

<%
	Form form = (Form)request.getAttribute("form");
%>


<!-- Begin Page Content -->
    

<div class="card shadow mb-4">
  <div class="card-header py-3"> 
    <table style="min-width:0px" table-layout="fixed;" word-break="break-all;" cellspacing="0">
      <tr>
        <td>
          <h6 class="m-0 font-weight-bold text-primary" style="width: 100px">품의결재창</h6>
    </td>
    <td align="right">
      <button class = "btn btn-primary btn-sm delete">삭제</button>             
    </td>
  </tr>
</table>
<div class="card-body">
  <div class="table-responsive">  	
      <table class="table table-bordered" id="dataTable" width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
        <tr>
          <th>품의번호</th>
          <td>
            <input type = "hidden" name="formNum" value = "<%= form.getFno() %>" >
            <%= form.getFno() %>
          </td>
          <th>분류</th>
          <td>
            <select id = "formCategory" name="formCategory" onchange="contentChange();" disabled>
              <option value = "<%= form.getFcategory() %>" selected><%= form.getCategory() %></option>
            </select>
          </td> 
          <th>기안자</th>
          <td>
           <%= form.getFwriter() %>
            <input type ="hidden" name = "writerId" value="<%= form.getfWriterId() %> disabled">
          </td>
          <th>기안날짜</th>
          <td><%= form.getFdate() %></td>
        </tr>
        <tr>  
          <th>결재자</th>
          <td>
           <select name="formLine" id = "formLine1" disabled>
         		<option value="" selected>		
         			<input type ="hidden" name="signCode" value="">
          		</option>
           </select>
           <select name = "formLineP" id = "formLineP1" disabled >            
             <option value="" ></option>
           </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine2" disabled>
            	<option value="">결재자 선택</option>
            		<option value="" selected>   		
            			<input type ="hidden" name="signCode" value="">
	            	</option>
            </select>
            <select  name = "formLineP" id = "formLineP2" disabled>
              <option value="" ></option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine3" disabled>
            	<option value="">결재자 선택</option>
            		<option value="" selected>      		
            			<input type ="hidden" name="signCode" value="">
	            	</option>
            </select>
            <select  name = "formLineP" id = "formLineP3" disabled>
              <option value="" ></option>
            </select> 
          </td>
          <td style="text-align: center;"colspan="2">
            <input type ="button" class="btn btn-primary btn-sm" onclick= "add();" value="결재자 추가" disabled>
            <input type ="button" class="btn btn-primary btn-sm" onclick= "del();" value="결재자 삭제" disabled>
          </td>
	        </tr>
	        <tr>
	          <th>반려이유</th>
	          <td colspan="7">
	            <input type="text" name = "formReturn" style = "width: 99%;" disabled>
	          </td>
	        </tr>
	        <tr>
	          <th>제목</th>
	          <td colspan="7">
	            <%= form.getFtitle() %>
	          </td>
	        </tr>
	        <tr>
	          <th>내용</th>
	          <td colspan="7">
	           <pre><%= form.getFcontent() %></pre> 
	          </td>
	        </tr>
            <tr>
              <th>첨부파일</th>
              <td colspan="7">
                <%= form.getFfile() %>
              </td>
            </tr>                
          </table>
      </div>
  </div>          
</div>
</div>
  <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>

$('#viewTable td').click(function(){
	
	var fno = $(this).parent().find("input").val();
	var empNo = 2015001; //--> 바꾸기!!!
	
	$.ajax({
		url:"/semi/fReadAjax.fo",
		type:"get",
		data: { 'fno' : fno,
				'empNo' : empNo
		},
		success:function(data){
			console.log(data);
			
			
			
			
		}, error:function(data){
			console.log("error");
		}
		
	});
	
});


// 삭제버튼
$(".delete").click(function(){
	
	if($('#formLineP1').val() != "null") {
		alert("이미 품의가 진행중입니다.");
		
	} else {
		var fno = "<%= form.getFno() %>";
		var eno = "2015001"; //--> 나중에 바꾸기!!!!
	 location.href="<%= request.getContextPath()%>/fDelete.fo?fno=" + fno + "&eno=" + eno;
	}
	
});

//게시물 이동용 스크립트 
$('#viewTable td').click(function(){
		
	var fno = $(this).parent().find("input").val();
	location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;

});


$(function(){
	
	// 결재자 1의 결재가 없으면 결재 select 안보이게
	if($('#formLineP1').val() == "null") {
		$('#formLineP1').css('display','none');
	}
	
	// 결재자 2가 없으면 select 안보이게
	if($('#formLine2').val() == "null") {
		$('#formLine2').css('display','none');
	}
	
	// 결재자 2의 결재가 없으면 결재 select 안보이게
	if($('#formLineP2').val() == "null") {
		$('#formLineP2').css('display','none');
	}
	
	// 결재자 3가 없으면 select 안보이게
	if($('#formLine3').val() == "null") {
		$('#formLine3').css('display','none');
	}
	
	// 결재자3의 결재가 없으면 결재 select 안보이게
	if($('#formLineP3').val() == "null") {
		$('#formLineP3').css('display','none');
	}

});






</script>


<%@ include file = "../intranet/common/footer.jsp" %>

