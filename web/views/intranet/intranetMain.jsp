<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../intranet/common/nav.jsp" %>
<%=request.getContextPath()%>
    
<!DOCTYPE html>
<!-- saved from url=(0061)https://blackrockdigital.github.io/startbootstrap-sb-admin-2/ -->
<html lang="ko">
<head>
  <title>꿈나라어린이집 # 인트라넷_메인</title>
  <link href='../../resources/js/fullcal/core/main.css' rel='stylesheet' />
<link href='../../resources/js/fullcal/daygrid/main.css'
	rel='stylesheet' />

<script src='../../resources/js/fullcal/core/main.js'></script>
<script src='../../resources/js/fullcal/daygrid/main.js'></script>
<script src="../../resources/js/fullcal/interaction/main.min.js"></script>
<script src='../../resources/js/fullcal/core/locales/ko.js'></script>
<script src="../../resources/js/fullcal/timegrid/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style type="text/css">
#external-events {
	width: 50%;
	border: 1px solid #ccc;
	background: #eee;
}
.demo-topbar+#external-events { /* will get stripped out */
	top: 60px;
}
#external-events .fc-event {
	margin: 1em 0;
	cursor: move;
}
#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 200px;
}
#calendar {
	max-width: 1200px;
	margin: 20px auto;
}
</style>
</head>
<body>
         <!-- Begin Page Content -->
         <div class="container-fluid">
          <!-- 컨텐츠 머리글 -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
             <h1 class="h3 mb-0 text-gray-800">꿈나라어린이집</h1>
           </div>
 
           <!-- Content Row -->

 
             <!-- 메뉴1 간략히 보기 -->
             
 
           <!-- Content Row -->
 
           <div class="row">
             <div class="card shodow mb-4" style="width: 100%;">
               <div class="card-header py-3">
                 <h6 class="m-0 font-weight-bold text-primary">일정관리</h6> 
               </div>
               <div class="card-body">
					<div id="calendar"></div>
               </div>
             </div>
             
             
           <!-- Content Row -->
          
 
             <!-- Content Column -->
             <div class="col-lg-6 mb-4">
 
               <!--업무 이동! -->
               <div class="card shadow mb-4">
                 <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary">알림장 관리</h6>
                 </div>
                 <div class="card-body">
                    <table class = "table" style="font-size:12px;">
             <tr>
               <th></th>
               <th>글번호</th>
               <th>구분</th>
               <th>아이명</th>
               <th>제목</th>
               <th>작성자</th>
               <th>날짜</th>
             </tr>
           </table>
                 </div><br>
               </div>
               
 
               <!-- Color System -->
 
             </div>
 
             <div class="col-lg-6 mb-4">
 
               <!-- Approach -->
               <div class="card shadow mb-4">
                 <div class="card-header py-3">
                   <h6 class="m-0 font-weight-bold text-primary">품의확인</h6>
                 </div>
                 <div class="card-body">
                   
           <table class = "table table-hover" style="font-size:12px;">
             <tr>
               <th></th>
               <th>품의번호</th>
               <th>분류</th>
               <th>상태</th>
               <th >제목</th>
               <th>기안자</th>               
               <th>작성일</th>
             </tr>           
           </table>  
           
           <nav aria-label="Page navigation example">
             <ul class="pagination pagination-sm justify-content-center">
               <li class="page-item disabled">
                 <a class="page-link" href="#" aria-label="Previous">
                   <span aria-hidden="true">&laquo;</span>
                   <span class="sr-only">Previous</span>
                 </a>
               </li>
               <li class="page-item disabled"><a class="page-link" href="#">1</a></li>
               <li class="page-item"><a class="page-link" href="#">2</a></li>
               <li class="page-item"><a class="page-link" href="#">3</a></li>
               <li class="page-item">
                 <a class="page-link" href="#" aria-label="Next">
                   <span aria-hidden="true">&raquo;</span>
                   <span class="sr-only">Next</span>
                 </a>
               </li>
             </ul>
           </nav>        
         
                 </div>
               </div>
 
             </div>
           </div>
        </div>
       <!-- /.container-fluid -->

     <!-- End of Main Content -->
     <%@ include file = "../intranet/common/footer.jsp" %>
     <script type="text/javascript">
	
		document.addEventListener('DOMContentLoaded', function() {
			var Calendar = FullCalendar.Calendar;
			var Draggable = FullCalendarInteraction.Draggable;
			var calendarEl = document.getElementById('calendar');
			var calendar = new Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid', 'timeGrid'],
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				navLinks :true,
				editable : true,
				droppable : true,
				allDaySlot : false,
				events: "../../resources/intranet/ajax/data.json",
				drop : function(info) {
					if (checkbox.checked) {
						info.draggedEl.parentNode.removeChild(info.draggedEl);
					}
				},
				locale : 'ko',
				dataeClick : function(){}
				
			});
			calendar.render();
			jQuery.noConflict();
			calendar.on('dateClick', function(info) {
				console.log('sibal' + info.dateStr);
				$('#Event').modal('show');
				$('#startDate').attr('value', info.dateStr);
				$('#endDate').attr('value', info.dateStr);
			});
			calendar.on('dataClick',function(info){
				$('#Event').modal('show');
			})
		});
		
		function check(){
			var event = new Object();
			event._id = cData.length+1;
			event.title = $('#eventTitle').val();
			event.start = $('#startDate').val();
			event.end = $('#endDate').val();
			event.type= $('#eventType').val();
			event.username = $('#user').val();
			event.backgroundColor="#a9e34b";
			event.textColor="#ffffff"
			
			console.log(event.title);
			var jsonData = JSON.stringify(event);
			
			if(event.title == ''||event.type==''){
				alert('빈 항목이 있습니당');
				return false;
			}else{
				cData.push(jsonData);
				$('#chidden').attr("value",JSON.stringify(cData));
				console.log($('#chidden').val());
				return true;
			};
			
			
			
		};
		
	</script>
     
 
</body>
</html>