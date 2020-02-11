<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    

   
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
  <title>개인정보수정</title>

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
  
  <link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css"rel="stylesheet">


  <style>
        table.board-write2 { width:100%; margin-top:15px; border-top:1px solid #ddd; }
        table.board-write2 th { padding:8px 0; font-size:14px; font-weight:600; color:#333; line-height:30px; text-align:center; vertical-align:top; background-color:#f8f8f8; border-left:1px solid #ddd; border-bottom:1px solid #ddd; }
        table.board-write2 td { padding:8px 0; font-size:14px; color:#333; line-height:30px; text-align:center; border-left:1px solid #ddd; border-bottom:1px solid #ddd; }
        table.board-write2 th.first, table.board-write2 td.first { border-left:none; }
        table.board-write2 td input { width:60%; height:24px; margin:0; padding-left:7px; font-family:"NanumGothic","Nanum Gothic"; font-size:12px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write2 td input.radio { width:auto; height:auto; margin:9px 5px 0 0; padding:0; vertical-align:top; border:none; }
        table.board-write2 td select { height:30px; margin:0; padding-left:7px; font-family:"NanumGothic","Nanum Gothic"; font-size:12px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write2 td .width1 { width:60%; }
        table.board-write2 td .width2 { width:18%; }
        table.board-write2 td .mg1 { margin-left:10px !important; }
        table.board-write2 td a.click { display:inline-block; margin-left:8px; padding:0 15px; font-size:13px; font-weight:600; color:#fff; background-color:#666; }
        table.board-write2 td span { font-weight:600; color:#e00000; }

        table.board-write2 { margin-top:10px; display:block; overflow-x:auto; white-space:nowrap; }
	    table.board-write2 th { min-width:70px; font-size:12px; line-height:21px; padding:8px 0; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td { font-size:12px; line-height:25px; padding:10px 0; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td input { width:40%; height:25px; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td input.radio { margin:7px 4px 0 0; }
	    table.board-write2 td select { height:25px; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td .mg1 { margin-left:5px !important; }
	    table.board-write2 td a.click { margin-left:5px; padding:0 10px; font-size:12px; }

        .mgtop7 { margin-top:10px !important; }
        .mgtop7 { margin-top:15px !important; }
        
        table.board-write { width:100%; margin-top:40px; border-top:2px solid #333; }
        table.board-write th { width:220px; padding:8px 0 8px 30px; font-size:15px; font-weight:600; color:#333; line-height:30px; text-align:left; vertical-align:top; background-color:#f5f5f5; border-bottom:1px solid #ddd; }
        table.board-write th span { color:#e00000; }
        table.board-write td { padding:8px 0 8px 20px; font-size:15px; color:#555; line-height:30px; border-bottom:1px solid #ddd; }
        table.board-write td em { display:inline-block; margin-left:8px; font-size:13px; color:#333; }
        table.board-write td strong { color:#333; }
        table.board-write td span { margin-left:8px; font-weight:600; color:#ffa800; }
        table.board-write td input {  margin:0; padding-left:7px; font-family:"NanumGothic","Nanum Gothic"; font-size:14px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write td input.radio { width:auto; height:auto; margin:9px 5px 0 0; padding:0; vertical-align:top; border:none; }
        table.board-write td input.file { width:500px; height:30px; margin:0; padding:0; vertical-align:top; border:none; background:none; }
        table.board-write td select { height:30px; padding-left:5px; font-family:"NanumGothic","Nanum Gothic"; font-size:14px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write td textarea { width:702px; height:200px; padding:5px; font-family:"NanumGothic","Nanum Gothic"; font-size:14px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write td .mg1 { margin-right:60px !important; }
        table.board-write td .mg2 { margin-left:20px !important; }
        table.board-write td .mg3 { margin-left:20px !important; }
        table.board-write td .mg4 { margin-top:5px !important; }
        table.board-write td .width1 { width:90%; }
        table.board-write td .width2 { width:100px; }
        table.board-write td .width3 { width:56px; }
        table.board-write td .width4 { width:90%; }
        table.board-write td .width5 { width:500px; }
        table.board-write td div.click { display:inline-block; margin-left:8px; padding:0 25px; font-size:13px; font-weight:600; color:#fff; background-color:#666; }
        table.board-write td a.click2 { display:inline-block; padding:0 25px; font-size:13px; font-weight:600; color:#fff; background-color:#ffa800; }
        table.board-write td table.tbl4 { width:60%; }
        
        #form{
            width: fit-content;
           
        }

        
    </style>

</head>

<body>

  <!-- Navigation -->
  <%@ include file="common/nav.jsp" %>


  <!-- Main Content -->
  <div class="top_bg">
    <a class="top_p"> 회원정보수정 </a>
     <p>수정할 정보를 입력</p>
     
   </div>
  
  <br>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <form id="edit_form" action="${pageContext.request.contextPath}/homeupdate" method="post">
            <table class="board-write mgtop7">
                    <tbody>
                           <tr>
                            <th>성명</th>
                            <td><%=m.getUserName()%></td>
                        </tr>
                        <tr>
                            <th>회원아이디</th>
                            <td><%=m.getUserId()%></td>
                        </tr>
                        <tr>
                            <th>비밀번호 <span>*</span></th>
                            <td><input type="password" id="userPwd" name="userPwd"  class="width1"><em>비밀번호는 6~16자리의 영문, 숫자, 특수문자의 혼합</em></td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인 <span>*</span></th>
                            <td><input type="password" id="userpw1" name="userpw1"  class="width1"><em>비밀번호를 한번 더 입력해 주세요</em></td>
                        </tr>
                        <tr>
                            <th>이메일 <span>*</span></th>
                            <td>
                                <input type="text" id="email" name="email" class="width4">                  
                            </td>
                        </tr>
                      
                            <tr>
                            <th>핸드폰번호 <span>*</span></th>
                            <td>
                                <select name="tel1" id="hp1" style="width:95px; font-size:13px; width:120px;" class="select1 ko">
                                    <option value="">국번선택</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select> 
                                - <input type="text" id="hp2" name="tel2" maxlength="4" value="" class="width2" style="text-align:center;" onkeyup="if(this.value.match(/[^0-9]/)) { alert('숫자만 넣어주세요'); this.value = ''; this.focus(); return false; };"> 
                                - <input type="text" id="hp3" name="tel3" maxlength="4" value="" class="width2" style="text-align:center;" onkeyup="if(this.value.match(/[^0-9]/)) { alert('숫자만 넣어주세요'); this.value = ''; this.focus(); return false; };">
                                
                            </td>
                        </tr>
                        <tr>
                            <th>주소 <span>*</span></th>
                            <td>
                                <input type="text" name="addrNo" id="addrNo" class="width4" style="width:200px;" >
                                <div style="cursor:pointer; background: #002c5f; color: white;" class="click" onclick="addrSearch()">주소찾기</div>
                                <p class="mg4">
                                    <input type="text" name="addr1" id="addr1" class="width1" ><br>
                                    <input type="text" name="addr2" id="addr2" class="width1" style="margin-top:10px;">
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일 수신여부 <span>*</span></th>
                            <td>
                                <label><input type="radio" style="width:20px; height:20px; margin-top:6px; margin-left:0px;" name="mailyn" id="mailynY" value="Y" class="radio01" checked=""> 수신</label>
                                <label><input type="radio" style="width:20px; height:20px; margin-top:6px; margin-left:10px;" name="mailyn" id="mailynN" value="N" class="radio01"> 수신하지 않음</label>
                            </td>
                        </tr>
                        <tr>
                            <th>SMS서비스 수신여부 <span>*</span></th>
                            <td>
                                <label><input type="radio" style="width:20px; height:20px; margin-top:6px; margin-left:0px;" name="smsyn" id="smsynY" value="Y" class="radio01" checked=""> 수신</label>
                                <label><input type="radio" style="width:20px; height:20px; margin-top:6px; margin-left:10px;" name="smsyn" id="smsynN" value="N" class="radio01"> 수신하지 않음</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br><br>
                <h5 style="text-align:center;">자녀정보</h5>
                <br>
                    <table class="board-write2">
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="width:18%;">
                            <col style="width:23%;">
                            <col width="*">
                            <col width="*">
                        </colgroup>
                        <thead>
                            <tr><th class="first">이름</th>
                            <th>생년월일</th>
                            <th>성별</th>
                            <th>반</th>
                            
                            
                        </tr></thead>
                        <tbody id="CHILD_ROWS">
                            <tr class="CHILD_ROW">
                                <td style="border-left:0px solid #ddd;">
                               		<%=m.getCname()%>
                                </td>
                                <td>
                                	<%=m.getCbdate()%>
                                </td>
                                <td>
                                    <input type="radio" class="radio01 child_sex1" id="M" name="child_sex_0" value="남" style="width:20px; height:20px; margin-top:6px; margin-left:0px;" disabled>&nbsp;&nbsp;&nbsp;남자
                                    <input type="radio" class="radio01 child_sex1" id="F" name="child_sex_0" value="여" style="width:20px; height:20px; margin-top:6px; margin-left:10px;"disabled>&nbsp;&nbsp;&nbsp;여자
                                </td>
                                <td>
                                    <input type="radio" class="radio01 child_nursery1" id="1" style="width:20px; height:20px; margin-top:6px; margin-left:0px;" value="1" name="where"disabled><label> 1번반</label>
                                    <input type="radio" class="radio01 child_nursery1" id="2" style="width:20px; height:20px; margin-top:6px; margin-left:7px;" value="2" name="where"disabled><label> 2번반</label>
                                    <input type="radio" class="radio01 child_nursery1" id="3" style="width:20px; height:20px; margin-top:6px; margin-left:7px;" value="3" name="where"disabled><label> 3번반</label>
                                    <input type="radio" class="radio01 child_nursery1" id="4" style="width:20px; height:20px; margin-top:6px; margin-left:7px;" value="4" name="where"disabled><label> 4번반</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <input type="submit" value="저장  " class="btn " style="margin-left: 40%; background: #002c5f; color: white;" onclick="">
                    <input type="reset" value="취소  " class="btn " style="margin-left: 10px; background: #002c5f; color: white;" onclick="return ">

                </form>
               	<script>
		
		function sign(){
			$('#edit_form').submit();
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
		
	    $(function(){
	      	var str = <%= m.getGender() %>; 
	      	var cclass = <%= m.getCclass() %>;
	      	if(str.id.indexOf('M') >-1){
	    			$('#M').attr("checked",true);			
	    		}else{
	    			$('#F').attr("checked",true);
	    		}
	      	if(cclass == 4){
	      		$('#4').attr("checked",true);
	      	}
	      	if(cclass == 3){
	      		$('#3').attr("checked",true);
	      	}
	      	if(cclass == 2){
	      		$('#2').attr("checked",true);
	      	}
	      	if(cclass == 1){
	      		$('#1').attr("checked",true);
	      	}
	      	
	      });
		
		
		</script>
                
      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <%@ include file="common/footer.jsp" %>

</body>

</html>
    