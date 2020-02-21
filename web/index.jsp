<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="semi.home.jsp.controller.*" %>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=1">
<title>로그인 페이지</title>
<link
	href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css"
	rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- 폰트 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<link
	href="<%=request.getContextPath()%>/resources/homepage/css/home_login.css"
	rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="wrapper">

		<div class="container">
			<div class="loginlogo">
				<h2 class="loginArea">로그인</h2>
			</div>
			<div class="d-flex justify-content-center h-100">
				<div class="card" style="width: 600px;">
					<div class="card-body">
						<form name ="LoginCheck" id="Loginform" action="/semi/homelogin" method="post" onsubmit="return checkValue()">
							<div class="inputgroup">
								<div class="input-groupp">
									<input type="text" class="input_area"placeholder="아이디를 입력해주세요." name="userId" id="userId">
								</div>
								<div class="input-group">
									<input type="password" class="input_area"placeholder="비밀번호를 입력해주세요." name="userPwd">
								</div>
							</div>

							<div class="chkinfo">
								<div class="chkType2">
									<input type="checkbox" id="saveid" name="saveid"> <label
										for="chk1">아이디 저장</label>
									<div class="linkBtn">
									<a id="idFind" href="<%=request.getContextPath()%>/views/homepage/login_searchId.jsp" style="color: black;">아이디찾기</a> 
									<a id="pwdFind" href="<%=request.getContextPath()%>/views/homepage/login_searchPwd.jsp" style="color: black;">비밀번호찾기</a>
									</div>
								</div>
							</div>



							<div class="button-area d-flex justify-content-center ">
								<input type="submit" value="로그인" class="btn login_btn" >
								<!-- 나중에 submit으로 변경 -->
							</div>
							<div class="button-area d-flex justify-content-center ">
								<input type="btn" id="btnsign" value="회원가입"
									class="btn login_btn" style="margin-top: 10px;"
									onclick='memberJoin()'>
							</div>
						</form>
			
			<%@ include file="views/homepage/common/loginfooter.jsp"%>
				</div>
			</div>
					</div>
			
			
			<script>
			
			function checkValue(){
				
				inputForm = eval("document.LoginCheck");
			        if(!inputForm.userId.value)
			        {
			            alert("아이디를 입력하세요");    
			            inputForm.userId.focus();
			            return false;
			        }
			        if(!inputForm.userPwd.value)
			        {
			            alert("비밀번호를 입력하세요");    
			            inputForm.userPwd.focus();
			            return false;
			        }
			        
				}
			
			function memberJoin(){
				location.href='/semi/views/homepage/join.jsp';
			}
			
			$(document).ready(function(){
				 
			    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
			    var key = getCookie("key");
			    $("#userId").val(key); 
			     
			    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			        $("#saveid").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			    }
			     
			    $("#saveid").change(function(){ // 체크박스에 변화가 있다면,
			        if($("#saveid").is(":checked")){ // ID 저장하기 체크했을 때,
			            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
			        }else{ // ID 저장하기 체크 해제 시,
			            deleteCookie("key");
			        }
			    });
			     
			    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
			    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
			        if($("#saveid").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
			        }
			    });
			});
			 
			function setCookie(cookieName, value, exdays){
			    var exdate = new Date();
			    exdate.setDate(exdate.getDate() + exdays);
			    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
			    document.cookie = cookieName + "=" + cookieValue;
			}
			 
			function deleteCookie(cookieName){
			    var expireDate = new Date();
			    expireDate.setDate(expireDate.getDate() - 1);
			    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
			}
			 
			function getCookie(cookieName) {
			    cookieName = cookieName + '=';
			    var cookieData = document.cookie;
			    var start = cookieData.indexOf(cookieName);
			    var cookieValue = '';
			    if(start != -1){
			        start += cookieName.length;
			        var end = cookieData.indexOf(';', start);
			        if(end == -1)end = cookieData.length;
			        cookieValue = cookieData.substring(start, end);
			    }
			    return unescape(cookieValue);
			}
			
			</script>
			</div>
			</div>
			
		
</body>
</html>
