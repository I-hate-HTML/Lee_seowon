<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%@ include file = "intranetFormList.jsp" %>
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
            <input type = "text" style="padding-left: 0.2rem;"name="formNum" value = "<%= form.getFno() %>" disabled>
          </td>
          <th>분류</th>
          <td>
            <select id = "formCategory" name="formCategory" onchange="contentChange();" disabled>
              <option value = "<%= form.getFcategory() %>" selectedz><%= form.getFcategory() %></option>
            </select>
          </td> 
          <th>기안자</th>
          <td>
           <%= form.getFwriter() %>
            <input type ="hidden" name = "writerId" value="<%= form.getfWriterId() %> disabled">
          </td>
          <th>기안날짜</th>
          <td><input type = "date" name="formDate" value="<%= form.getFdate() %>" disabled></td>
        </tr>
        <tr>  
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine" disabled>
            	<option value="">결재자 선택</option>
            		<option value="<%= form.getFsign() %>" selected>            		
            			<input type ="hidden" name="signCode" value="<%= form.getFsignId() %>">
	            	</option>
            </select>
            <select name = "formLineP" disabled >            
              <option value="" >선택</option>
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine2" disabled>
              <option value="1">원장 김원장</option>
              <option value="2">부원장 박부원장</option>
              <option value="3">정교사 강교사</option>
              <option value="4">정교사 이교사</option>
              <option value="5">조리원 오조리원</option>
            </select>
            <select  name = "formLineP" disabled>
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine3" disabled>
              <option value="1">원장 김원장</option>
              <option value="2">부원장 박부원장</option>
              <option value="3">정교사 강교사</option>
              <option value="4">정교사 이교사</option>
              <option value="5">조리원 오조리원</option>
            </select>
            <select  name = "formLineP" disabled>
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


<%@ include file = "../intranet/common/footer.jsp" %>
