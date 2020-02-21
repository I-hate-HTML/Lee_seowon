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
              <button class = "btn btn-primary btn-sm signCall" >결재하기</button>
              <button class = "btn btn-primary btn-sm signSave" style="display:none">결재완료</button>
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


// 데이터 가져오는 용
$(function(){
	var emp = '<%= m.getUserId() %>';
	
	var signNo = '<%= form.getfSignList() %>'
	var signYn = '<%= form.getfSignckList() %>'
	var signMsg = '<%= form.getFreturnmsg() %>'
	
	
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
					
					var ynList="";
					
					if(yn == null || yn == 'null') {
						yn = "선택";
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
					
					
					// 활성화창
					var $optionA = $('<option>').text("선택");
					var $optionB = $('<option>').val("Y").text("승인");
					var $optionC = $('<option>').val("N").text("반려");
					
					
					
					var $td3 = $('<td>').attr('colspan','3'); 
					var $input3 = $('<input>').attr({
													'type':'text',
													'disabled' : true,
													'name':'return',
													'id':'fReturn' + i
													}).css('width','100%').val(msg);
					
					$tr1.append($th1).append($td1.append($select1.append($option1.append($input1))));
					$tr1.append($th2).append($td2.append($select2.append($option2)));
					$tr2.append($td3.append($input3));
					
					$('#signTable').append($tr1);
					$('#signTable').append($tr2); 
					
					
					// 결재자이고 결재전이면 자기 결재창 활성화 
					 /* if(emp == empNo && yn == "결재전" && msg == "결재 전 입니다.") {
					
						$select2.attr('disabled' , false);
						$input3.attr({'disabled':false,'placeholder':'품의 관련 의견을 적어주세요'}).val(null);
						
						$tr1.append($th1).append($td1.append($select1.append($option1.append($input1))));
						$tr1.append($th2).append($td2.append($select2.append($optionA).append($optionB).append($optionC)));
						$tr2.append($td3.append($input3));
						
						$('#signTable').append($tr1);
						$('#signTable').append($tr2);
						 
					} else if(emp != empNo || emp == empNo && yn != "결재 전 입니다"  && msg != "결재전" ){
						$tr1.append($th1).append($td1.append($select1.append($option1.append($input1))));
						$tr1.append($th2).append($td2.append($select2.append($option2)));
						$tr2.append($td3.append($input3));
						
						$('#signTable').append($tr1);
						$('#signTable').append($tr2);
					 }  */
				}
			});
		}, error:function(data){
			console.log("에러");
		}
	});
	
});


// 결제하기 버튼
$(".signCall").click(function(){
	
	
	
	var emp = '<%= m.getUserId() %>';
	
	var signNo = '<%= form.getfSignList() %>'
	var signYn = '<%= form.getfSignckList() %>'
	var signMsg = '<%= form.getFreturnmsg() %>'
	
	var $optionB = $('<option>').val("Y").text("승인");
	var $optionC = $('<option>').val("N").text("반려");
	
	
	var noArr = signNo.split(',');
	var ynArr = signYn.split(',');
	var msgArr = signMsg.split(',');
	
	var location = 0;
	var length = noArr.length-1;
	var a = "";
	
	for(var i = 0; i < noArr.length-1; i++) {
		if(emp == noArr[i]){
			location = i;
		}
	}
	
	if(location == 0) {
		a = 0;
	}else if(location >0){
		a = location;
	}
	
	
	// 내 결재이고 앞 결재가 없거나 앞 결재가 되어있으면 활성화
	if(emp == noArr[location] && location == 0 && ynArr == "null") { // 내가 맨 앞아고 아직 결재 안했으면 활성화
		console.log("활성화");
		$('#formLineP'+ a).append($optionB).append($optionC).attr('disabled' , false);
		$('#fReturn' + a).attr({'disabled':false,'placeholder':'품의 관련 의견을 적어주세요'}).val(null);
	} else if (emp == noArr[location] && location != 0) { // 맨 앞 아닐때 
		if(ynArr[location-1] == "Y") { // 앞에 결재자가 승인했으면 활성화
			console.log("활성화");
			$('#formLineP'+ a).append($optionB).append($optionC).attr('disabled' , false);
			$('#fReturn' + a).attr({'disabled':false,'placeholder':'품의 관련 의견을 적어주세요'}).val(null);
		} else {
			alert("결재 순서가 아닙니다.");
		}
	} else {
		alert("이미 결재 처리가 되었습니다.");
	}
	
	$(this).css("display","none");
	$('.signSave').css("display","block");
	
});



// 결재완료버튼
$(".signSave").click(function(){
	
	
	var aa="";
	var bb="";
	var fno = '<%= form.getFno() %>';
	var result = "";
	
	if($('input[name="signCode"]').val() == <%= m.getUserId()%>){
		
		aa =$('input[name="signCode"]').parent().parent().parent().parent().children().eq(3).children().val();

	    bb = $('input[name="return"]').val();
	}
	
	
	var signNo = '<%= form.getfSignList() %>'
	var signYn = '<%= form.getfSignckList() %>'
	
	var noArr = signNo.split(',');
	var ynArr = signYn.split(',');
	
	var length = noArr.length-1;
	
	if(length == 1 && ynArr.length == length && aa == "Y") {
		result = "승인";
	} else if (aa == "N") {
		result = "반려";
	} else {
		result = "검토";
	}
	
	
	 $.ajax({
		url:"/semi/fSignSave.fo",
		type:"post",
		data:{"yn":aa,
			  "reason":bb,
			  "fno":fno,
			  "result":result
		},
		success:function(data){
			
			if(data == 1) {
				alert("결재 내용이 저장되었습니다.");
			}
			
			if(aa != null && bb != null) {
				$('input[name="signCode"]').parent().parent().parent().parent().children().eq(3).attr("disable",true);
				$('input[name="return"]').attr("disable",true);
			}
			
			location.reload();
			
		}, error:function(data){
			console.log("에러");
		}
	}); 
	 
	 $(this).css("display","none");
	 $('.signCall').css("display","block");
	
});

//게시물 이동용 스크립트 
$('#viewTable td').click(function(){
		
	var fno = $(this).parent().find("input").val();
	location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;

});


</script>


<%@ include file = "../intranet/common/footer.jsp" %>

