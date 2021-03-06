<%@page import="semi.home.board.model.vo.PageInfo"%>
<%@page import="semi.home.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    
    <%
    ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
    
    PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	String nowschval = (String)request.getAttribute("nowschcal");
	String nowkeyword = (String)request.getAttribute("nowkeyword");
    
    %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	
    
    <!-- V1.0 -->

	<title>게시판</title>
  
  
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
  
  
	<!-- 개별페이지 CSS -->
	<!-- 이것만 위치 맞춰주면됨 -->
<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css"
	rel="stylesheet">


  <style>
    .page-link{
      background: #002c5f; color: white;
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
    <br><br>
  	<div class="container">
    	<div class="row">
      		<div class="col-lg-8 col-md-10 mx-auto">
				  <table id="boardtable" class="table table-hover" style="background: white;">
                      <thead>
                          <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>작성자</th>
                              <th>날짜</th>
                              <th>조회수</th>
                          </tr>
                      </thead>
                      <tbody>
                      <% for (Board b : list){ %>
                          <tr>
                              <td><%= b.getBno()%></td>
                              <td><%= b.getBtitle() %></td>
                              <td><%= b.getBwriter() %></td>
                              <td><%= b.getBdate() %></td>
                              <td><%= b.getBcount() %></td>
                          </tr>
                          <% } %>
                      </tbody>
                  </table>
                  <hr><br>
					<div class="text-center d-flex justify-content-center">
					    <select class="form-control" style="width: 100px; margin-right: 10px" id="searchval">
							<option value="">---</option>
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					<input type="text" class="form-control" style="margin-right: 30px; width:60%" id="keyword">
					<input type="button" class="btn" style="background: #002c5f; color: white; width: 100px;" onclick="searchboard()" value="검색">
					</div>	
					<br>
                  <% if(m.getJob_code()!=6){ %>
                  <button class="btn float-right" style="background: #002c5f; color: white; width: 100px;" onclick="location='views/homepage/boardwrite.jsp'">글작성</button>
                  <% } %>
                  
                  <div class="text-center d-flex justify-content-center">
                    <ul class="pagination">
                    <% if(currentPage <=1){ %>
                    	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/searchboard.bo?currentPage=1&nowschval=<%=nowschval %>&nowkeyword=<%=nowkeyword%>" >Previous</a></li>                	
                    <%}else{ %>
                    	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/searchboard.bo?currentPage=<%=currentPage - 1 %>&nowschval=<%=nowschval %>&nowkeyword=<%=nowkeyword%>" >Previous</a></li>
                    <%} %>
                    
                    <% for(int p = startPage; p <= endPage; p++){
    						if(p == currentPage){	 %>
    					<li class="page-item"><a class="page-link" style="background: white; color: black;" href="<%= request.getContextPath() %>/searchboard.bo?currentPage=<%=p%>&nowschval=<%=nowschval %>&nowkeyword=<%=nowkeyword%>" ><%=p %></a></li>
    				<%		}else{ %>
						<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/searchboard.bo?currentPage=<%=p %>&nowschval=<%=nowschval %>&nowkeyword=<%=nowkeyword%>"><%=p %></a></li>
					<%	    } %>
					<%	 } %>
					
					<% if(currentPage >= maxPage){ %>
						<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/searchboard.bo?currentPage=<%= maxPage %>&nowschval=<%=nowschval %>&nowkeyword=<%=nowkeyword%>">Next</a></li>
					<% 		}else{ %>
						<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/searchboard.bo?currentPage=<%= currentPage + 1 %>&nowschval=<%=nowschval %>&nowkeyword=<%=nowkeyword%>">Next</a></li>
					<% } %>					
					</ul>
                  </div>
                  	
			</div>
    	</div>
  	</div>
<hr>

<!-- 하단 안내 -->

	<%@ include file = "common/footer.jsp" %>

    <script>
    
    $("#keyword").keydown(function(e) {
        if(e.keyCode==13){
        	searchboard();
        }
    });
    
    $(function(){
    	  $('#boardtable td').click(function(){
        	  var bno = $(this).parent().children().eq(0).text();
    			location.href="<%=request.getContextPath()%>/selectOne.bo?bno=" + bno;	
          });
    });
    
    function searchboard(){
    	location.href="<%=request.getContextPath()%>/searchboard.bo?searchval="+$('#searchval').val()+"&keyword="+$('#keyword').val();
    }
    
    </script>
		
</body>

</html>
