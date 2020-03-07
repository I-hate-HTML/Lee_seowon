<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>행사일정</title>
<script src="../signup/js/jquery-3.4.1.min.js"></script>
<script src="../signup/js/jquery.selectbox.js"></script>


<!-- 개별페이지 CSS -->
<!-- 이것만 위치 맞춰주면됨 -->
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

<!-- 아이콘 레퍼런스 사이트 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!-- 폰트 -->
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
	href="<%=request.getContextPath()%>/resources/homepage/css/nav.css"
	rel="stylesheet">
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

<style type="text/css">
.cal_top {
	text-align: center;
	font-size: 30px;
}

.cal {
	text-align: center;
}

table.calendar {
	border: 1px solid black;
	display: inline-table;
	text-align: left;
}

table.calendar td {
	vertical-align: top;
	border: 1px solid skyblue;
	width: 100px;
}
</style>


       <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script> 
   
</head>
<body>

	<!-- Navigation -->
	<%@ include file="common/nav.jsp"%>


	<div class="top_bg">
		<a class="top_p"> 월간행사 </a>
		<p>아이들 소식을 전하는 공간</p>
	</div>
	<br>
	<div id="contents" class="container">
		<div class="row">
			<div class="card shodow mb-4" style="width: 100%;">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">원내일정</h6>
				</div>
				<div class="card-body">
					<div id="calendar"></div>
				</div>

			</div>

		</div>
	</div>
	<hr>

	<!-- Footer -->
	<%@ include file="common/footer.jsp"%>
	<script src="../../resources/js/fullcal/vendor/js/bootstrap.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/moment.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/fullcalendar.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/ko.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/select2.min.js"></script>
	<script
		src="../../resources/js/fullcal/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var calendar = $('#calendar')
					.fullCalendar(
							{

								//주말 숨기기 & 보이기 버튼
								customButtons : {
									viewWeekends : {
										text : '주말',
										click : function() {
											activeInactiveWeekends ? activeInactiveWeekends = false
													: activeInactiveWeekends = true;
											$('#calendar')
													.fullCalendar(
															'option',
															{
																weekends : activeInactiveWeekends
															});
										}
									}
								},

								header : {
									left : 'today, prevYear, nextYear, viewWeekends',
									center : 'prev, title, next',
									right : 'month,agendaWeek,agendaDay,listWeek'
								},
								views : {
									month : {
										columnFormat : 'dddd'
									},
									agendaWeek : {
										columnFormat : 'M/D ddd',
										titleFormat : 'YYYY년 M월 D일',
										eventLimit : false
									},
									agendaDay : {
										columnFormat : 'dddd',
										eventLimit : false
									},
									listWeek : {
										columnFormat : ''
									}
								},

								/* ****************
								 *  일정 받아옴 
								 * ************** */
								events : function(start, end, timezone, callback) {
									$.ajax({
												type : "get",
												url : "/semi/readEvent.ev",
												success : function(response) {
													var events = [];
													for (var i = 0; i < response.length; i++) {
														var evt = {
															_id : response[i].id,
															title : response[i].title,
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
													var fixedDate = response
															.map(function(array) {
																if (array.allDay
																		&& array.start !== array.end) {
																	// 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
																	array.end = moment(
																			array.end)
																			.add(
																					1,
																					'days');
																}
																return array;
															});
													callback(fixedDate);
												}
											});
								},

								eventAfterAllRender : function(view) {
									if (view.name == "month") {
										$(".fc-content").css('height', 'auto');
									}
								},

								locale : 'ko',
								timezone : "local",
								nextDayThreshold : "09:00:00",
								allDaySlot : true,
								displayEventTime : true,
								displayEventEnd : true,
								firstDay : 0, //월요일이 먼저 오게 하려면 1
								weekNumbers : false,
								selectable : true,
								weekNumberCalculation : "ISO",
								eventLimit : true,
								views : {
									month : {
										eventLimit : 12
									}
								},
								eventLimitClick : 'week', //popover
								navLinks : true,
								defaultDate : moment('2020-02'),
								timeFormat : 'HH:mm',
								defaultTimedEventDuration : '01:00:00',
								editable : false,
								minTime : '00:00:00',
								maxTime : '24:00:00',
								slotLabelFormat : 'HH:mm',
								weekends : true,
								nowIndicator : true,
								dayPopoverFormat : 'MM/DD dddd',
								longPressDelay : 0,
								eventLongPressDelay : 0,
								selectLongPressDelay : 0
							});
		});
	</script>


</body>
</html>
