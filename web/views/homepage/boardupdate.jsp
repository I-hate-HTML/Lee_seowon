<%@page import="semi.home.board.model.vo.Board"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Board b = (Board)request.getAttribute("board");
     String[] nameArr = (String[])request.getAttribute("bfile");
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>게시글 쓰기</title>
	
<link
	href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css"
	rel="stylesheet">
  
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<!-- 아이콘 레퍼런스 사이트 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

	
	<!-- 이것만 위치 맞춰주면됨 -->
<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css"
	rel="stylesheet">




  <style>
    th{
      width: 100px;
    }
  

  </style>

</head>

<body>

	<!-- 상단 메뉴바 -->
	
	<%@ include file = "common/nav.jsp" %>

<div class="top_bg">
  <a class="top_p"> 공지사항 </a>
   <p>팡팡 유치원 공지사항</p>
 </div>


  <!-- 메인 컨텐츠 구역 -->
  	<div class="container" >
    	<div class="row">
      		<div class="col-lg-8 col-md-12 mx-auto">
            <br><br>
            <form action="<%= request.getContextPath() %>/bupdate.bo" method="post" enctype="multipart/form-data">
              <table class="table table-bordered" style="background: white;">
                  <tbody>
                          <tr>
                              <th>제목: </th>
                              <td colspan="2"><input type="text" placeholder="제목을 입력하세요. " name="btitle" class="form-control" value="<%= b.getBtitle() %>" readonly="readonly"/></td>
                          </tr>
                          <tr>
                              <th>내용: </th>
                              <td colspan="2">
                              <textarea cols="10" placeholder="내용을 입력하세요. " id="bcontent" name="bcontent" class="form-control" style="height: 500px; resize: none;" ><%= b.getBcontent() %></textarea>
<%--                               <div contentEditable="true" class="form-control" style="height:auto;">
                              <% if(nameArr[0]!="1"){ %>
                                    		<% for(int i=0; i<nameArr.length ;i++){ %>
                                			<img alt="" src="<%= request.getContextPath()%>/resources/homepage/images/boardUploadFIles/<%= nameArr[i] %>" style="max-height: 500px; max-width: auto">
                                    		<br>
                                    		<%} %>
                                    	<%} %> <%=b.getBcontent() %>
								</div> --%>
                              </td>
                          </tr>
                          <tr>
                              <th>현재파일: </th>
                              <td>
                              <%if(nameArr[0]!="1"){ %>
                                    		<% for(int i=0; i<nameArr.length ;i++){ %>
                                    		<input type="text" value="<%= nameArr[i] %>" readonly="readonly" id="img<%=i+1%>">
                                			<input type="button" class="btn btn-primary" value="삭제" id="test<%=i+1%>">
                                    		<br>
                                    <%} %>
                                  <%} %>
                              </td>
                              <td>
                              	<img src="" alt="" style="max-width: 258px" id="previewimg">
                              </td>
                          </tr>
                          <tr>
                              <th>첨부파일: </th>
                              <td colspan="2">
                              <span><input type="file" name="bfile" multiple></span>
                              </td>
                          </tr>
							
                        </tbody>
                      </table>
                      <input type="hidden" id="pbno" name="pbno" value="<%= b.getBno() %>">
                      <input type="hidden" id="orifile" name="orifile">
                      <div class="float-right">
                        <input type="submit" class="btn btn-link" style="background: #002c5f; color: white; width: 100px;" value="등록" onclick="submit1()" class="pull-right"/>
                        <input type="button" class="btn btn-link" style="background: #002c5f; color: white; width: 100px;" value="삭제" onclick="location.href='/semi/deleteboard.bo?pbno=<%=b.getBno()%>'" class="pull-right"/>
                        <input type="button" class="btn btn-link" style="background: #002c5f; color: white; width: 100px;" onclick="location.href='/semi/boardlsit.do'" value="취소" />
                      </div>
             <</form>
      		</div>
    	</div>
  	</div>


<!-- 하단 안내 -->

	<%@ include file = "common/footer.jsp" %>
	
	<script>
	
	$(function(){
		 <%if(nameArr[0]!="1"){ %>
			<% for(int i=0; i<nameArr.length ;i++){ %>
				$('#img<%=i+1%>').attr('chk',0);
			<%} %>
		<%} %>
	});
	 
	
	var filearr=[];
	var bfile;
	
	function submit1(){
		$('input[chk=0]').each(function(index,item){
			filearr.push($(this).val());
		});
		bfile = filearr.join(',');
		$('#orifile').val(bfile);
	};
	
	 
	<%if(nameArr[0]!="1"){ %>
		<% for(int i=0; i<nameArr.length ;i++){ %>
		 $('#test<%=i+1%>').click(function(){
			 		var check = confirm("정말 이미지를 삭제하시겠습니까?");
			 		if(check ==true){
						$('#img<%=i+1%>').css('color','red');
						$('#img<%=i+1%>').attr('chk',1);
						$(this).attr('hidden','true');
						console.log($('#img<%=i+1%>').attr('chk'));
			 		}
		  });
		 
		 $('#img<%=i+1%>').click(function(){
			 console.log($(this).val());
			 $('#previewimg').attr('src','/semi/resources/homepage/images/boardUploadFIles/'+$(this).val());
		 });
		 
		<%} %>
	<%} %>
	
	
	

	</script>

</body>
</html>
