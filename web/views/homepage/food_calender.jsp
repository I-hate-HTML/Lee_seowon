<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>식샤를 합시다</title>
        <!-- <script src = "../signup/js/jquery-3.4.1.min.js"></script>
        <script src = "../signup/js/jquery.selectbox.js"></script> -->
    
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
       
		<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css" rel="stylesheet">

        <style type="text/css">
            .cal_top{
                text-align: center;
                font-size: 30px;
            }
            .cal{
                text-align: center;    
            }
            table.calendar{
                border: 1px solid black;
                display: inline-table;
                text-align: left;
            }
            table.calendar td{
                vertical-align: top;
                border: 1px solid skyblue;
                width: 100px;
            }
            
            #fileinput{
	            	position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: 0px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
            
            }
            
            </style>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
    </head>
    <body>

        <!-- Navigation -->
        <%@ include file="common/nav.jsp" %>

  <div class="top_bg">
    <a class="top_p"> 월간식사 </a>
     <p>아이들이 먹는 식단표</p>
   </div>
        <br>
        <div id="contents" class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 mx-auto">
             
            <div class="cal_top">
                <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
                <span id="foodyear" name="foodyear"></span>
                <span id="foodmonth" name="foodmonth"></span>
                <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
            </div>
            <div id="cal_tab" class="cal">
            </div>
            <hr>
            <div>
                <img src="" name="imgtag" style="width: 100%;" alt="음식 사진 들어갑니다" id="foodimg">
            <hr>
            <p>
            	⊙ 식단은 원내 사정(검수 물품 불량, 물가 인상 등)상 변경될 수 있습니다. <br>
				⊙ 원산지 표시(쌀, 채소, 과일은 국내산 친환경으로 사용) <br>
				<small>
				- 농산물 : 친환경 농산물 식재료 사용 &nbsp;&nbsp;&nbsp;&nbsp;
				- 공산품(된장, 고추장, 간장, 참기름, 깨, 소금 등) : 국산 <br>
				- 공산품(설탕, 튀김가루, 빵가루, 밀가루) : 유기농 설탕, 우리밀 국산 &nbsp;&nbsp;&nbsp;&nbsp;
				- non-GMO 현미유 사용 <br>
				</small>
				◈ 알레르기 유발식품 표시제 (식단표의 번호에 해당되는 식품) <br>
				<small>
				1.난류 2.우유 3.메밀 4.땅콩 5.대두 6.밀 7.고등어 8.게 9.새우 10.돼지고기 11.복숭아 12.토마토 13.아황산류 <br>14.호두
				15.닭고기 16. 쇠고기 17.오징어 18.조개류(굴, 전복, 홍합 포함)
				</small>				
            </p>
            <table border="1px solid grey" style="text-align: center; font-size: small;">
            	<tr>
            		<th>쌀<br>(친환경 쌀)</th>
            		<th>김치<br>(배추, 고춧가루)</th>
            		<th>쇠고기</th>
            		<th>돼지고기/가공품</th>
            		<th>닭고기, 달걀</th>
            		<th>오리고기</th>
            		<th>명태(동태)</th>
            		<th>오징어</th>
            		<th>두부</th>
            	</tr>
            	<tr>
            		<td>국내산<br>무농약 쌀</td>
            		<td>국내산</td>
            		<td>국내산 한우 1등급</td>
            		<td>국내산 1등급</td>
            		<td>국내산</td>
            		<td>국내산</td>
            		<td>러시아산</td>
            		<td>국내산</td>
            		<td>국내산 콩</td>
            	</tr>
            </table>
            </div>
            </div>
            </div>
			<form action="<%= request.getContextPath() %>/fcalendar.me" method="post" enctype="multipart/form-data">     
			 
            <% if(m.getJob_code()!=6){ %>
            <label class="btn justify-content-center" style="background: #002c5f; color: white; width: 150px; margin-top: 9px" >
            	<input type="file" id="fileinput" class="btn btn-primary"
               	style="background: #002c5f; color: white; width: 100px;"
                accept=".jpg,.jpeg,.png,.gif,.jfif"onchange="imageURL(this)" name="fcalimg">
                	사진 업로드
            </label>
             <button class="btn justify-content-center " style="background: #002c5f; color: white; width: 100px;" onclick="deleteImg()" >삭제</button>
            <input type="submit" class="btn justify-content-center" style="background: #002c5f; color: white; width: 100px;" id="sendimg" value="등록">       
           <% } %>
           
           <input type="hidden" id="fooddate" name="fooddate">
           </form>
        </div>
           
        <br>
        <br>
        <hr>
        <!-- Footer -->
		<%@ include file="common/footer.jsp" %>

      <script>
      
      $('#fileinput').change(function(){
 		 var bfile = $('#bfile1');
 		 var file_kind = bfile.val().lastIndexOf('.');
 		 var file_name = bfile.val().substring(file_kind+1,bfile.length);
 		 var file_type = file_name.toLowerCase();
 		 var check_file_type= new Array();
 		 check_file_type=['jpg','gif','png','jpeg','bmp','jfif'];

 		 if(check_file_type.indexOf(file_type)==-1){
 		  alert('이미지 파일만 선택할 수 있습니다.');
 		  $('#bfile1').val('');
 		  return false;
 		 }
 	});
      
      	$('img[name=imgtag]').click(function(){
			window.open($(this).attr('src'),'파일상세보기','location=no,width=500,height=500');
		});

		function imageURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#foodimg').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}			
		}
	
		
		function deleteImg(){
			$('#foodimg').attr('src','');
			$('#fileinput').val('');
			
			$.ajax({
				
				url:"/semi/fcaldeltetimg.me",
				type:"post",
				data:{
					fooddate : $("#fooddate").val()	
				},
				success:function(){
					alert("삭제성공!");
				},
				error:function(){
					alert("에러발생!");
				}
			});
		}
		
        var lol = ["곱창","마라탕","소시지페스티벌","수소수","H2O가","산소라는건","문과인","나도안다"]
    
        var today = null;
        var year = null;
        var month = null;
        var firstDay = null;
        var lastDay = null;
        var $tdDay = null;
        var $tdSche = null;
     
        $(document).ready(function() {

            initDate();
            drawDays();
            $("#movePrevMonth").on("click", function(){movePrevMonth();});
            $("#moveNextMonth").on("click", function(){moveNextMonth();});
        });
        
        //calendar 그리기
     
        //날짜 초기화
        function initDate(){
            $tdDay = $("td div.cal-day")
            $tdSche = $("td div.cal-schedule")
            dayCount = 0;
            today = new Date();
            year = today.getFullYear();
            month = today.getMonth()+1;
            firstDay = new Date(year,month-1,1);
            lastDay = new Date(year,month,0);
        }
        
        //calendar 날짜표시
        function drawDays(){
            $("#foodyear").text(year);
            $("#foodmonth").text(month);
            $("#fooddate").val(String(year) + month);
            
            $.ajax({
            	url : "/semi/fcalimg.me",
            	type : "post",
            	data:{
            		fooddate : $("#fooddate").val()
            	},success:function(data){
            		$('#foodimg').attr('src','<%=request.getContextPath()%>/resources/homepage/images/foodimg/'+data);
            	},error:function(){
            		alert("에러났다 에베베벱베베벱ㅂ베벱");
            	}
            	
            });
            
      		

        }
     
        //calendar 월 이동
        function movePrevMonth(){
            month--;
            if(month<=0){
                month=12;
                year--;
            }
            if(month<10){
                month=String(month);
            }
            getNewInfo();
            }
        
        function moveNextMonth(){
            month++;
            if(month>12){
                month=1;
                year++;
            }
            if(month<10){
                month=String(month);
            }
            getNewInfo();
        }
    
        
        function getNewInfo(){
            for(var i=0;i<42;i++){
                $tdDay.eq(i).text("");
            }
            dayCount=0;
            firstDay = new Date(year,month-1,1);
            lastDay = new Date(year,month,0);
            drawDays();
        }
        
      

        
    </script>
    
    
    </body>
</html>
