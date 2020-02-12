<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>요정의집 : 회원가입</title>
	
    <link href="<%=request.getContextPath()%>/resources/homepage/css/sign.css"
	rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" type="text/javascript"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>

	<!-- HTTPS required. HTTP will give a 403 forbidden response -->
	

    
    </head>
<body>

  <div id="wrap">

<!-- header -->
    <div id="header">
    <h1 style="text-align:center;">자바 요정의 집</h1>
    </div>
<!-- // header -->

<form id="sign_form" action="${pageContext.request.contextPath}/homeinsert" method="post">
   
    <!-- container -->
    <div id="container">
        <div id="content">
        
            <div class="join_content">
                
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        <div class= "addr">
                        <span class="ps_box int_arr">
							<input type="text" id="userId" name="userId" class="int"  maxlength="20">
                           </span>
                           <div class="btn_arr" id="idCheck"><span style='font-weight:700; font-size:13px;'>중복확인</span></div>
                    </div>

					
                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="pswd1" name="userPwd" class="int" title="비밀번호 입력"  maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
                      

                        <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="Pwdchek" class="int" title="비밀번호 재확인 입력"  maxlength="20">
						</span>
                    
                    </div>
                </div>
                <!-- // 아이디, 비밀번호 입력 -->

                <!-- 이름 -->
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="userName" title="이름" class="int" maxlength="40">
						</span>
                      
                    </div>
                <!-- 이름 -->

                <!-- 성별 -->
                    <div class="join_row join_sex">
                        <h3 class="join_title"><label for="gender">성별</label></h3>
                        <div class="ps_box gender_code">
                            <select id="gender" name="gender" class="sel">
                                <option selected="">성별</option>
                                        <option value="M">남자</option>
                                        <option value="F">여자</option>
                            </select>
                        </div>
                    </div>
                <!-- 성별 -->

                <!-- 이메일 -->
                    <div class="join_row join_email">
                        <h3 class="join_title"><label for="email">이메일</label></h3>
                        <span class="ps_box int_email box_right_space">
							<input type="text" id="email" name="email" placeholder="선택입력" aria-label="선택입력" class="int" maxlength="100">
						</span>
                    </div>  
                </div>
                 <!-- 이메일 -->
               

                <!-- 휴대전화 번호, 인증번호 입력 -->
                <div class="join_row join_mobile" id="mobDiv">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                   
                    <div>
						<span class="ps_box int_mobile">
							<input type="tel" id="phone" name="phone" placeholder="전화번호 입력 - 제외" class="int" maxlength="16">
							<label for="phoneNo" class="lbl"></label>
						</span>
                        
                    </div>
                   
                </div>
                <!--  휴대전화 번호, 인증번호 입력 -->
                
            
                <div class="address_area child_info">
                    <h3 class="join_title"> <label for="addr">주소</label></h3>
                    <div class= "addr">
                    <span class="ps_box int_arr"><input type="text" id="addrNo" placeholder="우편번호" class="int" name="addrNo"/>
                    </span>
                    <div class="btn_arr" id="btnSend" onclick="addrSearch()"><span style='font-weight:700; font-size:13px;'>주 소</span></div>
                  <!--   <a href="#" class="btn_arr" id="btnSend" onclick="addrSearch()">주소</a> -->
                </div>
                    
                     <div class="addr_box">
                            <input type="text" id="addr1" placeholder="주소 입력" class="int" name="addr1"/>
                  
                    </div>
                    
                    <div class="addr_box">
                            <input type="text" id="addr2" placeholder="상세 주소를 입력하세요" class="int" name="addr2" >
                  
                    </div>
                    <br><br>
                    <h2 class="" id="part2" style="text-align: center;">자녀정보입력</h2>
                        <h3 class="join_title"><label for="child_name">이름</label></h3>
                    <div class="addr_box child_name">
                        <input type="text" id="cName" class="int" name="cname">
                    </div>
                        <h3 class="join_title"><label for="child_bir">생년월일</label></h3>
                    <div class="addr_box child_bir">
                        <input type="text" id="cName" class="int" name="cbdate" placeholder="ex)1988-12-16">
                    </div>
                        <h3 class="join_title"><label for="child_gender">성별</label></h3>
                    <div class="addr_box child_gender">
                        <select id="c_gender" name="cgender" class="sel">
                            <option selected="">성별</option>
                            <option value="M">남아</option>
                            <option value="F">여아</option>
                        </select>
                    </div>
                    <h3 class="join_title"><label for="child_name">반</label></h3><br>
                        <div id="class_radio" style="text-align: center;">
                            <label for="c_c1">꿈나무반</label>&nbsp;<input type="radio" name="cclass" id="c_c1" value="1"> &nbsp;
                            <label for="c_c2">새싹반</label>&nbsp;<input type="radio" name="cclass" id="c_c2" value="2"> &nbsp; 
                            <label for="c_c3">오징어반</label>&nbsp;<input type="radio" name="cclass" id="c_c3" value="3"> &nbsp;
                            <label for="c_c4">고래반</label>&nbsp;<input type="radio" name="cclass" id="c_c4" value="4"> &nbsp;
                        </div><br>

                </div>
               
                <div class="btn_area">
                    <button type="button" id="btnJoin" class="btn_type btn_primary" onclick="sign();"><span>가입하기</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>
		<script>
		
		
		function sign(){
			$('#sign_form').submit();
		}
		
		// 참조 API : http://postcode.map.daum.net/guide
		function addrSearch() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('#addrNo').val(data.zonecode); //5자리 새우편번호 사용
	                
	                $('#addr1').val(fullAddr);

	                // 커서를 상세주소 필드로 이동한다.
	                $('#addr2').focus();
	            }
	        }).open();
	    };
		
		$('#idCheck').click(function(){
			$.ajax({
				url:"/semi/idDup",
				type:"post",
				data:{
					userId:$('#userId').val()
				},
				success:function(data){
					console.log(data);
					
					if(data == 'ok'){
						alert("사용 가능한 아이디 입니다.");
					}else{
						alert("이미 사용 중인 아이디 입니다.");
						$('#userId').select();
					}
				},error:function(){
					console.log("---ERROR---")
				}
			});
		});
		
		</script>



	<!-- footer -->
	<%@ include file="common/loginfooter.jsp" %>
	<!-- //footer -->
</div>

</body></html>
