<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../intranet/common/nav.jsp"%>

<!DOCTYPE html>
<!-- saved from url=(0061)https://blackrockdigital.github.io/startbootstrap-sb-admin-2/ -->
<html lang="ko">
<head>
<title>꿈나라어린이집 # 인트라넷_메인</title>
<link rel="stylesheet"
	href="../../resources/js/fullcal/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet"
	href="../../resources/js/fullcal/vendor/css/bootstrap.min.css">
<link rel="stylesheet"
	href='../../resources/js/fullcal/vendor/css/select2.min.css' />
<link rel="stylesheet"
	href='../../resources/js/fullcal/vendor/css/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet" href="../../resources/js/fullcal/css/main.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>

	<div class="container">
		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- 컨텐츠 머리글 -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">꿈나라어린이집</h1>
			</div>
			<div class="row">
			<div class="col-lg-6 mb-4">
		
					<!--업무 이동! -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">알림장 관리</h6>
						</div>
						<div class="card-body">
							<table class="table" style="font-size: 12px;" id="alim">
								<tr>
									<th>글번호</th>
									<th>구분</th>
									<th>아이명</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
							</table>
						</div>
						<br>
						<hr>
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
							<table class="table" style="font-size: 12px;" id="pum">
								<tr>
									<th>품의번호</th>
									<th>분류</th>
									<th>상태</th>
									<th>제목</th>
									<th>기안자</th>
									<th>작성일</th>
								</tr>
							</table>
						</div>
						<br>
						<hr>
					</div>
				</div>
			</div>				
			<div class="row">
				<div class="card shodow mb-4" style="width: 100%;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">원내일정</h6>
					</div>
					<div class="card-body">
						<div id="calendar"></div>
					</div>
					
				</div>


				<!-- Content Row -->

				<!-- Content Column -->
				
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->
	<%@ include file="../intranet/common/footer.jsp"%>
	<script src="../../resources/js/fullcal/vendor/js/bootstrap.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/moment.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/fullcalendar.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/ko.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/select2.min.js"></script>
	<script
		src="../../resources/js/fullcal/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
	$(function(){
	var calendar = $('#calendar').fullCalendar({

		

		//주말 숨기기 & 보이기 버튼
		customButtons: {
			viewWeekends: {
				text: '주말',
				click: function () {
					activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
					$('#calendar').fullCalendar('option', {
						weekends: activeInactiveWeekends
					});
				}
			}
		},

		header: {
			left: 'today, prevYear, nextYear, viewWeekends',
			center: 'prev, title, next',
			right: 'month,agendaWeek,agendaDay,listWeek'
		},
		views: {
			month: {
				columnFormat: 'dddd'
			},
			agendaWeek: {
				columnFormat: 'M/D ddd',
				titleFormat: 'YYYY년 M월 D일',
				eventLimit: false
			},
			agendaDay: {
				columnFormat: 'dddd',
				eventLimit: false
			},
			listWeek: {
				columnFormat: ''
			}
		},

		/* ****************
		 *  일정 받아옴 
		 * ************** */
		events: function (start, end, timezone, callback) {
			$.ajax({
				type: "get",
				url: "/semi/readEvent.ev",
				success: function (response) {
					var events = [];
					for (var i = 0; i < response.length; i++) {
						var evt = {
								_id: response[i].id,
								title: response[i].title,
								description : response[i].description,
								start : response[i].start,
								end : response[i].end,
								type : response[i].type,
								username : response[i].username,
								backgroundColor : response[i].backgroundColor,
								textColor : response[i].textColor,
								allDay : response[i].allDay
						};
						events.push(evt);
					}
					callback(events);
					var fixedDate = response.map(function (array) {
						if (array.allDay && array.start !== array.end) {
							// 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
							array.end = moment(array.end).add(1, 'days');
						}
						return array;
					});
					callback(fixedDate);
				}
			});
		},

		eventAfterAllRender: function (view) {
			if (view.name == "month") {
				$(".fc-content").css('height', 'auto');
			}
		},
		

		locale: 'ko',
		timezone: "local",
		nextDayThreshold: "09:00:00",
		allDaySlot: true,
		displayEventTime: true,
		displayEventEnd: true,
		firstDay: 0, //월요일이 먼저 오게 하려면 1
		weekNumbers: false,
		selectable: true,
		weekNumberCalculation: "ISO",
		eventLimit: true,
		views: {
			month: {
				eventLimit: 12
			}
		},
		eventLimitClick: 'week', //popover
		navLinks: true,
		defaultDate: moment('2020-02'), 
		timeFormat: 'HH:mm',
		defaultTimedEventDuration: '01:00:00',
		editable: false,
		minTime: '00:00:00',
		maxTime: '24:00:00',
		slotLabelFormat: 'HH:mm',
		weekends: true,
		nowIndicator: true,
		dayPopoverFormat: 'MM/DD dddd',
		longPressDelay: 0,
		eventLongPressDelay: 0,
		selectLongPressDelay: 0
	});
	});
	</script>
	<script>
   		$('#userTableBtn').click(function(){
   			$.ajax({
   				url : "/semi/",
   				type : "get",
   				success:function(data){
   					$.each(data,function(index,value){
   						var $tr = $('<tr>');
   						var $pumno = $('<td>').text(index);
   						var $pumtype = $('<td>').text(value.userNo);
   						var $pumnow = $('<td>').text(value.phone);
   						var $pumtitle = $('<td>').text(value.userName);
   						var $pumuser = $('<td>').text(value.gender);
   						var $pumdate = $('<td>').text(value.phone);
   						
   						
   						
   						$tr.append($pumno);
   						$tr.append($pumtype);
   						$tr.append($pumnow);
   						$tr.append($pumtitle);
   						$tr.append($pumuser);
   						$tr.append($pumdate);
   						
   						$('#pum').append($tr);
   					});
   				},error:function(){
   					console.log("에러입니다.");
   				}
   			})
   		})
   </script>
	
   <script>
   		$('#userTableBtn').click(function(){
   			$.ajax({
   				url : "/semi/",
   				type : "get",
   				success:function(data){
   					$.each(data,function(index,value){
   						var $tr = $('<tr>');
   						var $alimno = $('<td>').text(index);
   						var $alimtype = $('<td>').text(value.userNo);
   						var $childname = $('<td>').text(value.phone);
   						var $title = $('<td>').text(value.userName);
   						var $writer = $('<td>').text(value.gender);
   						var $date = $('<td>').text(value.phone);
   						
   						
   						
   						$tr.append($alimno);
   						$tr.append($alimtype);
   						$tr.append($childname);
   						$tr.append($title);
   						$tr.append($writer);
   						$tr.append($date);
   						
   						$('#alim').append($tr);
   					});
   				},error:function(){
   					console.log("에러입니다.");
   				}
   			})
   		})
   </script>

</body>
</html>