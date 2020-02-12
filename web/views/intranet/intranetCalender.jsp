<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../intranet/common/nav.jsp"%>
<%= request.getContextPath() %>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<link href='../../resources/js/fullcal/core/main.css' rel='stylesheet' />
<link href='../../resources/js/fullcal/daygrid/main.css'
	rel='stylesheet' />

<script src='../../resources/js/fullcal/core/main.js'></script>
<script src='../../resources/js/fullcal/daygrid/main.js'></script>
<script src="../../resources/js/fullcal/interaction/main.min.js"></script>
<script src='../../resources/js/fullcal/core/locales/ko.js'></script>
<script src="../../resources/js/fullcal/timegrid/main.min.js"></script>
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷</title>

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
		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">일정관리</h1>
		<div class="card shadow mb-4">

			<div class="card-body">
				<div id="calendar"></div>
				<div id="external-events">
					<p>
						<strong>휴가 관리</strong>
					</p>
					<div class="fc-event" id="event1">
						<%
							//로그인된 아이디
						%>휴가 신청
					</div>
					<div class="fc-event" id="event2">업무 관련 일정 등록</div>
					<div class="fc-event" id="event3">교육 관련 일정 등록</div>
					<div class="fc-event" id="event4">학급 관련 일정 등록</div>
					<p>
						<input type="checkbox" id="drop-remove" hidden="">
					</p>
				</div>
				<div id="external-events"></div>
			</div>
		</div>

		<div class="modal fade" id="insertEvent" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">일정 등록</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="CLose">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<form action="/semi/insertEvent.ev" method="post" role="form"
						class="form-horizontal">
						<div class="modal-body">
							<div class="form-group">
								<label for="eventTitle">제목</label> <input type="text"
									id="eventTitle" class="form-control">
							</div>
							<div class="form-group">
								<label for="eventContent">내용</label>
								<textarea class="form-control" id="eventContent" rows="3"></textarea>
							</div>
							<div class="form-group">
								<label>시작일</label> <input class="form-control" type="date"
									id="startDate">
							</div>
							<div class="form-group">
								<label>종료일</label> <input class="form-control" type="date"
									id="endDate">
							</div>
							<div class="form-group">
								<label>대상</label> <select class="form-control" id="eventType">
									<option>원내행사</option>
									<option>교사일정</option>
									<option>체험학습</option>
									<option>기타</option>
								</select>
							</div>
							<div class="form-group">
								<label>등록자</label>
								<input id="user" type="text" value="<%//아이디받아오셈%>" disabled="disabled" class="form-control">
							</div>
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" id="insertEvent1"
								value="등록">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var Calendar = FullCalendar.Calendar;
			var Draggable = FullCalendarInteraction.Draggable;

			var containerEl = document.getElementById('external-events');
			var calendarEl = document.getElementById('calendar');
			var checkbox = document.getElementById('drop-remove');

			new Draggable(containerEl, {
				itemSelector : '.fc-event',
				eventData : function(eventEl) {
					return {
						title : eventEl.innerText
					};
				}
			});

			var calendar = new Calendar(calendarEl, {
				plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				editable : true,
				droppable : true,
				drop : function(info) {

					if (checkbox.checked) {

						info.draggedEl.parentNode.removeChild(info.draggedEl);
					}
				},
				locale : 'ko',
				dateClick : function() {

				}
			});

			calendar.render();

			calendar.on('dateClick', function(info) {
				console.log('sibal' + info.dateStr);
				$('#insertEvent').modal('show');
				$('#startDate').attr('value', info.dateStr);
			});

		});
		
		
	</script>




	<%@ include file="../intranet/common/footer.jsp"%>
</body>
</html>