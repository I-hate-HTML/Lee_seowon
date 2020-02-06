<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
   
<head>
    <meta charset="UTF-8">
    

	<title>사진게시판 테스트</title>
	
	<!-- 개별페이지 CSS -->
	<!-- 이것만 위치 맞춰주면됨 -->
  	<link href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css" rel="stylesheet">

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
     <p>아이들의 행복한 시간</p>
   </div>
   <br>
	<!-- 메인 컨텐츠 구역 -->      
    <div class="container"  >
       
       <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-10 mx-auto">
                    
        <div class="row" style="text-align-last: center;">
            <!-- Portfolio Item 1 -->
            <div class="col-md-6 col-lg-4" >
                  <div id="right_issuezoom" class="content_box r_issuezoom">
                    <div class="rcont_issue">
                    <a  href="#">
                    <span class="img_box">
                      <img src="./img/1.jpg" alt="" width="100%">    
                    </span>    
                      <div class="txt_box" style="font-size: 17px;"> 
                     <strong>크리스마스의 어린이들</strong> 
                  </div> 
                  <span class="issue_inner">
                  </span>     
                </a>
               </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4" >
                  <div id="right_issuezoom" class="content_box r_issuezoom">
                    <div class="rcont_issue">
                    <a  href="#">
                    <span class="img_box">
                      <img src="./img/2.jpg" alt="" width="100%">    
                    </span>    
                      <div class="txt_box" style="font-size: 20px; align-items: center;"> 
                     <strong>본좌에게 밥을 달라</strong> 
                  </div> 
                  <span class="issue_inner">
                  </span>     
                </a>
               </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4" >
                  <div id="right_issuezoom" class="content_box r_issuezoom">
                    <div class="rcont_issue">
                    <a  href="#">
                    <span class="img_box">
                      <img src="./img/3.jpg" alt="" width="100%">    
                    </span>    
                      <div class="txt_box" style="font-size: 17px; text-align: center; " > 
                     본좌는 잠이 필요하다
                  </div> 
                  <span class="issue_inner">
                  </span>     
                </a>
               </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4" >
                  <div id="right_issuezoom" class="content_box r_issuezoom">
                    <div class="rcont_issue">
                    <a  href="#">
                    <span class="img_box">
                      <img src="./img/4.jpg" alt="" width="100%">    
                    </span>    
                      <div class="txt_box " style="font-size: 20px;"> 
                     본좌에게 제물을 바쳐라
                  </div> 
                  <span class="issue_inner">
                  </span>     
                </a>
               </div>
                </div>
            </div>

    
            <!-- Portfolio Item 2 -->
            <div class="col-md-6 col-lg-4">
          
                    <img class="img-fluid" src="./img/a2.png" alt="" style="margin-bottom: 30px;">
                    <br>
                    <b>식단표</b>
                    <p style="margin: 20px; font-size: 13px;">영양과 맛을 <br>고루 갖춘 영양식단</p>
            </div>
    
            <!-- Portfolio Item 3 -->
            <div class="col-md-6 col-lg-4">
      
                    <img class="img-fluid" src="./img/a3.png" alt="" style="margin-bottom: 30px;">
                    <br>
                    <b>버스시간표</b>
                    <p style="margin: 20px; font-size: 13px;">팡팡버스를 <br>타야하는 시간</p>
            </div>
            
            
  
    </div>


            </div>
         </div>
       </div>
       
     
           <br>
           <div align="center">   
          
                  <div class="text-center d-flex justify-content-center">
                    <ul class="pagination">
				          		<li class="page-item"><a class="page-link" href="#" >Previous</a></li>
				          		<li class="page-item"><a class="page-link" href="#">1</a></li>
				          		<li class="page-item"><a class="page-link" href="#">2</a></li>
				          		<li class="page-item"><a class="page-link" href="#">3</a></li>
				          		<li class="page-item"><a class="page-link" href="#">4</a></li>
				          		<li class="page-item"><a class="page-link" href="#">5</a></li>
				          		<li class="page-item"><a class="page-link" href="#">Next</a></li>
				          	</ul>
                </div>
              </div>
            </div>
          </div>
          <hr>



	<!-- 하단 안내 -->
  	<!-- footer -->
	<%@ include file="common/footer.jsp" %>
</body>
</html>    