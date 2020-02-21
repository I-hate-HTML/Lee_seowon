<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>교육을 합시다</title>
    
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
    <a class="top_p"> 교육일정 </a>
     <p>아이들 교육일정</p>
   </div>
        <br>
        <div id="contents" class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 mx-auto">
            
            <div class="cal_top">
                <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
                <span id="eduyear" name="eduyear"></span>
                <span id="edumonth" name="edumonth"></span>
                <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
            </div>
            <div id="cal_tab" class="cal">
            </div>
            <div>
                <img src="" style="width: 100%;" id="eduimg" alt="교육일정 사진 들어갈예정" onclick="clickimg(this)">
            </div>
            </div>
            </div>
            <form  action="<%= request.getContextPath() %>/ecalinputimg.me" id="imguploadform" method="post" enctype="multipart/form-data">
            <% if(m.getJob_code()!=6){ %>
            <label class="btn justify-content-center" style="background: #002c5f; color: white; width: 150px; margin-top: 9px" >
            	<input type="file" id="fileinput" class="btn btn-primary"
               	style="background: #002c5f; color: white; width: 100px;" name="eduimg"
                accept=".jpg,.jpeg,.png,.gif,.jfif"onchange="imageURL(this)">
                	사진 업로드
            </label>
             <button class="btn justify-content-center " style="background: #002c5f; color: white; width: 100px;" onclick="deleteImg()" >삭제</button>
             <input type="submit" class="btn justify-content-center" style="background: #002c5f; color: white; width: 100px;" id="sendimg" value="등록">       
          <% } %>
           <input type="hidden" id="edudate" name="edudate">
           </form>
        </div>
        <br>
        <br>
        <hr>
        <!-- Footer -->
        <%@ include file="common/footer.jsp" %>
  


      <script type="text/javascript">

        $('img').click(function(){
			window.open($(this).attr('src'),'파일상세보기','location=no,width=500,height=500');
		});
        

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
    	

		
		function imageURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#eduimg').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function deleteImg(){
			$('#eduimg').attr('src','');
			$('#fileinput').val('');
			$.ajax({				
				url:"/semi/edeleteimg.me",
				type:"post",
				data:{
					edudate : $("#edudate").val()	
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
            $("#eduyear").text(year);
            $("#edumonth").text(month);
            $("#edudate").val(String(year) + month);
            
            $.ajax({
            	url : "/semi/eselectimg.me",
            	type : "post",
            	data:{
            		edudate : $("#edudate").val()
            	},success:function(data){
            		$('#eduimg').attr('src','<%=request.getContextPath()%>/resources/homepage/images/eduimg/'+data);
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
