<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="semi.intranet.alimjang.model.vo.Alim" %>
<%@ page import="semi.home.jsp.model.vo.*"%>

<%
 Member m = (Member)session.getAttribute("member"); 
 request.setAttribute("member", m);
%>


<!DOCTYPE html>
<!-- saved from url=(0061)https://blackrockdigital.github.io/startbootstrap-sb-admin-2/ -->
<html lang="ko">

<head>
	
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
  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/all.min.css" rel="stylesheet" type="text/css"/>
 <!--  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/css.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/1_content.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
 -->
  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/resources/intranet/intranet/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css"/>
  
  <title>팡팡어린이집 # 인트라넷</title>
  
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - 로고 -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/views/intranet/intranetMain.jsp">      
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fa fa-smile"></i>
        </div>
        <div class="sidebar-brand-text mx-3">어린이집<br>인트라넷</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - 메인으로 -->
      <li class="nav-item">
        <a class="nav-link"  href="<%=request.getContextPath()%>/views/intranet/intranetMain.jsp">
          <i class="fa fa-home fa-2x"></i>
          <span>메인으로</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- 메뉴 -->
      <div class="sidebar-heading">
        메뉴
      </div>

      <!-- Nav Item - 등록 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=request.getContextPath()%>/views/intranet/intranetRegisterStudent.jsp" data-toggle="collapse" data-target="#collapseRegister" aria-expanded="true" aria-controls="collapseRegister">
          <i class="fa fa-address-book fa-2x"></i>
          <span>등록</span>
        </a>
        <div id="collapseRegister" class="collapse" aria-labelledby="headingRegister" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">상세 메뉴</h6>
            <a class="collapse-item" href="<%=request.getContextPath()%>/views/intranet/intranetRegisterStudent.jsp">원아등록</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/views/intranet/intranetRegisterTeacher.jsp">교사등록</a>
            <a class="collapse-item" href="/semi/showmem.list">회원 관리</a>
          </div>
        </div>
      </li>
      
      <!-- Nav Item - 게시판 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="/semi/nList.da" data-toggle="collapse" data-target="#collapseBoard" aria-expanded="true" aria-controls="collapseBoard">
           <i class="fa fa-desktop fa-2x"></i>
          <span>게시판</span>
        </a>
        <div id="collapseBoard" class="collapse" aria-labelledby="headingRegister" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">상세 메뉴</h6>
            <a class="collapse-item" href="/semi/nList.da">공지사항</a>
            <a class="collapse-item" href="/semi/dList.da">교육일지</a>
          </div>
        </div>
      </li>
      
      
       <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- 메뉴 -->
      <div class="sidebar-heading">
        	개인페이지
      </div>

           
      <!-- Nav Item - 반 관리 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="/semi/aListClass.al" data-toggle="collapse" data-target="#collapseClass" aria-expanded="true" aria-controls="collapseClass">
          <i class="fa fa-smile fa-2x"></i>
          <span>반관리</span>
        </a>
        <div id="collapseClass" class="collapse" aria-labelledby="headingClass" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">상세 메뉴</h6>
            <a class="collapse-item"  href="/semi/aListClass.al">알림장 확인</a>            
            <a class="collapse-item" href="/semi/list.qna">문의 확인</a>            
          </div>
        </div>
      </li>

      <!-- Nav Item - 품의관리 -->
      <li class="nav-item">
        <a class="nav-link" href="/semi/fList.fo">
          <i class="fa fa-file-alt fa-2x"></i>
          <span>품의관리</span></a>
      </li>

      <!-- Nav Item - 일정관리 -->
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/views/intranet/intranetCalender.jsp">
          <i class="fa fa-calendar-alt fa-2x"></i>
          <span>일정관리</span></a>
      </li>

       <!-- Divider -->
       <hr class="sidebar-divider">

       <!-- Heading -->
       <div class="sidebar-heading">
         정보수정
       </div>

       <!-- Nav Item - 개인정보수정 -->
      <li class="nav-item">
        <a class="nav-link" href="intranetEdit.jsp">
          <i class="fa fa-user fa-2x"></i>
          <span>개인정보수정</span></a>
      </li>

      <!-- Nav Item - 로그아웃 -->
      <li class="nav-item">
        <a class="nav-link" href="/semi/homelogout">
          <i class="fa fa-sign-out fa-2x"></i>
          <span>로그아웃</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - 홈페이지 -->
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/views/homepage/homeindex.jsp">
          <i class="fa fa-check-circle fa-2x"></i>
          <span>홈페이지</span></a>
      </li>

     

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) 사이드바 숨기기-->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars fa-2x"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
    
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

           
            <!-- Nav Item - 아이상태알림 -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-child fa-2x"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter" id="count"></span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" id="childAlim" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header"> 아이 상태 알림</h6>
                
                <!-- <a class="dropdown-item d-flex align-items-center" id="alimHref" href="">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary" id="alimColor">
                      <i class="fa fa-child fa-2x text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500" id="alimDate">2020-01-20</div>
                    <span class="font-weight-bold" id="alimName">홍달이</span>
                    <span id="alimCategory">투약 의뢰서</span>
                  </div>
                </a> -->
                <a class="dropdown-item text-center small text-gray-500" href="/semi/aListClass.al">더보기</a>
            </li>

            <!-- Nav Item - 품의 알림 -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/blank.html#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-paperclip fa-2x"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter formCount"></span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" id="formAilm" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">결재 상태</h6>
                
                <%-- <a class="dropdown-item d-flex align-items-center" href="intranetForm.jsp">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="<%=request.getContextPath()%>/resources/intranet/image/a.png" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">교육일지 확인바랍니다.</div>
                    <div class="small text-gray-500">한원장, 2020-01-20, 결재신청</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="intranetForm.jsp">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="<%=request.getContextPath()%>/resources/intranet/image/woo.png" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">휴가 신청 품의서입니다.</div>
                    <div class="small text-gray-500">차은우, 2020-01-06, 반려</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="intranetForm.jsp">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="<%=request.getContextPath()%>/resources/intranet/image/woo.png" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">2019년 12월 지출결의서입니다.</div>
                    <div class="small text-gray-500">차은우, 2019-12-30, 결재완료</div>
                  </div>
                </a> --%>
                
                
                <a class="dropdown-item text-center small text-gray-500" href="intranetForm.jsp">더보기</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - 선생님 사진 -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/blank.html#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= m.getUserName() %> 선생님</span>
                <img class="img-profile rounded-circle" id="tImage" >
              </a>

              <!-- Dropdown - 선생님 인포메이션 -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item">
                  <i>이름 : </i>
                  <i name = "tName"><%= m.getUserName() %></i>
                </a>
                <a class="dropdown-item">
                  <i>담당반 : </i>
                  <i name = "className" id="classNum"></i>
                </a>                
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/semi/homelogout">
                  <i class="fa fa-sign-out text-gray-400"></i>
                  		로그아웃
                </a>
              </div>
            </li>

          </ul>

          </ul>

        </nav>
        <!-- End of Topbar -->
        
        <script>

        // nav 알림 가져오기
        $(function(){
       	
       	var empno = '<%= m.getUserId()%>';

       	$.ajax({
       		url:"/semi/aNav.al",
       		type:"post",
       		data:{"empno" : empno},
       		success:function(data){
       			
       			// 알림 카운트
       			$('#count').text(data.aCount);
       			
       			
       		// 알림 리스트 목록
       			$.each(data, function(index, value){
       				
       				for(var i in index) {
       					 
       					var ano = data.aList[i].ano;
       					var categoryNum = data.aList[i].acategory;
       					var category = data.aList[i].category + "\t";
       					var date = data.aList[i].adate;
       					var aname = data.aList[i].achild;
       					
       					
       					// 알림 아이콘 나오기
       					var $a = $('<a>').attr({
       										'class':'dropdown-item d-flex align-items-center',
       										'href' : '/semi/aRead.al?ano='+ ano + '&category=' + categoryNum
       										  });
       					var $div1 = $('<div>').attr('class','mr-3');
       					var $div2;
       					
       					if(categoryNum == 1) {
       						$div2 = $('<div>').attr('class', 'icon-circle bg-primary');
       					} else if (categoryNum == 2) {
       						$div2 = $('<div>').attr('class', 'icon-circle bg-success');
       					} else {
       						$div2 = $('<div>').attr('class', 'icon-circle bg-warning');
       					}
       					
       					var $i = $('<i>').attr('class', 'fa fa-child fa-2x text-white');
       					
       					$('#childAlim').append($a.append($div1.append($div2.append($i))));
       					
       					
       					// 알림 리스트 나오기
       					var $div3 = $('<div>');
       					var $div4 = $('<div>').attr('class','small text-gray-500').text(date);
       					var $span1 = $('<span>').text(aname);
       					var $span2 = $('<span>').attr('class','font-weight-bold').text(category);
       					
       					$div3.append($div4);
       					$div3.append($span2);
       					$div3.append($span1);
       					$('#childAlim').append($a.append($div3));
       					
       				}
       			});
       			
       		}, error:function(data){
       			alret("권한이 없습니다.");
       		}
       	});
       });


        //선생님 정보 가져오기
        $(function(){

          	$.ajax({
          		url:"/semi/iNavEmployee.in",
          		type:"post",
          		success:function(data){
          			
          			var classNum = data.info.classNum;
          			var position = data.info.position;
          			var image = data.info.image;
          			

          			if(classNum == 0) {
          				$('#classNum').text(position).val(position);
          			} else {
          				$('#classNum').text(classNum + "반").val(classNum);
          			}
          			
          			$('#tImage').attr("src",'resources/intranet/image/'+ image);
          			
          		}, error:function(data){
          			
          		}
          	});
       	
       });
        
     // 품의 알림
        $(function(){
     	   var empno = '<%= m.getUserId()%>';
     	   
     	   $.ajax({
     		  url:"/semi/iNavForm.in",
     		  type:"post",
     		  data:{"empno":empno},
     		  success:function(data){
     			  console.log(data);
     			  
     			  // 결재 알림 카운트
     			  $(".formCount").text(data.fCount);
     			  
     			  // 결재 알림 리스트 목록
     			  
     			  $.each(data, function(index, value){
       				
       				for(var i in index) {
       					 
       					var fno = data.fList[i].fno;
       					var name = data.fList[i].name;
       					var date = data.fList[i].data;
       					var process = data.fList[i].process;
       					var title = data.fList[i].title;
       					var image = data.fList[i].img;
       					
       					
       					// 알림 사진 나오기
       					
       					$a1 = $('<a>').attr({"class":"dropdown-item d-flex align-items-center",
       										 'href' :'/semi/fList.fo'
       										});
       					
       					$div1 = $('<div>').attr("class","dropdown-list-image mr-3");
       					$img1 = $('<img>').attr({
       											 "class":"rounded-circle",
       											 "src" : "resources/intranet/image/" + image,
       											 "alt" : ""
       											});
       					$div2 = $('<div>').attr("class","status-indicator bg-success");
       					
       					
       					// 알림 리스트 가져오기
       					$div3 = $('<div>').attr("class","font-weight-bold");
       					$div4 = $('<div>').attr("class","text-truncate").text(title);
       					$div5 = $('<div>').attr("class","small text-gray-500").text(name + "\t" + data + "\t" + process);
       					
       					
       					$('#formAilm').append($a1.append($div1.append($img1).append($div2)));
       					$('#formAilm').append($div3.append($div4).append($div5));
       				}
     			  });
     			  
     		  }, error:function(data){
     			  console.log("에러");
     		  }
     		   
     		   
     		   
     	   });
     	   
     	   
     	   
        });


        </script>
        
        
