<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%@ include file = "intranetFormList.jsp" %>
<%@ page import="semi.intranet.form.model.vo.Form" %>

<%
	Form form = (Form)request.getAttribute("form");
%>


<!-- Begin Page Content -->
    
<form action="<%=request.getContextPath() %>/fSignSave.fo" method="post">
<div class="card shadow mb-4">
  <div class="card-header py-3"> 
    <table style="min-width:0%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
      <tr>
        <td>
          <h6 class="m-0 font-weight-bold text-primary" style="width: 100px">품의결재창</h6>
    </td>
    <td align="right">
      <button type="submit" class = "btn btn-primary btn-sm" >결재완료</button>          
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
            <input type ="hidden" name = "writerId" value="<%= form.getfWriterId() %>" disabled>
          </td>
          <th>기안날짜</th>
          <td><%= form.getFdate() %></td>
        </tr>
        <tr>  
          <th>결재자</th>
          <td>
           <select name="formLine" id = "formLine1" disabled>
         		<option value="<%= form.getFsign1() %>" selected><%= form.getFsign1() %> 		
         			<input type ="hidden" name="signCode" id="signCode1" value="<%= form.getFsignId1() %>">
          		</option>
           </select>
           <select name = "formLineP" id = "formLineP1">
              <option value="선택">선택</option>
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select>
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine2" disabled>
            	<option value="">결재자 선택</option>
            		<option value="<%= form.getFsign2() %>" selected><%= form.getFsign2() %>    		
            			<input type ="hidden" name="signCode" id="signCode2" value="<%= form.getFsignId2() %>">
	            	</option>
            </select>
            <select name = "formLineP" id = "formLineP2">
              <option value="선택">선택</option>
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select>
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine3" disabled>
            	<option value="">결재자 선택</option>
            		<option value="<%= form.getFsign3() %>" selected><%= form.getFsign3() %>      		
            			<input type ="hidden" name="signCode" id="signCode3" value="<%= form.getFsignId3() %>">
	            	</option>
            </select>
            <select name = "formLineP" id = "formLineP3">
              <option value="선택">선택</option>
              <option value="Y">승인</option>
              <option value="N">반려</option>
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
        </form>
      </div>
  </div>          
</div>
</div>
  <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
//게시물 이동용 스크립트 
$('#viewTable td').click(function(){
		
	var fno = $(this).parent().find("input").val();
	location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;

});

$(function(){

	var empId = 2015001; //--> 바꾸기!!!!
	
	var sign1 = $('input[id=signCode1]').val();
	var sign2 = $('input[id=signCode2]').val();
	var sign3 = $('input[id=signCode3]').val();
	
	
	if(sign1 == empId) {
		$('#formLineP1').attr('disabled', false);
	} else {
		$('#formLineP1').attr('disabled', true);
	}
	
	if(sign2 == empId) {
		$('#formLineP2').attr('disabled', false);
	} else {
		$('#formLineP2').attr('disabled', true);
	}
	
	if(sign3 == empId) {
		$('#formLineP3').attr('disabled', false);
	} else {
		$('#formLineP3').attr('disabled', true);
	}

});

console.log($('select[name=formLineP]').val());

$('select[name=formLineP]').change(function(){
	fReturn(this);
});

function fReturn(o){
	var val = $(':selected',o).val();
	console.log(val);
	
	if(val == 'N') {
		$('input[name=formReturn]').attr('disabled',false);
	}
}




</script>


<%@ include file = "../intranet/common/footer.jsp" %>

