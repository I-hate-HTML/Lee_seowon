<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%-- <%@ include file = "intranetFormList.jsp" %> --%>
<%@ include file = "intranetFormListAjax.jsp" %>
<%@ page import="semi.intranet.form.model.vo.Form" %>

<%
	Form form = (Form)request.getAttribute("form");
%>


<!-- Begin Page Content -->
    
<form action="<%=request.getContextPath() %>/fWrite.fo" method="post" enctype="multipart/form-data">
<div class="card shadow mb-4">
  <div class="card-header py-3"> 
    <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
      <tr>
        <td>
          <h6 class="m-0 font-weight-bold text-primary" style="width: 100px">품의결재창</h6>
    </td>
    <td align="right">
      <button class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fModifyView.fo'">수정</button>
      <button class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fDelete.fo'">삭제</button>             
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
         		<option value="<%= form.getFsign1() %>" selected><%= form.getFsign1() %> 		
         			<input type ="hidden" name="signCode" value="<%= form.getFsignId1() %>">
          		</option>
           </select>
           <select name = "formLineP" id = "formLineP1" disabled style="display:block">            
             <option value="<%= form.getFsignck1() %>" ><%= form.getFsignck1() %></option>
           </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine2" disabled style="display:none">
            	<option value="">결재자 선택</option>
            		<option value="<%= form.getFsign2() %>" selected><%= form.getFsign2() %>    		
            			<input type ="hidden" name="signCode" value="<%= form.getFsignId2() %>">
	            	</option>
            </select>
            <select  name = "formLineP" id = "formLineP2" disabled style="display:none">
              <option value="<%= form.getFsignck2() %>" ><%= form.getFsignck2() %></option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine3" disabled style="display:none">
            	<option value="">결재자 선택</option>
            		<option value="<%= form.getFsign3() %>" selected><%= form.getFsign3() %>      		
            			<input type ="hidden" name="signCode" value="<%= form.getFsignId3() %>">
	            	</option>
            </select>
            <select  name = "formLineP" id = "formLineP3" disabled style="display:none">
              <option value="<%= form.getFsignck3() %>" ><%= form.getFsignck3() %></option>
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
	            <%= form.getFcontent() %>
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
$(function(){
	
	/* if($('#formLineP').val() == null) {
		$('#formLineP').css('display','none');
	}
	 */
	
	 console.log($('#formLineP1').val());
	 var dd = $('#formLineP1').val();
	 console.log(dd);
	 
/* 		if($('#formLineP1').val() ) {
			$('#formLineP1').css('display','block');
		} */
		
	
	
	
});
</script>


<%@ include file = "../intranet/common/footer.jsp" %>

