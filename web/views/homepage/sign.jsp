<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>요정의집 : 회원가입</title>
	
    <!-- <link rel="stylesheet" type="text/css" href="naversign.css"> -->
    <!-- <link rel="stylesheet" type="text/css" href="./css/sign.css"> -->
    
    <link href="<%=request.getContextPath()%>/resources/homepage/css/sign.css"
	rel="stylesheet">
    
    </head>
<body>

  <div id="wrap">

<!-- header -->
    <div id="header">
    <h1 style="text-align:center;">자바 요정의 집</h1>
    </div>
<!-- // header -->

<form id="join_form">
   
    <!-- container -->
    <div id="container">
        <div id="content">
        
            
            <div class="join_content">
                
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        <span class="ps_box int_id">
							<input type="text" id="id" name="userId" class="int" title="ID" maxlength="20">
                           </span>
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
                   
                    <div class="int_mobile_area">
						<span class="ps_box int_mobile">
							<input type="tel" id="phoneNo" name="phone" placeholder="전화번호 입력 - 제외" class="int" maxlength="16">
							<label for="phoneNo" class="lbl"></label>
						</span>
                        <a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
                            <span class="">인증번호 받기</span>
                        </a>
                    </div>
                    <div class="ps_box_disable box_right_space" id="authNoBox">
                        <input type="tel" id="authNo" name="authNo" placeholder="인증번호 입력하세요"  class="int" disabled="" maxlength="4">
                        
                    </div>
                </div>
                <!--  휴대전화 번호, 인증번호 입력 -->
                
            
                <div class="address_area child_info">
                    <h3 class="join_title"> <label for="addr">주소</label></h3>
                    <div class= "addr">
                    <span class="ps_box int_arr"><input type="text" id="addr" placeholder="우편번호" class="int" disabled="" name="addrNo">
                    </span>
                    <a href="#" class="btn_arr" id="btnSend">주소</a>
                </div>
                    
                     <div class="addr_box" style="background: #f7f7f7;">
                            <input type="text" id="autoaddr" placeholder="주소 입력" disabled="" class="int" name="addr1"  style="background: #f7f7f7;" >
                  
                    </div>
                    
                    <div class="addr_box">
                            <input type="text" id="autoaddr" placeholder="상세 주소를 입력하세요" class="int" name="addr2" >
                  
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
                            <option value="M_c">남아</option>
                            <option value="F_c">여아</option>
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
                    <button type="button" id="btnJoin" class="btn_type btn_primary" onclick="location='join_Fin.jsp'"><span>가입하기</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>


	<!-- footer -->
	<%@ include file="common/loginfooter.jsp" %>
	<!-- //footer -->
</div>

</body></html>
