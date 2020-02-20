<%@page import="semi.home.gboard.model.vo.PageInfo"%>
<%@page import="semi.home.gboard.model.vo.Gboard"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<Gboard> list = (ArrayList<Gboard>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
%>

<!DOCTYPE html>
<html lang="ko">
   
<head>
    <meta charset="UTF-8">
    

	<title>사진게시판 테스트</title>
	
	<!-- 개별페이지 CSS -->
	<!-- 이것만 위치 맞춰주면됨 -->
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
  <link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css"
	rel="stylesheet">
  

  <style>
      .card{
          margin-bottom: 5px;
      }

      .card-img{
          height: 200px;
      }
      .page-link{
      background: #002c5f; color: white;
    }
    
    .rcont_issue{margin-top:12px}
    .rcont_issue a{display:block;position:relative}
    .rcont_issue .txt_box{position:absolute;left:10%;bottom:0;height:50px;margin-top:0;padding:0 11px;color:#fff;z-index:2}
    .rcont_issue .txt_box strong{width:100%}
    .issue_inner{display:block;position:absolute;left:1px;bottom:0;width:100%;height:70px;background:#000;filter:alpha(opacity=50);opacity:0.5;z-index:1}
    .content_box.r_issuezoom{padding:0 13px 14px}


  </style>

</head>

<body>

  <!-- 상단 메뉴바 -->
  <!-- navi -->
  <%@ include file="common/nav.jsp" %>


  <div class="top_bg">
    <a class="top_p"> 사진게시판 </a>
     <p>팡팡 유치원 사진게시판</p>
   </div>
   <br>
	<!-- 메인 컨텐츠 구역 -->      
    <div class="container"  >
       
       <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-10 mx-auto">
                    
        <div class="row" style="text-align-last: center;">
            <!-- Portfolio Item 1 -->
            
            

             <%-- <% for(Gboard s : list) { %>
            <div class="col-md-6 col-lg-4" >
				<div class="gboard-list" align="center">
					<div>
						<img src="<%=request.getContextPath()%>/resources/homepage/images/gboardUploadFiles/<%= s.getGfile() %>" 
						     width="300px" height="350px">
						<input type="hidden" value="<%= s.getGno() %>">
						     
					</div>
					
					<p>No. <%=s.getGno() + " " + s.getGtitle() %><br>
					조회수	: <%= s.getGcount() %>
					</p>
				</div>
			</div>
			<% } %> --%>
			
			<% for(Gboard s : list) { %>
            <div class="col-md-6 col-lg-4" >
				<div class="gboard-list" align="center">
					<div>
						<img src="<%=request.getContextPath()%>/resources/homepage/images/gboardUploadFiles/<%= s.getGfile() %>" 
						     width="300px" height="350px" style="cursor: pointer;">
						<input type="hidden" value="<%= s.getGno() %>">
						     
					</div>
					
					<p>No. <%=s.getGno() + " " + s.getGtitle() %><br>
					조회수	: <%= s.getGcount() %>
					</p>
				</div>
			</div>
			<% } %>
			
			
              
            </div>

			<script>
				$(function(){
					$('.gboard-list').click(function(){
							var gno = $(this).children().children().eq(1).val();
							console.log(gno);
							location.href = "<%=request.getContextPath()%>/gboardselectone.go?gno=" + gno;
					});
				});
			</script>
    
           
           
    		</div>

            </div>
         </div>
           <br>
         <% if(true){ %>
                  <button class="btn float-right" style="background: #002c5f; color: white; width: 100px;" onclick="location='views/homepage/gallary_write.jsp'">글작성</button>
                  <% } %>
                  
                  <div class="text-center d-flex justify-content-center">
                    <ul class="pagination">
                    <% if(currentPage <=1){ %>
                    	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/gboardlist?currentPage=1" >Previous</a></li>                	
                    <%}else{ %>
                    	<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/gboardlist?currentPage=<%=currentPage - 1 %>" >Previous</a></li>
                    <%} %>
                    
                    <% for(int p = startPage; p <= endPage; p++){
    						if(p == currentPage){	 %>
    					<li class="page-item"><a class="page-link" style="background: white; color: black;" href="<%= request.getContextPath() %>/gboardlist?currentPage=<%=p%>" ><%=p %></a></li>
    				<%		}else{ %>
						<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/gboardlist?currentPage=<%=p %>"><%=p %></a></li>
					<%	    } %>
					<%	 } %>
					
					<% if(currentPage >= maxPage){ %>
						<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/gboardlist?currentPage=<%= maxPage %>">Next</a></li>
					<% 		}else{ %>
						<li class="page-item"><a class="page-link" href="<%= request.getContextPath() %>/gboardlist?currentPage=<%= currentPage + 1 %>">Next</a></li>
					<% } %>					
					</ul>
                  </div>
              </div>
            </div>
          <hr>


	<!-- 하단 안내 -->
  	<!-- footer -->
	<%@ include file="common/footer.jsp" %>
</body>
</html>    