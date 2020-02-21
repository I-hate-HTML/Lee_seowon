<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav.jsp" %>
<%@ page import="semi.intranet.form.model.vo.Form" %>

<%
	Form form = (Form)request.getAttribute("form");
%>


<!-- Begin Page Content -->
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">품의서</h1>
    <div class="card shadow mb-4">
      <div class="card-header py-3">
      <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
          <tr>
            <td>
        		<h6 class="m-0 font-weight-bold text-primary">품의결재창</h6>
            </td>
            <td align="right">
              <button class = "btn btn-primary btn-sm delete">삭제</button>
            </td>
          </tr>
        </table>
      </div>
	<div class="card-body">
	  <div class="table-responsive">  
	  
	  <table style="font-size: .9rem;" class="table table-bordered" id="signTable" width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
	  </table>
      <table style="font-size: .9rem;" class="table table-bordered" id="dataTable" width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
        <tr>
          <th style="text-align: center;">품의번호</th>
          <td style="text-align: center;">
            <input type = "hidden" name="formNum" value = "<%= form.getFno() %>" >
            <%= form.getFno() %>
          </td>
          <th style="text-align: center;">분류</th>
          <td style="text-align: center;">
            <select style = "width:100%" id = "formCategory" name="formCategory" onchange="contentChange();" disabled>
              <option value = "<%= form.getFcategory() %>" selected><%= form.getCategory() %></option>
            </select>
          </td> 
          </tr>
          <tr>
          <th style="text-align: center;">기안자</th>
          <td style="text-align: center;">
           <%= form.getFwriter() %>
            <input type ="hidden" name = "writerId" value="<%= form.getfWriterId() %> disabled">
          </td>
          <th style="text-align: center;">기안날짜</th>
          <td style="text-align: center;"><%= form.getFdate() %></td>
        </tr>
	        <tr>
	          <th style="text-align: center;">제목</th>
	          <td colspan="3" >
	            <%= form.getFtitle() %>
	          </td>
	        </tr>
	        <tr>
	          <th style="text-align: center;" >내용</th>
	          <td colspan="3" style="height:300px" >
	           <pre style="height:90%; width:90%"><%= form.getFcontent() %></pre> 
	          </td>
	        </tr>
            <tr>
              <th style="text-align: center;">첨부파일</th>
              <td colspan="3">
                <%= form.getFfile() %>
              </td>
            </tr>                
          </table>
          <a class="btn btn-secondary btn-sm pull-right" href="<%= request.getContextPath() %>/fList.fo">목록</a>
      </div>
  </div>          
</div>
</div>
  <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>


$(function(){
	
	var signNo = '<%= form.getfSignList() %>'
	var signYn = '<%= form.getfSignckList() %>'
	var signMsg = '<%= form.getFreturnmsg() %>'
	
	console.log(signNo);
	
	$.ajax({
		url:"/semi/fSignSelect.fo",
		type:"post",
		data:{"sign" : signNo,
			  "yn" : signYn,
			  "msg" : signMsg
		}, 
		success:function(data){
			console.log(data);
			
			$.each(data, function(index, value){
				
				for(var i in index) {
					
					var name = data.signList[i].sname;
					var position = data.signList[i].position;
					var empNo = data.signList[i].scode;
					var yn = data.signList[i].syn;
					var msg = data.signList[i].smsg;
					
					if(yn == null || yn == 'null') {
						yn = "결재전";
					} else if (yn != null && yn == 'Y') {
						yn = "승인"
					} else if(yn != null && yn == 'N') {
						yn = "반려"
					}
					
					if(msg == null || msg == "null") {
						msg = "결재 전 입니다.";
					}
					
				
					var $tr1 = $('<tr>');
					var $tr2 = $('<tr>');
					
				    var $th1 = $('<th>').css('text-align','center').attr('rowspan','2').text('결재자');
					var $td1 = $('<td>').css('text-align','center');
					var $select1 = $('<select>').css({
													 'width':'100%',
													 'disabled' : 'true'
													 }).attr({'name':'formLine',
														      'id':'formLine'+i,
														      'disabled' : true
													         });
					var $option1 = $('<option>').val(empNo).text(empNo + ' ' + position + ' ' + name); 
					var $input1 = $('<input>').attr({
													'type':'hidden',
													'name':'signCode',
													}).val(empNo);
					
					
					var $th2 = $('<th>').css('text-align','center').text('상태');
					var $td2 = $('<td>').css('text-align','center');
					var $select2 = $('<select>').css({
													 'width':'100%',
													 'disabled' : 'true'
													 }).attr({'name':'formLineP',
														      'id':'formLineP'+i,
														      'disabled' : true
													         });
					var $option2 = $('<option>').val(yn).text(yn); 
					
					
					var $td3 = $('<td>').attr('colspan','3'); 
					var $input3 = $('<input>').attr({
													'type':'text',
													'placeholder':'품의 괸련 의견을 적어주세요',
													'disabled' : true
													}).css('width','100%').val(msg);
					
					$tr1.append($th1).append($td1.append($select1.append($option1.append($input1))));
					$tr1.append($th2).append($td2.append($select2.append($option2)));
					$tr2.append($td3.append($input3));
					
					$('#signTable').append($tr1);
					$('#signTable').append($tr2);
					
					
				}
				
			});
			
			
		}, error:function(data){
			console.log("에러");
		}
	});
	
});


// 삭제버튼
$(".delete").click(function(){
	
	if($('#formLineP1').val() != "결재전") {
		alert("이미 품의가 진행중입니다.");
		
	} else {
		var fno = "<%= form.getFno() %>";
		var eno = "<%= m.getUserId() %>";
	 location.href="<%= request.getContextPath()%>/fDelete.fo?fno=" + fno;
	}
	
});

//게시물 이동용 스크립트 
$('#viewTable td').click(function(){
		
	var fno = $(this).parent().find("input").val();
	location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;

});


/* $(function(){
	
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

}); */






</script>


<%@ include file = "../intranet/common/footer.jsp" %>

