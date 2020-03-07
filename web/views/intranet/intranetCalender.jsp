<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ include file="../intranet/common/nav.jsp"%>
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 
%>
<%@ page import="semi.home.jsp.model.vo.*"%>

<%
 Member mem = (Member)session.getAttribute("member"); 
 request.setAttribute("member", mem);
%>

<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷</title>


</head>
<body>
	<!-- Begin Page Content -->
	<div class="container">
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-4 text-gray-800">일정관리</h1>
			<div class="card shadow mb-4">

				<div class="card-body">
					<div id="calendar"></div>
				</div>
			</div>

			<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 id="evetitle"></h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="CLose">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-allDay">하루종일</label> <input
										class='allDayNewEvent' id="edit-allDay" type="checkbox">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-title">일정명</label> <input
										class="form-control" type="text" name="edit-title"
										id="edit-title" required="required" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-start">시작</label> <input
										class="form-control" type="text" name="edit-start"
										id="edit-start" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-end">끝</label> <input
										class="form-control" type="text" name="edit-end" id="edit-end" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-type">구분</label> <select
										class="form-control" type="text" name="edit-type"
										id="edit-type">
										<option value="원내행사">원내행사</option>
										<option value="교사일정">교사일정</option>
										<option value="체험학습">체험학습</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-color">색상</label> <select
										class="form-control" name="color" id="edit-color">
										<option value="#D25565" style="color: #D25565;">빨간색</option>
										<option value="#9775fa" style="color: #9775fa;">보라색</option>
										<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
										<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
										<option value="#f06595" style="color: #f06595;">핑크색</option>
										<option value="#63e6be" style="color: #63e6be;">연두색</option>
										<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
										<option value="#4d638c" style="color: #4d638c;">남색</option>
										<option value="#495057" style="color: #495057;">검정색</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-99">
									<label class="col-xs-98" for="edit-desc">설명</label>
									<textarea rows="4" cols="50" class="form-control"
										name="edit-desc" id="edit-desc"></textarea>
								</div>
							</div>
						</div>
						<div class="ContaineraddEvent">
						<div class="modal-footer">
							
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" id="save-event">저장</button>
							</div>
						</div>
						<div class="ContainermodifyEvent">
						<div class="modal-footer">
							
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
								<button type="button" class="btn btn-primary" id="editEvent111">저장</button>
							</div>
						</div>

					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<div id="contextMenu" class="dropdown clearfix">
				<ul class="dropdown-menu dropNewEvent" role="menu"
					aria-labelledby="dropdownMenu"
					style="display: block; position: static; margin-bottom: 5px;">
					<li><a tabindex="-1" href="#">원내행사</a></li>
					<li><a tabindex="-1" href="#">교사일정</a></li>
					<li><a tabindex="-1" href="#">체험학습</a></li>
					<li><a tabindex="-1" href="#">기타</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
				</ul>
			</div>
			<div class="card shadow mb-3">
				<div class="card-body">
					<div class="panel panel-default">

						<div class="panel-heading">
							<h3 class="panel-title">필터</h3>
						</div>

						<div class="panel-body">

							<div class="col-lg-99">
								<label for="calendar_view">구분별</label>
								<div class="input-group">
									<select class="filter" id="type_filter" multiple="multiple"
										style="width: 38rem">
										<option value="원내행사">원내행사</option>
										<option value="교사일정">교사일정</option>
										<option value="체험학습">체험학습</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>

							<div class="col-lg-99">
								<label for="calendar_view">등록자별</label>
								<div class="input-group">
									<label class="checkbox-inline"><input class='filter'
										type="checkbox" value="원장" checked>원장</label> <label
										class="checkbox-inline"><input class='filter'
										type="checkbox" value="부원장" checked>부원장</label> <label
										class="checkbox-inline"><input class='filter'
										type="checkbox" value="교사" checked>교사</label> <label
										class="checkbox-inline"><input class='filter'
										type="checkbox" value="영양사" checked>영양사</label> <label
										class="checkbox-inline"><input class='filter'
										type="checkbox" value="계약직" checked>계약직</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var username = '<%= mem.get()%>';
		$(function(){
			console.log(username);
		})
	</script>

	<script src="../../resources/js/fullcal/vendor/js/bootstrap.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/moment.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/fullcalendar.min.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/ko.js"></script>
	<script src="../../resources/js/fullcal/vendor/js/select2.min.js"></script>
	<script
		src="../../resources/js/fullcal/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="../../resources/js/fullcal/js/main.js"></script>
	<script src="../../resources/js/fullcal/js/addEvent.js"></script>
	<script src="../../resources/js/fullcal/js/editEvent.js"></script>
	<script src="../../resources/js/fullcal/js/etcSetting.js"></script>
</body>
</html>













