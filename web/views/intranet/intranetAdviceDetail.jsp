<%@page import="semi.intranet.qna.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav.jsp" %>
<% 
	IntranetQna q = (IntranetQna)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷</title>
</head>
<body>
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">상담신청</h1>
          <div class="card shadow mb-4">
            <div class="card-header py-3">
             <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
		          <tr>
		            <td>
		              <h6 class="m-0 font-weight-bold text-primary">상담신청 확인</h6>        		
		            </td>
		            <td align="right" id="btnTable">
		            	<button class = "btn btn-primary btn-sm readBtn" value='Y'>읽음 확인</button>
		              	<button class = "btn btn-primary btn-sm readBtn" value='N'>읽음 취소</button>                                                        
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
                    	<th style="text-align: center;">제목</th>
                    	<td colspan="3"><%= q.getQtitle() %></td>
                    	<th style="text-align: center;">선생님 확인</th>
                    	 <td style="text-align: center;" id="chk">
                        	<input type="hidden" class="tCK" name="ck" value="<%= q.getChk_status() %>">
                        	<%= q.getChk_status() %>
                        </td>
                    </tr>
                      <tr>
                        <th style="text-align: center;">글번호</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="qno" value="<%= q.getQno() %>">
                        	<%= q.getQno() %>
                        </td>
                        <th style="text-align: center;">작성자</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="writerNum" value="<%= q.getQusernum() %>">
                        	<%= q.getQwriter() %>
                        </td>
                        <th style="text-align: center;">작성날짜</th>
                        <td style="text-align: center;"><%= q.getQdate() %></td>
                      </tr>
                      <tr>
                        <th style="text-align: center;">반</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="class" value="<%= q.getQcclass() %>">
                        	<%= q.getqClassName() %>반
                        </td>
                        <th style="text-align: center;">아이 이름</th>
                        <td style="text-align: center;">
                        	<input type="hidden" name="ccode" value="<%= q.getQcnum() %>">
                        	<%= q.getQcname() %>
                        </td>
                        <th style="text-align: center;">상담 날짜</th>
                        <td style="text-align: center;"><%= q.getAsk_date() %></td>
                      </tr>
                      <tr>
                        <th style="text-align: center; height:300px">내용</th>
                        <td colspan="5" style="height:300px">
                        <pre style="height:90%; width:90%"><%= q.getQcontent() %></pre>
                        </td>
                      </tr>
                  </table>

          <a class="btn btn-primary btn-sm pull-right" href="/semi/qList.pna">목록</a>


        
        </div>
          

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
 <script>
 
 $('.readBtn').on("click", function(){
	console.log("버튼 클릭")
	
	if(<%= q.getQcclass() %> == $('#classNum').val() ){
	
	
	var result = $(this).val();
	var qno = '<%= q.getQno() %>';
	var empno = '<%= m.getUserId()%>';
	
	$.ajax({
		url:"/semi/qReadCk.qna",
		type:"post",
		data: {
			'result' : result,
			'qno' : qno,
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
