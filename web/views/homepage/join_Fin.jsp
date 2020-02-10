<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>가입완료</title>
        <script src = "../signup/js/jquery-3.4.1.min.js"></script>
        <script src = "../signup/js/jquery.selectbox.js"></script>

     
      	<!-- 개별페이지 CSS --> 
      	<!-- 이것만 위치 맞춰주면됨 -->
        <link href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css" rel="stylesheet">
          
      	<!-- 부트스트랩 -->
      	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
          
      	<!-- JS --><!-- 제이쿼리 오류발생 -->
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
        
        
       <link href="<%=request.getContextPath()%>/resources/css/homepage/nav.css" rel="stylesheet">

    </head>
    <body>

        <!-- Navigation -->
        <%@ include file="common/nav.jsp"%>

      <div style="border-top: 3px solid gray; border-bottom: 3px solid gray; text-align: center; font-size: 3em;" >
          회원가입완료
      </div>
        <br>
        <div id="contents" class="container">
            <div class="row">
              <div class="col-lg-8 col-md-10 mx-auto"> 
              <div class="finish"  >
                  <div class="finish" style="background: rgba(245, 240, 240, 0.952); padding:20px; margin-top:30px;  padding-left:20px; padding-right:20px; font-size:18px; line-height:27px;" > 
                  <p class="tit" style="font-size: 25px;"><b>회원 가입이 완료되었습니다.</b></p>
                  <p class="txt1"><span style="color: #002c5f;"><b>***회원님!</b></span> KH 요정의 집 어린이집 홈페이지 가입을 축하드립니다.<br>저희 KH 요정의 집 어린이집 홈페이지에 지속적인 관심을 부탁드립니다.</p>
                  <ul class="bul_list">
                      <li>회원님의 아이디와 비밀번호의 관리소홀, 부정사용에 의한 결과의 책임은 회원님에게 있으므로 신중히 관리하시기 바랍니다.</li>
                      <li>개인정보를 변경하시려면 로그인 후 마이페이지 메뉴를 이용하세요.</li>
                  </ul>
              	</div>
              <div class="d-flex justify-content-center">
                  <button class="btn" style="background: #002c5f; color: white; width: 150px; height: 50px; margin: 50px;" onclick="location='homeindex.jsp'">
                      메인으로 가기
                  </button>
                </div>   
            </div> 
        	</div>
          </div>
        </div>
         <!-- Footer -->
	<%@ include file="common/footer.jsp"%>
    
    </body>
</html>
