<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%@ include file = "intranetFormList.jsp" %>
<%@ page import="java.util.ArrayList, semi.intranet.form.model.vo.Form" %>

<%
	ArrayList<SignList> list = (ArrayList<SignList>)request.getAttribute("sign");

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
      <button type="submit" class = "btn btn-primary btn-sm">등록</button>
      <button type="reset" class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fList.fo'">취소</button>    
              
    </td>
  </tr>
</table>
<div class="card-body">
  <div class="table-responsive">  	
      <table class="table table-bordered" id="dataTable" width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
        <tr>
          <th>품의번호</th>
          <td>
            <input type = "text" style="padding-left: 0.2rem;"name="formNum" value = "자동 입력" disabled>
          </td>
          <th>분류</th>
          <td>
            <select id = "formCategory" name="formCategory" onchange="contentChange();">
              <option value = "">선택</option>
              <option value = "1">지출결의서</option>
              <option value = "2">휴가신청서</option>
              <option value = "3">교구신청서</option>
              <option value = "4">기타</option>
            </select>
          </td> 
          <th>기안자</th>
          <td>
            <input type = "text" name="formName" value = "차은우" disabled>
            <input type ="hidden" name = "writerId" value="2015001">
          </td>
          <th>기안날짜</th>
          <td><input type = "date" name="formDate"></td>
        </tr>
        <tr>  
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine"></select>
            <select name = "formLineP" style="display: none;">
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine2" style="display: none;"></select>
            <select  name = "formLineP" style="display: none;">
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine" id = "formLine3" style="display: none;"></select>
            <select  name = "formLineP" style="display: none;">
              <option value="Y">승인</option>
              <option value="N">반려</option>
            </select> 
          </td>
          <td style="text-align: center;"colspan="2">
            <input type ="button" id="addBnt" class="btn btn-primary btn-sm" onclick= "add();" value="결재자 추가">
            <input type ="button" id="delBnt" class="btn btn-primary btn-sm" onclick= "del();" value="결재자 삭제">
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
            <input type="text" name = "formTitle" style = "width: 99%;">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td colspan="7">
            <textarea id = "formContent" name = "formContent" style="width: 99%;" rows="10"></textarea>
              </td>
            </tr>
            <tr>
              <th>첨부파일</th>
              <td colspan="7">
                <input type = "file" name="formFile">
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
        
        $.ajax({
    		url:"/semi/fSignList.fo",
    		type:"post",
    		success:function(data){
    			console.log(data);
    			
    			var $select = $('#formLine2');
    			
    			$select.find('option').remove();
    			
    			for(var i=0; i<data.length; i++) {
    				var $option = $('<option>');
    				
    				$option.val(data[i].scode);
    				$option.text(data[i].position + data[i].sname);
    				
    				$select.append($option);
    				
    			}
    		}, error:function(){
    			console.log("에러");
    		}
    	});
        
    }else if(line3.style.display == 'none'){
        line3.style.display = 'block';
        i= 3;
        
        $.ajax({
    		url:"/semi/fSignList.fo",
    		type:"post",
    		success:function(data){
    			console.log(data);
    			
    			var $select = $('#formLine3');
    			
    			$select.find('option').remove();
    			
    			for(var i=0; i<data.length; i++) {
    				var $option = $('<option>');
    				
    				$option.val(data[i].scode);
    				$option.text(data[i].position + data[i].sname);
    				
    				$select.append($option);
    			}
    		}, error:function(){
    			console.log("에러");
    		}
    	});
        
    } 
    console.log(option.val());
 }

 function del(){
     
     $('#formLine'+i).css('display','none').val("");
     i = i-1;
   
 }
 

$(function(){
	console.log("기능실행")
	$.ajax({
		url:"/semi/fSignList.fo",
		type:"post",
		success:function(data){
			
			var $select = $('#formLine');
			
			$select.find('option').remove();
			
			for(var i=0; i<data.length; i++) {
				var $option = $('<option>');
				
				$option.val(data[i].scode);
				$option.text(data[i].position + data[i].sname);
				
				$select.append($option);
				
			}
		}, error:function(){
			console.log("에러");
		}
	});
	

// 게시물 이동용 스크립트 
$('#viewTable td').click(function(){
		
		var fno = $(this).parent().find("input").val();
		location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;
	});
});
 
</script>

<%@ include file = "../intranet/common/footer.jsp" %>
