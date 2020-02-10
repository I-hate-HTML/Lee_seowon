<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%@ page import="semi.intranet.form.model.vo.SignList, java.util.ArrayList, semi.intranet.form.model.vo.Form" %>
<%@ page import="semi.intranet.daily.model.vo.PageInfo" %>

<%
	
	ArrayList<Form> flist = (ArrayList<Form>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	Form form = (Form)request.getAttribute("form");
%>


<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">품의 관리</h1>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">품의목록</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive"> 
      <table id = "viewTable" class="table table-striped">
        <tr>
          <th width = "10%">품의번호</th>
          <th width = "10%">분류</th>
          <th width = "10%">상태</th>
          <th width = "35%">제목</th>
          <th width = "15%">기안자</th>               
          <th width = "20%">작성일</th>
        </tr>
        	<% for(Form f : flist) {%>
        <tr>
          <td style="text-align: center">
          	<input type="hidden" name ="fno" value="<%= f.getFno() %>">
         	 <%= f.getFno() %>
          </td>          
          <td style="text-align: center"><%= f.getFcategory() %></td>
          <td style="text-align: center"><%= f.getFstatus() %></td>
          <td style="text-align: center"><%= f.getFtitle() %></td>
          <td style="text-align: center">
          	<%= f.getFwriter() %>
          	<input type = "hidden" value ="<%= f.getfWriterId() %>"/>
          </td>
          <td style="text-align: center"><%= f.getFdate() %></td>    
        </tr>
        <% } %>                              
       </table>

          <nav aria-label="Page navigation example">
              <ul class="pagination pagination-sm justify-content-center">
                
                <!-- 현재 페이지가 1페이지면 이전 페이지 버튼 disabled -->
                <% if(currentPage <= 1){ %>
                <li class="page-item disabled">
                  <a class="page-link" href="<%= request.getContextPath() %>/fList.fo?currentPage=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                 </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="<%= request.getContextPath() %>/fList.fo?currentPage=<%=currentPage -1 %>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                  </a>
                </li>
                <% } %>
                
                
                <!-- 페이지 버튼 만들고 현재 페이지는 버튼 disabled -->                
                <%	for(int p = startPage; p <= endPage; p++){
                		if(p == currentPage){ 
                %>               
                	<li class="page-item disabled"><a class="page-link"><%= p %></a></li>
                <%		} else {%>	
                	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/fList.fo?currentPage=<%= p %>"><%= p %></a></li>	
                <%		} %>
                <%	} %>
                		
                <% if(currentPage >= maxPage){ %>
                <li class="page-item disabled">
                  <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
                <% } else { %>
                <li class="page-item">
                  <a class="page-link" href="<%= request.getContextPath() %>/fList.fo?currentPage=<%=currentPage +1 %>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                  </a>
                </li>
                <% } %>
              </ul>
            </nav>
            
        </div>
      </div>
  </div>
 
    
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
            <select id = "formCategory" name="formCategory" onchange="contentChange();">
              <option value = "<%= form.getFcategory() %>" selected><%= form.getFcategory() %></option>
            </select>
          </td> 
          <th>기안자</th>
          <td>
           <%= form.getFwriter() %>
            <input type ="hidden" name = "writerId" value="<%= form.getfWriterId() %>">
          </td>
          <th>기안날짜</th>
          <td><input type = "date" name="formDate" value="<%= form.getFdate() %>" disabled></td>
        </tr>
        <tr>  
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine">
            	<option value="">결재자 선택</option>
            		<option value="<%= form.getFsign() %>" selected>            		
            			<input type ="hidden" name="signCode" value="<%= form.getFsignId() %>">
	            	</option>
            </select>
            <select name = "formLineP">
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine2">
              <option value="1">원장 김원장</option>
              <option value="2">부원장 박부원장</option>
              <option value="3">정교사 강교사</option>
              <option value="4">정교사 이교사</option>
              <option value="5">조리원 오조리원</option>
            </select>
            <select  name = "formLineP">
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine3">
              <option value="1">원장 김원장</option>
              <option value="2">부원장 박부원장</option>
              <option value="3">정교사 강교사</option>
              <option value="4">정교사 이교사</option>
              <option value="5">조리원 오조리원</option>
            </select>
            <select  name = "formLineP">
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
	            <input type="text" name = "formReturn" style = "width: 99%;">
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
   function contentChange(){
    var option = document.getElementById("formCategory");
    var content = document.getElementById("formContent");

    if(option.value == '1') {
        content.value = '';
        content.value += '지출결의서\n\n\n';
        content.value += '내역 :    외 \n\n';
        content.value += '합계 금액 :    원\n\n\n';
        content.value += '위 금액을 청구하오니 결재 바랍니다.\n\n';
        content.value += '** 지출결의서 파일을 첨부해주세요 ';
    }else if(option.value == '2') {
        content.value = '';
        content.value += '휴가신청서\n\n\n';
        content.value += '휴가 기간 :  년  월  일  ~   년  월  일 \n\n';
        content.value += '휴가 사유 :  \n\n\n';
        content.value += '위와 같이 휴가를 신청하오니 결재 바랍니다.\n\n';
        content.value += '** 휴가신청서 파일을 첨부해주세요 ';
    }else if(option.value == '3') {
        content.value = '';
        content.value += '교구신청서\n\n\n';
        content.value += '품목 :    외   개 \n\n';
        content.value += '금액 :    원 \n\n\n';
        content.value += '위와 같이 교재 교구의 구입을 신청하오니 결재 바랍니다.\n\n';
        content.value += '** 교구신청서 파일을 첨부해주세요 ';

    }else if(option.value == '4') {
        content.value = '';
        content.value += '품의서\n\n\n';
        content.value += '내용 :  \n\n\n';
        content.value += '위와 같은 사유로 품의서를 제출하오니 결재 바랍니다.\n\n';
        content.value += '** 품의서 파일을 첨부해주세요 ';
    }
 }


 var i = 0;
 function add(){
    var line2 = document.getElementById('formLine2');
    var line3 = document.getElementById('formLine3');
    
    if(line2.style.display == 'none'){
        line2.style.display = 'block';
        i = 2;
    }else if(line3.style.display == 'none'){
        line3.style.display = 'block';
        i = 3;
    } 
     
 }

 function del(){
     
     $('#formLine'+i).css('display','none');
     i = i-1;
   
 }
 
 $(function(){
		$('#viewTable td').click(function(){
			
			var fno = $(this).parent().find("input").val();
			location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;
		});
	 });
</script>

<%@ include file = "../intranet/common/footer.jsp" %>