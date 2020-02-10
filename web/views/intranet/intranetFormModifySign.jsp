<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../intranet/common/nav2.jsp" %>
<%@ include file = "intranetFormList.jsp" %>



<!-- Begin Page Content -->
  
<form action="<%=request.getContextPath() %>/fWrite.fo" method="post">
<div class="card shadow mb-4">
  <div class="card-header py-3"> 
    <table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
      <tr>
        <td>
          <h6 class="m-0 font-weight-bold text-primary" style="width: 100px">품의결재창</h6>
    </td>
    <td align="right">
      <button class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fModifyView.fo'">수정</button>
      <button class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fDelete.fo'">삭제</button>             
    </td>
  </tr>
</table>
<div class="card-body">
  <div class="table-responsive">  	
      <table class="table table-bordered" id="dataTable" width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
        <tr>
          <th>품의번호</th>
          <td>
            <input type = "text" style="padding-left: 0.2rem;"name="formNum" value = "2020-001" readonly>
          </td>
          <th>분류</th>
          <td>
            <select id = "formCategory" name="formCategory" onchange="contentChange();">
              <option name="formCategory1" value = "지출결의서">지출결의서</option>
              <option name="formCategory2" value = "휴가신청서">휴가신청서</option>
              <option name="formCategory3" value = "교구신청서">교구신청서</option>
              <option name="formCategory4" value = "기타">기타</option>
            </select>
          </td>
          <th>기안자</th>
          <td><input type = "text" name="formName" value = ""></td>
          <th>기안날짜</th>
          <td><input type = "text" name="formDate" value = ""></td>
        </tr>
        <tr>  
          <th>결재자</th>
          <td>
            <select name="formLine1" id = "formLine">
              <option value="1">원장 김원장</option>
              <option value="2">부원장 박부원장</option>
              <option value="3">정교사 강교사</option>
              <option value="4">정교사 이교사</option>
              <option value="5">조리원 오조리원</option>
            </select>
            <select name = "formLineP1" style="display: none;">
              <option>승인</option>
              <option>반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine2" id = "formLine2" style="display: none;">
              <option value="1">원장 김원장</option>
              <option value="2">부원장 박부원장</option>
              <option value="3">정교사 강교사</option>
              <option value="4">정교사 이교사</option>
              <option value="5">조리원 오조리원</option>
            </select>
            <select  name = "formLineP2" style="display: none;">
              <option>승인</option>
              <option>반려</option>
            </select> 
          </td>
          <th>결재자</th>
          <td>
            <select name="formLine3" id = "formLine3" style="display: none;">
              <option value="1">원장 김원장</option>
              <option value="2">부원장 박부원장</option>
              <option value="3">정교사 강교사</option>
              <option value="4">정교사 이교사</option>
              <option value="5">조리원 오조리원</option>
            </select>
            <select  name = "formLineP3" style="display: none;">
              <option>승인</option>
              <option>반려</option>
            </select> 
          </td>
          <td style="text-align: center;"colspan="2">
            <input type ="button" class="btn btn-primary btn-sm" onclick= "add();" value="결재자 추가">
            <input type ="button" class="btn btn-primary btn-sm" onclick= "del();" value="결재자 삭제">
          </td>
        </tr>
        <tr>
          <th>반려이유</th>
          <td colspan="7">
            <input type="text" name = "formPN" style = "width: 99%;">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td colspan="7">
            <input type="text" name = "formTitle" style = "width: 99%;">
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

</script>

<%@ include file = "../intranet/common/footer.jsp" %>
