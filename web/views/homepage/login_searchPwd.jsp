<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=1">
	<title>비밀번호찾기</title>
	
	<!-- 개별페이지 CSS -->
	<link href="css/clean-blog.min.css" rel="stylesheet">

	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<!-- 폰트 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

	



  <style>

* {zoom:100%;}
body,html{
    width: 100%;
    height: 100%;
	background: #f5f6f7;
	position: relative;
}

body{
background-size: cover;
background-repeat: no-repeat;
letter-spacing: -0.2px;
font-family: 'Noto Sans KR', sans-serif;
}

.container{

align-content: center;
}
a {
    text-decoration: none;
    color: #555;
}

/* 이 영역에서 카드 사이즈 수정 */
.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
border:0;
background: #f5f6f7;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.card-body{
	flex: 0 1 auto;
	padding:0;
}
.card-footer{
    font-size: 18px;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: white;
background-color: #002c5f;
margin-top:40px;
width: 70%;
height: 60px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}

.input_area{
	width: 100%;
	height: 68px;
	border:0;
	padding-left: 50px;
}
.input-groupp{
	border-bottom: 1px solid #e5e5e5e5;
}
.inputgroup{
	border: 1px solid #a5a5a5;
}
::placeholder{
    color: #919191;}
  
.chkType2  {
	margin-top: 20px;
	position: relative; 
	overflow: hidden;
}
.linkBtn{
	position: absolute;
    bottom: 6px;
    right: 0;
    margin-top: 0;
} 
.chkType2 label {
	
    padding-left: 5px;
    display: inline-block;
    vertical-align: middle;
    min-height: 20px;
    line-height: 20px;
    
}


.ndd{
	height: 200px;
}

#footer {clear: both;margin: 0 auto;text-align: center;}
#footer ul {margin: 0 0 9px 0;}
#footer ul li{ font-size: 12px;position: relative;display: inline;padding: 0 3px 0 7px;white-space: nowrap;}
#footer * {font-size: 12px;font-style: normal;line-height: normal;margin: 0;padding: 0;list-style: none;color: #333;}

hr{margin-top:0; margin-bottom:0;}



.header{text-align: center; }
.loginArea{color: black; font-weight: 600;}
.chkinfo{position: relative;margin-bottom: 29px;}
.wrapper{position: relative; height: 100%;overflow: hidden;}

  
@media screen and (max-width: 758px) {body {font-size: 15px;}}  
@media screen and (max-width: 758px) {.loginArea{font-size: 33px;}}  
@media screen and (max-width: 758px){.container { width: auto;padding: 60px 3% 0px;}}
@media screen and (max-width: 758px){#footer { width: auto;margin-top:10px;}}
@media screen and (min-width: 758px){#footer { width: auto;margin-top:20px;}}

@media screen and (min-width: 758px){.container { width: auto;padding: 150px 3% ;}}
.loginlogo{text-align: center; margin-bottom: 50px;}

@media screen and (max-width: 758px){.login_btn{ height: 45px; margin-top: 5px;}}
@media (min-width: 1200px){.container{max-width: 1140px; height: 90%; padding: 180px;}}
.tabbtn{width: 100%;table-layout: fixed;border-collapse: collapse;}
.tabbtn a.on{color: #fff; background: #555;}
.tabbtn a {display: table-cell;height: 60px;
font-size: 18px;background: #fff;color: #555;text-align: center;
vertical-align: middle;}



@media screen and (max-width:1023px){.tabbtn a{display:table-cell;width: 50%;}} 
@media screen and (max-width:758px){.tabbtn a{height: 40px; font-size: 15px; line-height: 40px;}} 
@media screen and (max-width:1023px){.tabbtn a:first-child{border-left: 0;}} 
 
@media screen and (max-width: 1023px){.tabbtn {display: table;}}
@media screen and (min-width: 1023px){.tabbtn a {display: table-cell;width: 300px;}}

.tabCon{padding: 20px 20px;background: #e9ecef;text-align: center;}
.txtmt{margin-top: 8px; line-height: 26px;}  
.txt{margin-top: 20px;}
.btna a{margin-right: 10px;}
  
@media screen and (max-width: 758px){.btna {margin-top: 20px;text-align: center;}}
@media screen and (min-width: 758px){.btna {margin-top: 20px;text-align: center;}}
@media screen and (min-width: 1023px){.btna {margin-top: 30px;text-align: center;}}

  
  
  </style>

</head>


<body>
	
	
<div class="wrapper" style="overflow: scroll;">
	

        
        
   
    <div class="container">
            <div class="loginlogo"><h2 class="loginArea">비밀번호찾기</h2></div>
	<div class="d-flex justify-content-center h-100">
		<div class="card" style="width: 600px;">
			<div class="card-body">
				<div class="tabbtn">
					<a href="/semi/views/homepage/login_searchId.jsp" class="on">아이디찾기</a>
					<a>비밀번호찾기</a>
				</div>
				<div class="tabParent">
					<div class="tabCon on">
					<div class="iconArea">
						<form action="/semi/searchPwd" method="post">
                            <input type="text" class="input_area" name="userId" placeholder="아이디 입력">
                            <input type="text" class="input_area" name="cbdate" placeholder="자녀생일 입력  ex)2011-12-11">
                  	   
                            <p class="txt"><Strong class="black">
								입력한 정보를 통해 본인인증 후 아이디를 찾으실 수 있습니다.</Strong></p>
							<p class="txtmt">본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하므로<br>
								인증 이외의 용도 또는 저장되지 않습니다.</p>
						</div>
						<div class="btnWrap">
							<input type="submit" value="인증하기" class="btn login_btn">
							<!-- 나중에 type submit으로 변경 해야함 -->
						</div>
						   </form>
					</div>
				</div>
			
				<!-- footer -->
				<%@ include file="common/loginfooter.jsp"%>
			</div>
		</div>
	
	</div>
	</div>	
	 	
</div>
</body>
</html>