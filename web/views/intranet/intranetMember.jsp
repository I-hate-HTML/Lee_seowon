<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, semi.home.jsp.model.vo.*"%>

<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("Member");
%>

<%@ include file="../intranet/common/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷_메인</title>
<style type="text/css">
/* 검정 줄 긋기 있어도 그만 없어도 그만 */
.section_top .h_cont {
    height: 31px;
    border-bottom: 3px solid #565b62
}

/* 지긋지긋했던 맨밑줄 */
.board_area {
	position: relative;
	width: 100%;
	border-bottom: 1px solid #c6c6c6
}

/* Common */
/* html, */ /* body, */
h2, /*늘어남*/ table, th, td, /* 없애도 됨 */
	/* form, */ input, /* 체크박스 작게함 */ button /* 눈여겨 볼 것 */ {
	margin: 0;
	padding: 0
}

/* 필수 */
body, input, textarea, select, button, table {
	font-family: '돋움', Dotum, Helvetica, sans-serif;
	font-size: 14px
}

/* 필수 */
table, th, td {
	border: 0 none
}

/* 필수 */
.tc {
	text-align: center
}

/* Table List Style */
/* 필수 */
.tbl_lst_type {
	width: 920px;
	font-size: 12px;
	line-height: 16px;
	table-layout: fixed;
}

/* 필수 색 입히기 */
.tbl_lst_type th {
	height: 27px;
	line-height: 29px;
	background: url(https://cafe.pstatic.net/img/manage/bg_tbl_h.gif)
		no-repeat -3px 0;
	font-weight: normal;
	color: #666
}

/* head 굵게하기 */
.tbl_lst_type th strong {
	display: block;
	font-weight: normal;
	height: 28px;
	padding-top: 1px
}

/* hover색변하는 거 짱 중요 */
.tbl_lst_type tbody tr:hover {
	background: #f9fafb
}

/* 칸과 칸 사이 줄 */
.tbl_lst_type td {
	border-bottom: 1.5px solid #eaeaea;
	color: #949494;
}

/* 칸 여유 생김 */
.tbl_lst_type td .txt, .tbl_lst_type td .num {
	display: inline-block;
	padding-top: 3px
}

/* Contents */
/* 없으면 이상해짐 필수 */
.board_action {
	position: relative;
	width: 100%;
	padding: 7px 0 8px
}

/* 없으면 목짧아짐 */
.board_action:after {
	display: block;
	clear: both;
	content: ''
}

/* 체크박스 위치조정 진짜 */
input.check {
	width: 13px;
	height: 13px;
	vertical-align: middle;
	_margin-top: 0 !important
}
</style>
</head>
<body>
	<!-- Begin Page Content -->

	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">회원 관리</h1>

		<br> <br>

		<div class="card shadow mb-4">
			<div class="card-header py-3">

				<!-- 20200209 new content -->
				<div id="content">
					<div class="section_top">
					</div> 
					<div class="section_cont">
						<div class="board_area">
							<form id="joinapplication" method="post" overflow-x style="overflow: auto;">
								<input type="hidden" name="clubid" value="30000177"> <input
									type="hidden" name="page" value="1"> <input
									type="hidden" name="perPage" value="30">

								<div class="board_action">
									<div class="action_in">
										선택 회원을&nbsp;
										<button class="btn btn-primary btn-sm" onclick="agreeMem();"
											id="memberaccept">가입승인</button>
										<button class="btn btn-primary btn-sm" onclick="denyMem();"
											id="membernonono">가입거절</button>
									</div>
								</div>
								<table border="1" cellspacing="0" class="tbl_lst_type" style="width:100%;">

									<colgroup>
										<col width="50">
										<!-- 체크박스 -->
					<col width="100">
					<!-- 아이디 -->
					<col width="80">
					<!-- 회원이름 -->
					<col width="40">
					<!-- 성별 -->
					<col width="140">
					<!-- 이메일 -->
					<col width="125">
					<!-- 전화번호 -->
					<col width="300">
					<!-- 주소 -->
					<col width="100">
					<!-- 등록일 -->
					<col width="80">
					<!-- 자녀 번호 -->
					<col width="80">
					<!-- 자녀 이름 -->
					<col width="100">
					<!-- 자녀 생일 -->
					<col width="80">
					<!-- 자녀 성별 -->
					<col width="80">
					<!-- 자녀 반 -->
					<col width="80">
					<!-- 승인 상태 -->
					</colgroup>

					<thead style="text-align: center;">
						<tr>

							<th scope="col" class="frst"><input type="checkbox"
								id="chkalltop" title="선택"
								class="check _click(ManageJoinApplication|AllJoinMember)"
								onclick="checkAll()"></th>
							<!-- 12개 -->
							<th scope="col"><strong class="line_r">아이디</strong></th>
							<th scope="col"><strong class="line_r">회원이름</strong></th>
							<th scope="col"><strong class="line_r">성별</strong></th>
							<th scope="col"><strong class="line_r">이메일</strong></th>
							<th scope="col"><strong class="line_r">전화번호</strong></th>
							<th scope="col"><strong class="line_r">주소</strong></th>
							<th scope="col"><strong class="line_r">등록일</strong></th>
							<th scope="col"><strong class="line_r">자녀 번호</strong></th>
							<th scope="col"><strong class="line_r">자녀 이름</strong></th>
							<th scope="col"><strong class="line_r">자녀 생일</strong></th>
							<th scope="col"><strong class="line_r">자녀 성별</strong></th>
							<th scope="col"><strong class="line_r">자녀 반</strong></th>
							<th scope="col"><strong class="line_r">승인 상태</strong></th>

						</tr>
					</thead>

					<tbody id="applymemberList" class="tc">
						<%
											for (Member m : list) {
										%>
						<tr id="member1">
							<td class="tc"><input type="checkbox"
								name="applyMemberCheck" value="" id="c1" title="선택"
								class="check _click"></td>
							<td class="tc"><span class="img"><%=m.getUserId()%></span></td>
							<td class="tc"><span class="txt"><%=m.getUserName()%></span>
							</td>
							<td class="tc"><span class="txt"><%=m.getGender()%></span></td>
							<td class="tc"><span class="num"><%=m.getEmail()%></span></td>
							<td class="tc"><span class="num"><%=m.getPhone()%></span></td>
							<td class="tc"><span class="num"><%=m.getAddress()%></span>
							</td>
							<td class="tc"><span class="num"><%=m.getEnrolldate()%></span>
							</td>
							<td class="tc"><span class="num"><%=m.getCno()%></span></td>
							<td class="tc"><span class="num"><%=m.getCname()%></span></td>
							<td class="tc"><span class="num"><%=m.getCbdate()%></span></td>
							<td class="tc"><span class="num"><%=m.getCgender()%></span>
							</td>
							<td class="tc"><span class="num"><%=m.getCclass()%></span></td>
							<td class="tc"><span class="num"><%=m.getMstatus()%></span></td>
						</tr>


						<%
											}
										%>

					</tbody>
					</table>

					</form>
				</div>
			</div>
		</div>
		<!-- //20200209 new content -->

	</div>
	<!-- /.container-fluid -->
	</div>
	</div>
	
	<script>
		function checkAll(){
			if($("#chkalltop").is(':checked')){
				$("input[name=applyMemberCheck]").prop("checked", true);
			}else{
				$("input[name=applyMemberCheck]").prop("checked", false);
			}
		}
		
		function 
	</script>
	<!-- End of Main Content -->
	<%@ include file="../intranet/common/footer.jsp"%>
</body>
</html>