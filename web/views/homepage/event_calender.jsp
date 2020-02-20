<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>행사일정</title>
        <script src = "../signup/js/jquery-3.4.1.min.js"></script>
        <script src = "../signup/js/jquery.selectbox.js"></script>

    
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
            </style>
    </head>
    <body>

        <!-- Navigation -->
		<%@ include file="common/nav.jsp" %>
  

  <div class="top_bg">
    <a class="top_p"> 월간행사 </a>
     <p>아이들 소식을 전하는 공간</p>
   </div>
        <br>
        <div id="contents" class="container">
            <div class="cal_top">
                <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
                <span id="cal_top_year"></span>
                <span id="cal_top_month"></span>
                <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
            </div>
            <br>
            <div id="cal_tab" class="cal">
            </div> 
        </div>
<hr>

        <!-- Footer -->
		<%@ include file="common/footer.jsp" %>


      <script type="text/javascript">

        var lol = ["곱창","마라탕","소시지페스티벌","수소수","H2O가","산소라는건","문과인","나도안다"]
    
        var today = null;
        var year = null;
        var month = null;
        var firstDay = null;
        var lastDay = null;
        var $tdDay = null;
        var $tdSche = null;
     
        $(document).ready(function() {
            drawCalendar();
            initDate();
            drawDays();
            $("#movePrevMonth").on("click", function(){movePrevMonth();});
            $("#moveNextMonth").on("click", function(){moveNextMonth();});
        });
        
        //calendar 그리기
        function drawCalendar(){
            var setTableHTML = "";
            setTableHTML+='<table class="calendar">';
            setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
            for(var i=0;i<6;i++){
                setTableHTML+='<tr height="100">';
                for(var j=0;j<7;j++){
                    setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                    setTableHTML+='    <div class="cal-day"></div>';
                    setTableHTML+='    <div class="cal-schedule"></div>';
                    setTableHTML+='</td>';
                }
                setTableHTML+='</tr>';
            }
            setTableHTML+='</table>';
            $("#cal_tab").html(setTableHTML);
        }
     
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
            $("#cal_top_year").text(year);
            $("#cal_top_month").text(month);
            for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
                if(i%7==1){
                    $tdDay.eq(i).text(++dayCount+lol[i%8]);
                }else if(i%7==4){
                    $tdDay.eq(i).text(++dayCount+lol[i%8]);
                }else{
                    $tdDay.eq(i).text(++dayCount);
                }
            }
            for(var i=0;i<42;i+=7){
                $tdDay.eq(i).css("color","red");
            }
            for(var i=6;i<42;i+=7){
                $tdDay.eq(i).css("color","blue");
            }
        }
     
        //calendar 월 이동
        function movePrevMonth(){
            month--;
            if(month<=0){
                month=12;
                year--;
            }
            if(month<10){
                month=String("0"+month);
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
                month=String("0"+month);
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
