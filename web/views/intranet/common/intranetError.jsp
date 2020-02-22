<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "nav.jsp" %>
<%
	String msg = (String)request.getAttribute("msg");
	//Exception e = (Exception)request.getAttribute("exception");
	// 일반적으로 jsp에 사용되는 exception 내장 객체는 jspException 클래스를 활용한다.
	// 따라서 사용자 정의 예외를 구현할 때에는 Exception 객체를 직접 선언하여 사용하여야 한다.
%>
<!DOCTYPE html>


 <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="ERROR" style="width:20.5rem;">ERROR</div>
            
            <p class="lead text-gray-800 mb-5" style="margin:25px;"> <%= msg.toString() %></p>
            <p class="text-gray-500 mb-0">서비스 에러가 발생하였습니다. <br> 다시 시도해주세요.</p>
            <a href="<%=request.getContextPath()%>/views/intranet/intranetMain.jsp">&larr; 메인화면으로 돌아가기</a>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      
<%@ include file = "footer.jsp" %>      

