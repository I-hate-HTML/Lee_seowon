<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../intranet/common/nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿈나라어린이집 # 인트라넷_메인</title>
</head>
<body>
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">교사 등록</h1>

          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">교사등록창</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <form action="" method="empInsert.em" name = "registerTeacher">
                    <table class="table table-bordered" id="dataTable" width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
                      <tr>
                        <th style="padding:0.2rem">이름</th>
                        <td style="padding:0.2rem">
                          <input type = "text" id = "empName"name = "empName">
                        </td>
                        <th style="padding:0.2rem">직급</th>
                        <td style="padding:0.2rem">
                          <select id="teacherGrade" name = "empJob">
                            <option id="teacherGrade" name = "empJob" value='1'>원장</option> 
                            <option id="teacherGrade" name = "empJob" value='2'>부원장</option> 
                            <option id="teacherGrade" name = "empJob" value='3'>교사</option> 
                            <option id="teacherGrade" name = "empJob" value='4'>영양사</option> 
                            <option id="teacherGrade" name = "empJob" value='5'>계약직</option> 
                          </select>                  
                        </td>
                        <th style="padding:0.2rem">직원코드</th>
                        <td style="padding:0.2rem">
                          <input type = "text" id = "teacherNum" name= "teacherNum" disabled="disabled">
                        </td>
                        <td style="padding:0.2rem" colspan="2" rowspan = "5">
                          <span class = "fa fa-smile fa-5x" id="empImage" style = "padding: 22%; padding-left: 29%;">
                          </span>
                        </td>
                      </tr>
                      <tr>
                        <th style="padding:0.2rem">주민번호</th>
                        <td style="padding:0.2rem">
                          <input type="text" id = "empNo1" name = "empNo1" style="width: 46%;"> -
                          <input type="text" id = "empNo2" name = "empNo2" style="width: 46%;">
                        </td>
                        <th style="padding:0.2rem">연락처</th>
                        <td style="padding:0.2rem">
                          <input type="text" id="empPhone" name = "empPhone">
                        </td>
                        <th style="padding:0.2rem">이메일</th>
                        <td style="padding:0.2rem">
                          <input type = "text" id = "empEmail" name="empEmail">
                        </td>
                      </tr>
                      <tr>
                        <th style="padding:0.2rem" rowspan="2">주소</th>
                        <td style="padding:0.2rem">
                          <input type="text" id="empAddr1" name = "empAddr1" disabled="disabled" style="width: 50%;">
                          &nbsp;&nbsp;&nbsp;&nbsp;
                          <button type = "button" class = "btn btn-sm btn-primary ">우편번호</button>
                        </td>
                       
                        <td style="padding:0.2rem" colspan="4">
                          <input type = "text" id = "empAddr2" name = "empAddr2" disabled="disabled">
                        </td>
                      </tr>
                      <tr>
                        <td style="padding:0.2rem" colspan="5">
                          <input type = "text" id = "empAddr3" name = "empAddr3" style="width: 99%;">
                        </td>
                      </tr>
                      <tr>
                        <th style="padding:0.2rem">입사일</th>
                        <td style="padding:0.2rem">
                          <input type="date" id = "hireDate" name = "hireDate">
                        </td>
                        <th style="padding:0.2rem"> 퇴사일</th>
                        <td style="padding:0.2rem">
                          <input type = "date" id = "entDate" name = "entDate">
                        </td>
                        <th style="padding:0.2rem">상태</th>
                        <td style="padding:0.2rem">
                          <select id="teacherState" name = "teacherState">
                            <option id="teacherStateY" name = "teacherStateY">재직</option> 
                            <option id="teacherStateN" name = "teacherStateN">휴직</option> 
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <th style="padding:0.2rem">담임반</th>
                        <td style="padding:0.2rem">
                          <input type = "radio" id = "empClass1" name = "empClass" value="1">
                          <label for = "empClass" style="display: initial;">1반</label>
                          <input type = "radio" id = "empClass2" name = "empClass" value="2">
                          <label for = "empClass" style="display: initial;">2반</label>
                          <input type = "radio" id = "empClass3" name = "empClass" value="3">
                          <label for = "empClass" style="display: initial;">3반</label>
                          <input type = "radio" id = "empClass4" name = "empClass" value="4">
                          <label for = "empClass" style="display: initial;">4반</label>
                        </td>
                        <th style="padding:0.2rem">호봉</th>
                        <td style="padding:0.2rem" colspan = '3'>
                          <input type = "number" id = "teacherSalary" name = "teacherSalary" min="1" max="29" disabled="disabled"> 호봉
                        </td>
                        <td style="text-align: center; padding:0.2rem">
                          <button class="btn btn-primary btn-sm" onclick="updateImg();" id = "studentImgU">사진</button>
                        </td>
                        <td style="text-align: center; padding:0.2rem">
                          <button class="btn btn-primary btn-sm" onclick="deleteImg();" id = "studentImgD">삭제</button>
                        </td>
                      </tr>
                      <tr>
                     	<td colspan="8" style="padding:0.2rem">
                     		<input type="submit" value="교사 등록하기">
                     		<input type="reset" value="초기화">
                     	</td>
                      </tr>
                    </table>
                  </form>
              </div>
            </div>
            
          </div>         
          

        <div class="card shadow mb-4">
            <div class="card-header py-3"> 
              <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
                <tr>
                  <td>
                    <h6 class="m-0 font-weight-bold text-primary" style="width: 100px">교사확인창</h6>
                  </td>
                  <td align="right">
                    <button class = "btn btn-primary btn-sm" onclick="studentModify();">수정</button>
                    <button class = "btn btn-primary btn-sm" onclick="studentDelete();">삭제</button>
                    <button class = "btn btn-primary btn-sm" onclick="studentCancel();">취소</button>          
                  </td>
                </tr>
              </table>
            </div>
            <div class="card-body">
              <div class="table-responsive"> 
                <table id = "viewable" class="table table-striped">
                  <tr>
                    <th></th>
                    <th>번호</th>
                    <th>직원코드</th>
                    <th>직급</th>
                    <th>성명</th>
                    <th>연락처</th>
                    <th>입사일</th>
                    <th>퇴사일</th>
                    <th>담임반</th>
                    <th>호봉</th>
                    <th>상태</th>                
                  </tr>
                </table>                 
              </div>
          </div>

        </div>

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
	<%@ include file = "../intranet/common/footer.jsp" %>
	
	<!-- 직원정보 테이블로 불러오는 ajax -->
	<script>
	//직원정보 테이블로 불러오는 ajax
		$(function(){
			$.ajax({
				url : "/ajax/empCall.do",
				type :"get",
				success:function(data){
					$.each(data,function(index,value){
   						var $tr = $('<tr>');
   						var $empIndex = $('<td>').text(index+1);
   						var $empCode = $('<td>').text(value.empCode);
   						var $empJob = $('<td>').text(value.empJob);
   						var $empName = $('<td>').text(value.empName);
   						var $empPhone = $('<td>').text(value.empPhone);
   						var $hireDate = $('<td>').text(value.hireDate);
   						var $entDate = $('<td>').text(value.entDate);
   						var $empClass = $('<td>').text(value.empClass);
   						var $hobong = $('<td>').text(value.hobong);
   						
   						// 숫자로 받아오기 때문에 서블릿에서 변환과정이 필요함
   						var $entYN = $('<td>').text(value.entYN);
   						
   						
   						$tr.append($empIndex);
   						$tr.append($empCode);
   						$tr.append($empJob);
   						$tr.append($empName);
   						$tr.append($empPhone);
   						$tr.append($hireDate);
   						$tr.append($entDate);
   						$tr.append($empClass);
   						$tr.append($hobong);
   						
   						$('#viewable').append($tr);
   					});
   				},error:function(){
   					console.log("에러입니다.");
   				}
			});
		});
	</script>
	
	<script type="text/javascript"></script>
	
	
	

</body>
</html>