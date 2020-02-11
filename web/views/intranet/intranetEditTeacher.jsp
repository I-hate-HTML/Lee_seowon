<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
  
  <!-- Custom fonts for this template-->
  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/all.min.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/css.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/1_content.css" rel="stylesheet" type="text/css">
   <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/sb-admin-2.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  
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

.filebox input[type="file"] { /* ���� �ʵ� ����� */
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
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">���� ����</h1>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">������������</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form action="" method="empEdit.em" name="editTeacher">
						<table class="table table-bordered" id="editTable" width="100%"
							table-layout="fixed;" word-break="break-all;" cellspacing="0">
							<tr>
								<th style="padding: 0.2rem">�̸�</th>
								<td style="padding: 0.2rem"><input type="text" id="editName"
									name="editName" disabled="disabled"></td>
								<th style="padding: 0.2rem">����</th>
								<td style="padding: 0.2rem"><select id="editGrade"
									name="editJob">
										<option id="teacherGrade" name="editJob" value='1'>����</option>
										<option id="teacherGrade" name="editJob" value='2'>�ο���</option>
										<option id="teacherGrade" name="editJob" value='3'>����</option>
										<option id="teacherGrade" name="editJob" value='4'>�����</option>
										<option id="teacherGrade" name="editJob" value='5'>�����</option>
								</select></td>
								<th style="padding: 0.2rem">�����ڵ�</th>
								<td style="padding: 0.2rem"><input type="text"
									id="editNo" name="editNo" disabled="disabled">
								</td>
								<td  colspan="2" rowspan="5" style="width: 10%; height: 70%;">
								<div style="width: 100%; height: 100%">
									<img src="" class="" id="editImg" alt="" style="width: 100%; height: auto;">
								</div>
								</td>
							</tr>
							<tr>
								<th style="padding: 0.2rem">�ֹι�ȣ</th>
								<td style="padding: 0.2rem"><input type="text" id="editNo1"
									name="editNo1" style="width: 46%;" disabled="disabled"> - <input type="text"
									id="editNo2" name="editNo2" style="width: 46%;" disabled="disabled"></td>
								<th style="padding: 0.2rem">����ó</th>
								<td style="padding: 0.2rem"><input type="text"
									id="editPhone" name="editPhone"></td>
								<th style="padding: 0.2rem">�̸���</th>
								<td style="padding: 0.2rem"><input type="text"
									id="editEmail" name="editEmail"></td>
							</tr>
							<tr>
								<th style="padding: 0.2rem" rowspan="2">�ּ�</th>
								<td style="padding: 0.2rem"><input type="text"
									id="empAddr1" name="editAddr1" disabled="disabled"
									style="width: 50%;"> &nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-sm btn-primary ">�����ȣ</button>
								</td>

								<td style="padding: 0.2rem" colspan="4"><input type="text"
									id="editAddr2" name="editAddr2" disabled="disabled"></td>
							</tr>
							<tr>
								<td style="padding: 0.2rem" colspan="5"><input type="text"
									id="editAddr3" name="editAddr3" style="width: 99%;"></td>
							</tr>
							<tr>
								<th style="padding: 0.2rem">�Ի���</th>
								<td style="padding: 0.2rem"><input type="date"
									id="edithireDate" name="edithireDate" disabled="disabled"></td>
								<th style="padding: 0.2rem">�����</th>
								<td style="padding: 0.2rem"><input type="date" id="editentDate"
									name="editentDate"></td>
								<th style="padding: 0.2rem">����</th>
								<td style="padding: 0.2rem"><select id="editEntYN"
									name="editEntYN">
										<option id="editEntY" name="editEntY">����</option>
										<option id="editEntN" name="editEntN">����</option>
								</select></td>
							</tr>
							<tr>
								<th style="padding: 0.2rem">���ӹ�</th>
								<td style="padding: 0.2rem"><input type="radio"
									id="editClass1" name="editClass" value="1"> <label
									for="editClass1" style="display: initial;">1��</label> <input
									type="radio" id="editClass2" name="editClass" value="2">
									<label for="editClass2" style="display: initial;">2��</label> <input
									type="radio" id="editClass3" name="editClass" value="3">
									<label for="editClass3" style="display: initial;">3��</label> <input
									type="radio" id="editClass4" name="editClass" value="4">
									<label for="editClass4" style="display: initial;">4��</label></td>
								<th style="padding: 0.2rem">ȣ��</th>
								<td style="padding: 0.2rem" colspan='3'><input
									type="number" id="editHobong" name="editHobong" min="1"
									max="29" disabled="disabled"> ȣ��</td>
								<td style="text-align: center; padding: 0.2rem">
									<div class="filebox ">
										<label for="edit_file">����</label> <input type="file"
											id="edit_file" accept=".jpg,.jpeg,.png,.gif"
											onchange="imageURL(this)"">
									</div>
								</td>
								<td style="text-align: center; padding: 0.2rem">
									<button class="btn btn-primary btn-sm" onclick="deleteImg();"
										id="editImgDel">����</button>
								</td>
							</tr>
							<tr>
								<td colspan="2"
									style="border-right: none; border-left: none; border-bottom: none;"></td>
								<td colspan="6"
									style="border-right: none; border-left: none; border-bottom: none;">
									<input class="btn btn-primary btn-sm" type="submit"
									value="���� ����ϱ�"> <input class="btn btn-primary btn-sm"
									type="reset" value="�ʱ�ȭ">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>

		</div>
	</div>
	
	
	<script>
		function imageURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#empImg').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
		function deleteImg(){
			$('#empImg').attr('src', '�⺻�̹���');
		}
	</script>
</body>
</html>