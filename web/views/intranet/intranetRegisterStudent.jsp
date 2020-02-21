<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../intranet/common/nav2.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷_메인</title>
<style type="text/css">
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	color: #fff;
	background-color: #4E73DF;
	border-color: #2e6da4;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
</head>
<body>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">원아 등록</h1>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">원아등록창</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form action="<%=request.getContextPath() %>/Cinsert.ch"
						name="registerTeacher" method="post" enctype="multipart/form-data">
						<table class="table table-bordered" id="dataTable" width="100%"
							table-layout="fixed;" word-break="break-all;" cellspacing="0">
							<tr>
								<th style="padding: 0.2rem">학번</th>
								<td style="padding: 0.2rem">&nbsp;<input type="text"
									id="stucode" disabled="disabled"></td>
							</tr>
							<tr>
								<th style="padding: 0.2rem">원아명</th>
								<td colspan="2" style="padding: 0.2rem"><input type="text"
									id="studentName" name="stuname"></td>
								<th style="padding: 0.2rem">성별</th>
								<td style="padding: 0.2rem">&nbsp; <input type="radio"
									id="studentGenderM" name="stugender" value="남"> <label
									for="studentGenderM" style="display: initial;">남</label> <input
									type="radio" id="studentGenderF" name="stugender" value="여">
									<label for="studentGenderF" style="display: initial;">여</label>
								</td>
								<th style="padding: 0.2rem">주민번호</th style="padding:0.2rem">
								<td style="padding: 0.2rem">&nbsp; <input type='text'
									id="stuno1" style="width: 45%;"> - <input type='text'
									id="stuno2" style="width: 45%;">
								</td>
								<td colspan="2" rowspan="4" style="width: 10%; height:70%">
									<div style="width: 100%; height: 100%">
										<img src="" class="" id="stuImg" alt=""
											style="width: 100%; height: auto;">
									</div>
								</td>
							</tr>
							<tr>
								<th style="padding: 0.2rem">생일</th>
								<td style="padding: 0.2rem" colspan="2">&nbsp;<input
									type="date" id="stubirth">

								</td>
								<th style="padding: 0.2rem">입학일</th>
								<td style="padding: 0.2rem">&nbsp;<input type="date"
									id="stuent"></td>
								<th style="padding: 0.2rem">졸업일</th>
								<td style="padding: 0.2rem">&nbsp;<input type="date"
									id="stugradu" disabled="disabled"></td>
							</tr>
							<tr>
								<th style="padding: 0.2rem" rowspan="2">주소</th>
								<td style="padding: 0.2rem" colspan="3"><input type="text"
									id="sample6_postcode" name="stuaddr1" placeholder="우편번호">
								</td>
								<td style="padding: 0.2rem"><input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
								<td style="padding: 0.2rem" colspan="2"><input type="text"
									id="sample6_address" placeholder="주소" name="stuaddr2">
								</td>
							</tr>
							<tr>
								<td style="padding: 0.2rem" colspan="6">&nbsp; <input
									type="text" id="sample6_detailAddress" placeholder="상세주소"
									name="stuaddr3" style="width: 85%"> <input type="text"
									id="sample6_extraAddress" placeholder="참고항목" style="width: 12%">
								</td>
							</tr>
							<tr>
								<th style="padding: 0.2rem">나이</th>
								<td style="padding: 0.2rem" colspan='2'>&nbsp;<input
									type="number" name="stuage"></td>

								<th style="padding: 0.2rem">상태</th>
								<td style="padding: 0.2rem">&nbsp; 
								<select name="stustate">
										<option id="studentStateA">재학</option>
										<option id="studentStateB">휴원</option>
										<option id="studentStateC">졸업</option>
								</select>
								</td>

								<th style="padding: 0.2rem">소속반</th>
								<td style="padding: 0.2rem">&nbsp; <input type="radio"
									id="studentClass1" name="stuclass" value="1반"> <label
									for="studentClass1" style="display: initial;">1반</label> <input
									type="radio" id="studentClass2" name="stuclass" value="2반">
									<label for="studentClass2" style="display: initial;">2반</label>
									<input type="radio" id="studentClass3" name="stuclass"
									value="3반"> <label for="studentClass3"
									style="display: initial;">3반</label> <input type="radio"
									id="studentClass4" name="stuclass" value="4반"> <label
									for="studentClass4" style="display: initial;">4반</label>
								</td>


								<td style="text-align: center; padding: 0.2rem">
									<div class="filebox ">
										<label for="ex_file">사진</label>
										<input type="file"
											id="ex_file" accept=".jpg,.jpeg,.png,.gif"
											onchange="imageURL(this)" name="stuimg">
									</div>
								</td>
								<td style="text-align: center; padding: 0.2rem">
									<div class="filebox">
										<button class="btn btn-primary btn-sm" onclick="deleteImg();"
											id="studentImgD">삭제</button>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="7"></td>
								<td colspan="2"
									style="border-right: none; border-left: none; border-bottom: none;">
									<div class="btn-group pull-right">
										<input class="btn btn-primary btn-sm" type="submit"
									value="아이 등록하기"> <input class="btn btn-primary btn-sm"
									type="reset" value="초기화">
									</div>
								</td>
							</tr>
						</table>
						</form>
					</div>
				</div>
			</div>

		</div>


		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">교사확인창</h6>
				<div class="btn-group pull-right">
					<button class="btn btn-primary btn-sm" id="stuedit">수정</button>
					<button class="btn btn-primary btn-sm" id="studel">삭제</button>
				</div>

			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table id="viewable" class="table table-striped">
						<tr>
							<th></th>
							<th>번호</th>
							<th>학번</th>
							<th>원아명</th>
							<th>성별</th>
							<th>생일</th>
							<th>입학일</th>
							<th>소속반</th>
							<th>상태</th>
							<th>학부모번호</th>
						</tr>

					</table>
				</div>
			</div>

		</div>



		<!-- /.container-fluid -->
		<div class="modal fade"  role="dialog" id="editstu">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4>아이정보수정</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="CLose">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					
					<div class="modal-body">
					<form>
						<div class="form-group">
							<label>아이코드</label> <input type="text" id="editcode"
								disabled="disabled">
						</div>
						<div class="form-group">
							<label>이름</label> <input type="text" id="editname"
								disabled="disabled">
						</div>
						<div class="form-group">
							<label for="editstate">재학여부</label>
							<select id="editstate" name="editstate">
										<option id="studentStateA">재학</option>
										<option id="studentStateB">휴원</option>
										<option id="studentStateC">졸업</option>
							</select>
						</div>
						<div class="form-group">
							<label for="sample7_postcode">우편번호</label> <input type="text"
								id="sample7_postcode" name="editaddr1" placeholder="우편번호"
								style="width: 60%" disabled="disabled"> <input
								type="button" onclick="sample7_execDaumPostcode()"
								value="우편번호 찾기">
						</div>
						<div class="form-group">
							<label for="sample7_address">주소</label> <input type="text"
								id="sample7_address" placeholder="주소" name="editaddr2" disabled="disabled">
								<input type="text"
									id="sample7_detailAddress" placeholder="상세주소"
									style="width: 70%" name="empAddr3">
							<input type="text" id="sample7_extraAddress" placeholder="참고항목"
								style="width: 20%" disabled="disabled">
						</div>
						<div class="form-group">
							<label for="editgradu">졸업일</label> 
							<input type="date" id="editentdate" name="editstate">
						</div>
						</form>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="sendedit">저장</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- End of Main Content -->
	
	<script>
		//직원정보 테이블로 불러오는 ajax
		$(function() {
			$.ajax({
				url : "/semi/stuCall.do",
				type : "get",
				success : function(data) {
					$.each(data, function(index, value) {
									
						var $tr = $('<tr>');
						var $chk = $('<input>').attr({'type':'radio','class':'chkstu','value':value.cCode+','+value.name});
						var $checkbox = $('<td>');
						var $stuindex = $('<td>').text(index + 1);
						var $cCode = $('<td>').text(value.cCode);
						var $name = $('<td>').text(value.name);
						var $gender = $('<td>').text(value.gender);
						var $birth = $('<td>').text(value.birth);
						var $entdate = $('<td>').text(value.entdate);
						var $stuclass = $('<td>').text(value.stuclass);
						var $state = $('<td>').text(value.state);
						var $parentCode = $('<td>').text(value.parentCode);

						$checkbox.append($chk);
						$tr.append($checkbox);
						$tr.append($stuindex);
						$tr.append($cCode);
						$tr.append($name);
						$tr.append($gender);
						$tr.append($birth);
						$tr.append($entdate);
						$tr.append($stuclass);
						$tr.append($state);
						$tr.append($parentCode);
						
						$('#viewable').append($tr);
					});
				},
				error : function() {
					console.log("에러입니다.");
				}
			});
		});
		var editmodal = $('#editstu')
		$('#stuedit').click(function() {
			var eid = $('.chkstu:checked').val();
			var ecn = eid.split(',');
			if (eid != null) {
				editmodal.modal();
				$('#stucode').val(ecn[0]);
				$('#stutname').val(ecn[1]);
			}
		});
		
		$('#sendedit').click(function(){
			if($('#sample7_postcode').val()==null){
				alert('빈 항목이 있습니다!');
			}else{
				$.ajax({
					url : '/semi/editstu.do',
					type : 'get',
					data : {
						editcode : $('#editcode').val(),
						editstate : $('#editstate').val(),
						editaddr : $('#sample7_postcode').val()+$('#sample7_address').val()+$('#sample7_detailAddress').val(),
						editgradu : $('#editgraduate').val()
					},
					success : function(data){
						if(data>0){alert('수정 성공!'),location.reload();}
						else{alert('빈 항목이 있습니다!')}
					},error : function(){
						alert('수정 오류!');
					}
				});
			}
			
			
		});
		$('#empdel').click(function(){
			var eid = $('.chkemp:checked').val();
			var ecn = eid.split(',');
			$.ajax({
				url : '/semi/delStu.do',
				type : 'get',
				data : {
					delid : ecn[0]
				},success : function(data){
					alert('삭제되었습니다.');
					location.reload();
				},error : function(){
					alert('삭제실패!');
				}
			})
		})
		
	</script>
	<script>
		function imageURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#stuImg').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
		function deleteImg() {
			$('#empImg').attr('src', '기본이미지');
		}
	</script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
	<script>
    function sample7_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample7_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample7_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample7_postcode').value = data.zonecode;
                document.getElementById("sample7_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample7_detailAddress").focus();
            }
        }).open();
    }
</script>
	<%@ include file="../intranet/common/footer.jsp"%>
</body>
</html>



























