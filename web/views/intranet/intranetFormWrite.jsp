<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%@ page import="semi.intranet.form.model.vo.SignList, java.util.ArrayList, semi.intranet.form.model.vo.Form" %>
<%@ page import="java.util.ArrayList, semi.intranet.form.model.vo.Form" %>

<%

	ArrayList<SignList> list = (ArrayList<SignList>)request.getAttribute("sign");

%>

<!-- Begin Page Content -->

<form action="<%=request.getContextPath() %>/fWrite.fo" method="post" name = "formWrite" enctype="multipart/form-data">
<div class="card shadow mb-4">
  <div class="card-header py-3"> 
    <table style="min-width:0px" table-layout="fixed;" word-break="break-all;" cellspacing="0">
      <tr>
        <td>
          <h6 class="m-0 font-weight-bold text-primary" style="width: 100px">품의결재창</h6>
    </td>
    <td align="right">
      <button class = "btn btn-primary btn-sm" id="submitBtn">등록</button>
      <button type="reset" class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fList.fo'">취소</button>    
              
    </td>
  </tr>
</table>
<div class="card-body">
  <div class="table-responsive">  	
      <table style="min-width:0px" class="table table-bordered" id="dataTable" width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
        <tr>
          <th>품의번호</th>
          <td>
            <input type = "text" style="padding-left: 0.2rem;"name="formNum" value = "자동 입력" disabled>
          </td>
          <th>기안날짜</th>
          <td><input type = "date" name="formDate"></td>
          </tr>
          <tr>
          <th>분류</th>
          <td>
            <select id = "formCategory" name="formCategory" onchange="contentChange();">
              <option value = "">선택</option>
              <option value = "1">지출결의서</option>
              <option value = "2">휴가신청서</option>
              <option value = "3">교구신청서</option>
              <option value = "4">기타</option>
            </select>
          </td> 
          <th>기안자</th>
          <td>
            <input type = "text" name="formName" value = "차은우" disabled>
            <input type ="hidden" name = "writerId" value="2015001">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td colspan="7">
            <input type="text" name = "formTitle" style = "width: 99%;">
          </td>
        </tr>
        <tr>  
          <th rowspan="2">결재자</th>
          <td style="text-align: center;">
			<div class="form_list">
			<select id="signList" name="signList1" size="10"style="width:100%" multiple>
			</select>
		  </div>
		  </td>
		  <td style="border-left:hidden; border-right:hidden;">
			<div class="center_btn">
				<input type="button" class="btn btn-primary btn-sm btn-block" id="btn_setListAll"  value="전체추가" />
				<input type="button" class="btn btn-primary btn-sm btn-block" id="btn_setList"  value="추가" />
				<input type="button" class="btn btn-primary btn-sm btn-block" id="btn_resetList" value="삭제" />
				<input type="button" class="btn btn-primary btn-sm btn-block" id="btn_resetListAll" value="전체삭제" />
			</div>
		</td>
		<td>
			<div class="rank_list">
				<select id="signListSelect" name="signListSelect1" size="10" style="width:100%" multiple>
				<input type="hidden" id="selectSign" name = "signList_fin" value="">
				</select>
			</div>
		</td>
          </tr>
          <tr>
          <td style="text-align: center; border-top:hidden;"colspan="3">
            <input type ="button" class="btn btn-primary btn-sm" id="saveSign" value="결재자 저장">
            <input type ="button" class="btn btn-primary btn-sm cancleSign" value="결재자 취소">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td colspan="7">
            <textarea id = "formContent" name = "formContent" style="width: 99%;" rows="10"></textarea>
              </td>
            </tr>
            <tr>
              <th>첨부파일</th>
              <td colspan="7">
                <input type = "file" name="formFile">
              </td>
            </tr>                
          </table>
        </form>
      </div>
  </div>          
</div>
</div>
  <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<script>
// 품의 쓰기창 품의서 분류에 맞는 내용 채워넣는 스크립트
   function contentChange(){
    var option = document.getElementById("formCategory");
    var content = document.getElementById("formContent");
	
    console.log(option);

    if(option.value == '1') {
        content.value = '';
        content.value += '지출결의서\n\n\n';
        content.value += '내역 :    외 \n\n';
        content.value += '합계 금액 :    원\n\n\n';
        content.value += '위 금액을 청구하오니 결재 바랍니다.\n\n';
        content.value += '** 지출결의서 파일을 첨부해주세요 ';
    }else if(option.value == '2') {
        content.value = '';
        content.value += '휴가신청서\n\n\n';
        content.value += '휴가 기간 :  년  월  일  ~   년  월  일  총  일 \n\n';
        content.value += '휴가 사유 :  \n\n\n';
        content.value += '위와 같이 휴가를 신청하오니 결재 바랍니다.\n\n';
        content.value += '** 휴가신청서 파일을 첨부해주세요 ';
    }else if(option.value == '3') {
        content.value = '';
        content.value += '교구신청서\n\n\n';
        content.value += '품목 :    외   개 \n\n';
        content.value += '금액 :    원 \n\n\n';
        content.value += '위와 같이 교재 교구의 구입을 신청하오니 결재 바랍니다.\n\n';
        content.value += '** 교구신청서 파일을 첨부해주세요 ';

    }else if(option.value == '4') {
        content.value = '';
        content.value += '품의서\n\n\n';
        content.value += '내용 :  \n\n\n';
        content.value += '위와 같은 사유로 품의서를 제출하오니 결재 바랍니다.\n\n';
        content.value += '** 품의서 파일을 첨부해주세요 ';
    }
 }


// 품의 쓰기창 결재자 리스트 가져오는 ajax
$(function(){
	
	 $.ajax({
 		url:"/semi/fSignList.fo",
 		type:"post",
 		success:function(data){
 			
 			var $select = $('#signList');
 			
 			$select.find('option').remove();
 			
 			for(var i=0; i<data.length; i++) {
 				var $option = $('<option>');
 				
 				$option.val(data[i].scode);
 				$option.text(data[i].scode + "\t" + data[i].position + "\t" + data[i].sname);
 				
 				$select.append($option);
 				
 			}
 		}, error:function(){
 			console.log("에러");
 		}
 	});
	
});

// 결재자 추가 삭제 버튼
$(function() {
	$("#btn_setListAll").click(function() {
		JSopt.doOpt("addall");
	});
	$("#btn_setList").click(function() {
		JSopt.doOpt("add");
	});
	$("#btn_resetList").click(function() {
		JSopt.doOpt("back");
	});
	$("#btn_resetListAll").click(function() {
		JSopt.doOpt("backall");
	});
});

var JSopt  =  {
		doOpt : function(_mode) {
			/* Option 추가 실행 */
			if(_mode == 'add') {
				$("#signList").find("option").each(function() {
					if(this.selected){
						$("#signListSelect").append("<option value='" + this.value +"' selected>" + this.text +"</option>");
						$(this).remove();
					}
				});
			}  else if (_mode == "addall") {
				$("#signList").find("option").each(function() {
					$("#signListSelect").append("<option value='" + this.value +"' selected>" + this.text +"</option>");
					$("#signList").empty();
				});
			} else if (_mode == "backall") {
				$("#signListSelect").find("option").each(function() {
					$("#signList").append("<option value='" + this.value +"'>" + this.text +"</option>");
					$("#signListSelect").empty();
				});
			}else if (_mode == "back") {
				$("#signListSelect").find("option").each(function() {
					if(this.selected){
						$("#signList").append("<option value='" + this.value +"'>" + this.text +"</option>");
						$(this).remove();
					} else {
					}
				});
			} 
		}
	}


// 결재자 저장 버튼
$("#saveSign").off().on("click",(function(){

	var select=$('#signListSelect>option').map(function(){return $(this).val();});
	
	var fin="";

	
	for(var i = 0; i < select.length; i++) {
		fin += select[i]+",";
	}
	
	 $('#selectSign').val(fin);
	 
	 alert(select.length + "명의 결재자가 선택되었습니다.");
}));


// 결재자 취소 버튼
$(".cancleSign").click(function(){
	
	if(!$('#selectSign').val()) {
		alert("저장된 결재자가 없습니다.");
	} else {
		$('#selectSign').val("");
		
		alert("결재자 선택이 취소 되었습니다.");
		
		JSopt.doOpt("backall");
	}
	
});


 // 글 등록 버튼
$('#submitBtn').off().on('click',(function(){
	
	if(!$('#selectSign').val()) {
		alert("결재자를 선택해주세요")
	} else {
		document.formWrite.submit();
	}
	
}));

	 
</script>

<%@ include file = "../intranet/common/footer.jsp" %>
