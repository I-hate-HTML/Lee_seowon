
<%@page import="semi.home.gboard.model.vo.Gboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Gboard g = (Gboard)request.getAttribute("Gboard");
    	String[] stArr = (String[])request.getAttribute("Gfile");
    	/* String 배열을 받는 배열 생성  */
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	
	<title>게시글 읽기</title>
    
    <!-- v1.0 -->
	<!-- 개별페이지 CSS -->
	<link href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css" rel="stylesheet">

  
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
	
	<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css" rel="stylesheet">
	

  <style>
      .tatd{
          width: 100px;
      }



  </style>

</head>

<body>

  <!-- 상단 메뉴바 --> 
  
	<%@ include file = "common/nav.jsp" %>

<div class="top_bg">
  <a class="top_p"> 사진게시판 </a>
   <p>팡팡 유치원 사진게시판</p>
 </div>

    <!-- 메인 컨텐츠 구역 -->
  	<div class="container">
    	<div class="row">
      		<div class="col-lg-8 col-md-12 mx-auto">
              
                 <br><br>
                  <table class="table table-bordered" style="background: white;">
                        <tbody>
                                <tr>
                                    <th class="tatd">제목 </th>
                                    <th colspan="3"><%= g.getGtitle() %></th>
                                </tr>
                                <tr>
                                    <th class="tatd">작성자 </th>
                                    <th><%= g.getGwriter() %></th>
                                    <th class="tatd">작성일  </th>
                                    <th><%= g.getGdate() %></th>
                                </tr>
                                <tr>
                                    <th class="tatd">내용 </th>
                                    <td colspan="3">
                                     <div style="height: auto;">
                                      <%if(stArr[0]!="1") {%>
                                      <%for(int i = 0; i<stArr.length;i++){%>
                                    	<img alt="" name="imgtag" src="<%= request.getContextPath()%>/resources/homepage/images/gboardUploadFiles/<%= stArr[i] %>" style="max-height: 500px; max-width: 630px">
                                    		<br>
                                    	<!-- 배열이 비어있을때 nullException이  발생하기 때문에 구분을 위해 넣어준 1 이 아닐때 이미지를 생성시킴-->          
                                       <%} %>
                                       <%} %>
                                        <%= g.getGcontent() %>
                                    </div> 
                                </td>
                                </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="gno" value="<%=g.getGno()%>" >
                <div class="float-right">
                
                
                  <input type="button" class="btn btn-link" style="background: #002c5f; color: white; width: 100px;" onclick="location.href='/semi/deletegboard?gno=<%=g.getGno()%>'" value="삭제" />
                  <input class="btn" style="background: #002c5f; color: white; width: 100px;" type="button" value="수정" 
                  onclick="location.href='/semi/updateviewgboard?gno=<%=g.getGno() %>'" class="pull-right"/>
                  
                  <input class="btn" style="background: #002c5f; color: white; width: 100px;" type="button" value="글목록" onclick="location.href='/semi/gboardlist'" class="pull-right"/>
              
              </div>
      		</div>
    	</div>
  	</div>
<hr>

<!-- 하단 안내 -->

	<%@ include file = "common/footer.jsp" %>
	
	<script>
		$('img[name=imgtag]').click(function(){
			window.open($(this).attr('src'),'파일상세보기','location=no,width=500,height=500');
		});
	</script>

</body>
</html>
