
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>팡팡어린이집</title>


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
  	<link href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css" rel="stylesheet">

 
  <style>
 
 
    </style>

	 <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>

<body>

  <!-- Navigation -->
  
  <%@ include file="common/nav.jsp" %>


  <!-- Page Header -->
  
  <div class="masthead" style="height:700px">
    
  <div class="container">
    <div class="overlay">
      <div class="row">
        <div class="col-lg-12 col-md-10 mx-auto">
          <div class="site-heading" style="color: #2c2c2c;text-align-last: center; margin-top: 200px;">
            <h2 style="color: #2c2c2c; font-size: 28px; margin-bottom: 10px;letter-spacing: -1px;">모두가 꿈꾸는 어린이 집</h2>
            <strong style="font-size: 38px;font-weight: 300;letter-spacing: -1px;color:#2c2c2c; font-weight: 900;">편안한 분위기, "함께 만들어가는 푸른 세상"</strong>
            <p style="margin-top: 30px; color:#2c2c2c; font-size: 17px;">잘 생각하는, 잘 말하는, 잘노는</p><p style="font-size: 17px;color:#2c2c2c;">그래서 행복한 유치원</p>
            <p style="font-size:22px;color:#2c2c2c;margin-top: 50px;font-weight: 600;letter-spacing: 5px;">팡팡어린이집</p>
          </div>
        </div>
      </div>
    </div>
 </div>
</div>
  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-10 mx-auto">
        
        <h1 style=" font-size: 25px; text-align: center;color: #000; font-family: Montserrat; height: 50px">
          <b style="font-weight: 500; letter-spacing: 5px;">NOTICE</b> 
        </h1>
        <p style="text-align: center; margin-bottom: 45px;">꿈과 희망이 가득한 팡팡 어린이집</p>
      
        <div class="row" style="text-align-last: center;">
        
         

            <!-- Portfolio Item 1 -->
            <div class="col-md-6 col-lg-4" >
  					<a href="/semi/boardlsit.do">
                    <img class="img-fluid" src="<%=request.getContextPath()%>/resources/homepage/images/a1.png" alt="" style="margin-bottom: 30px; cursor: pointer;">
  					</a>
                    <br>
                    <b>공지사항</b>
                    <p style="margin: 20px; font-size: 13px;">팡팡 가족이<br> 알아야할 공지사항</p>
            </div>
    
            <!-- Portfolio Item 2 -->
            <div class="col-md-6 col-lg-4">
          			<a href="<%=request.getContextPath()%>/views/homepage/food_calender.jsp">
                    <img class="img-fluid" src="<%=request.getContextPath()%>/resources/homepage/images/a2.png" alt="" style="margin-bottom: 30px;cursor: pointer;">
          			</a>
                    <br>
                    <b>식단표</b>
                    <p style="margin: 20px; font-size: 13px;">영양과 맛을 <br>고루 갖춘 영양식단</p>
            </div>
    
            <!-- Portfolio Item 3 -->
            <div class="col-md-6 col-lg-4">
      				<a href="/semi/selectOne.bo?bno=1">
                    <img class="img-fluid" src="<%=request.getContextPath()%>/resources/homepage/images/a3.png" alt="" style="margin-bottom: 30px;cursor: pointer;">
      				</a>
                    <br>
                    <b>버스시간표</b>
                    <p style="margin: 20px; font-size: 13px;">팡팡버스를 <br>타야하는 시간</p>
            </div>
    
      </div>

      <hr>

       <div class="btm_h1" style="margin-top: 60px;">
      <h1 style=" font-size: 25px; text-align: center;color: #000; font-family: Montserrat; height: 50px">
        <b style="font-weight: 500; letter-spacing: 5px;">PHOTO</b> 
      </h1>
      <p style="text-align: center; margin-bottom: 45px;">우리들의 행복한 시간</p>
      </div>
      <div class="row" style="text-align-last: center;" id="imgdiv">
      
        <%-- <!-- Portfolio Item 1 -->
         <div class="col-md-6 col-lg-4"  >
          <a target="_blank" href="fjords.jpg" style="margin-bottom: 30px;">
            <img src="<%=request.getContextPath()%>/resources/homepage/images/1.jpg" alt="Fjords" width="100%" height="300" style="margin-bottom: 30px;">
            </a>
              <b style="">씨앗반</b>
                <p style="margin: 20px; font-size: 13px;">크리스마스에 있었던 파티</p>
        </div>

        <!-- Portfolio Item 2 -->
        <div class="col-md-6 col-lg-4" >
      
          <a target="_blank" href="fjords.jpg" style="margin-bottom: 30px;">
            <img src="<%=request.getContextPath()%>/resources/homepage/images/2.jpg" alt="Fjords" width="100%" height="300" style="margin-bottom: 30px;">
            </a> 
              <b>떡잎반</b>
                <p style="margin: 20px; font-size: 13px;">자기전에 땡깡을 부리고 있는 모습</p>
        </div>

        <!-- Portfolio Item 3 -->
        <div class="col-md-6 col-lg-4" >
  
          <a target="_blank" href="fjords.jpg" style="margin-bottom: 30px;">
            <img src="<%=request.getContextPath()%>/resources/homepage/images/3.jpg" alt="Fjords" width="100%" height="300" style="margin-bottom: 30px;">
            </a>
              <b>새싹반</b>
                <p style="margin: 20px; font-size: 13px;">잠에 골아 떨어진 모습</p>
        </div> --%>

  </div>  

      </div>
    </div>
  </div>
<br>
  <hr>

  <!-- Footer -->
  <%@ include file = "common/footer.jsp" %>

</body>

<script>

	$(function(){
		$.ajax({
			url:"/semi/MainpageImg.me",
			type:"post",
			success:function(data){
				$.each(data,function(index,value){
					<%--  <div class="col-md-6 col-lg-4"  >
			          			<a target="_blank" href="fjords.jpg" style="margin-bottom: 30px;">
			            			<img src="<%=request.getContextPath()%>/resources/homepage/images/1.jpg" alt="Fjords" width="100%" height="300" style="margin-bottom: 30px;">
			            		</a>
			              	<b style="">씨앗반</b>
			                <p style="margin: 20px; font-size: 13px;">크리스마스에 있었던 파티</p>
			        	</div> --%>
				
					var $div = $('<div class="col-md-6 col-lg-4">');
					var $a = $('<a target="_blank" href="" style="margin-bottom: 30px;">');
					$a.attr('href','<%=request.getContextPath()%>/gboardselectone.go?gno='+value.gno);
					var $img = $('<img src="" width="100%" height="300" style="margin-bottom: 30px;">');
					$img.attr('src','<%=request.getContextPath()%>/resources/homepage/images/gboardUploadFiles/'+value.gfile);
					var $p = $('<p style="margin: 20px; font-size: 13px;">').text(value.gtitle);
					console.log($img);
					$a.append($img);
					
					$div.append($a);
					$div.append($p);
					
					$('#imgdiv').append($div);
					
					
				});
				
			},error:function(){
				
			}
		});
	
		
		
	});

</script>

</html>