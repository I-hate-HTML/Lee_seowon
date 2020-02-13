<%@page import="semi.home.qna.model.vo.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	
	<title>홈페이지 기본 뼈대</title>
	
	<!-- 개별페이지 CSS -->
	<!-- 이것만 위치 맞춰주면됨 -->
	
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
	<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css"rel="stylesheet">

	



  <style>
      .tatd{
          width: 100px;
      }



  </style>

</head>

<body>

	<!-- 상단 메뉴바 -->
	
	<%@ include file = "common/nav.jsp" %>

    <!-- 메인 컨텐츠 구역 -->
    <div class="top_bg">
      <a class="top_p"> 문의사항 </a>
       <p>궁금한점을 질문해 주세요</p>
       
     </div>

  	<div class="container">
    	<div class="row">
      		<div class="col-lg-8 col-md-10 mx-auto">
                  <hr >
                     <h1 class="d-flex justify-content-center" >내 문의 현황</h1>
                  <hr>
				  <table class="table table-hover" style="border-bottom: 1px solid  #dee2e6; background: white;">
                      <thead>
                          <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>작성자</th>
                              <th>날짜</th>
                              <th>문의확인</th>
                          </tr>
                      </thead>
                      <tbody>
                      <% for(QnA q : list) { %>
                          <tr>
                              <td><%= q.getQno() %></td>
                              <td><%= q.getQtitle() %></td>
                              <td><%= q.getQwriter() %></td>
                              <td><%= q.getQdate() %></td>
                              <td>
                              <%
                              String chksymbol = "";
                              if(q.getChk_status().equals("N")) {
                            	  chksymbol = "O";
                              }else{
                            	  chksymbol = "X";
                              }
                              %>
                              
                              
                              
                              <%= chksymbol %>
                              </td>
                          </tr>
                          <% } %>
                      </tbody>
                  </table>
               
                  <br><br>
                  <hr>
                  <h1 class="d-flex justify-content-center">문의 작성</h1>
                  <hr>
                  <form action="<%= request.getContextPath() %>/qInsert.qna" method="post"">
                  <table class="table table-bordered" style="background: white;">
                        <tbody>
                                <tr>
                                    <th class="tatd">제목: </th>
                                    <td><input type="text" placeholder="제목을 입력하세요. " name="qtitle" class="form-control"/></td>
                                </tr>
                                <tr>
                                    <th class="tatd">내용: </th>
                                    <td><textarea cols="10" rows="10" placeholder="내용을 입력하세요. " name="qcontent" class="form-control "  style="resize : none;"></textarea></td>
                                </tr>
                                <tr>
                                  <th class="tatd">상담날짜</th>
                                  <td><input type="date" name="ask_date" class="form-control"/> 
                                  </td>
                              </tr>
                                <!-- <tr>
                                    <th class="tatd" class="form-control">첨부파일: </th>
                                    <td>
                                        <span><input type="file"></span>
                                    </td>
                                </tr> -->
                             
                        </tbody>
                    </table>
                    <div class="float-right">
                            <input class="btn btn-link" style="background: #002c5f; color: white;" type="submit" value="문의 등록" class="pull-right"/>
                    </div>
                  </form>
      		</div>
    	</div>
  	</div>
<hr>

<!-- 하단 안내 -->

	<%@ include file = "common/footer.jsp" %>

</body>
</html>
