<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

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
  
  <title>꿈나라어린이집 # 인트라넷</title>
  
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - 로고 -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="intranetMain.jsp">      
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fa fa-smile"></i>
        </div>
        <div class="sidebar-brand-text mx-3">어린이집<br>인트라넷</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - 메인으로 -->
      <li class="nav-item">
        <a class="nav-link"  href="intranetMain.jsp">
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
        <a class="nav-link collapsed" href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/blank.html#" data-toggle="collapse" data-target="#collapseRegister" aria-expanded="true" aria-controls="collapseRegister">
          <i class="fa fa-address-book fa-2x"></i>
          <span>등록</span>
        </a>
        <div id="collapseRegister" class="collapse" aria-labelledby="headingRegister" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">상세 메뉴</h6>
            <a class="collapse-item" href="intranetRegisterStudent.jsp">원아등록</a>
            <a class="collapse-item" href="intranetRegisterTeacher.jsp">교사등록</a>
            <a class="collapse-item" href="intranetMember.jsp">회원 관리</a>
          </div>
        </div>
      </li>
      
      <!-- Nav Item - 게시판 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/blank.html#" data-toggle="collapse" data-target="#collapseCommon" aria-expanded="true" aria-controls="collapseRegister">
           <i class="fa fa-desktop fa-2x"></i>
          <span>게시판</span>
        </a>
        <div id="collapseCommon" class="collapse" aria-labelledby="headingRegister" data-parent="#accordionSidebar">
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
        <a class="nav-link collapsed" href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/blank.html#" data-toggle="collapse" data-target="#collapseClass" aria-expanded="true" aria-controls="collapseClass">
          <i class="fa fa-smile fa-2x"></i>
          <span>반관리</span>
        </a>
        <div id="collapseClass" class="collapse" aria-labelledby="headingClass" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">상세 메뉴</h6>
            <a class="collapse-item" href="intranetNotice.jsp">알림장 확인</a>            
            <a class="collapse-item" href="intranetAdviceBoard.jsp">상담확인</a>            
          </div>
        </div>
      </li>

      <!-- Nav Item - 품의관리 -->
      <li class="nav-item">
        <a class="nav-link" href="/semi/fSignList.fo">
          <i class="fa fa-file-alt fa-2x"></i>
          <span>품의관리</span></a>
      </li>

      <!-- Nav Item - 일정관리 -->
      <li class="nav-item">
        <a class="nav-link" href="intranetCalender.jsp">
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
        <a class="nav-link" href="../../login.jsp" data-toggle="modal" data-target="#logoutModal">
          <i class="fa fa-sign-out fa-2x"></i>
          <span>로그아웃</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - 홈페이지 -->
      <li class="nav-item">
        <a class="nav-link" href="../homepage/mainpage.html">
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
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  아이 상태 알림
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fa fa-child fa-2x text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">2020-01-20</div>
                    <span class="font-weight-bold">홍달이 : 오늘 할머니가 데리러갈거에요</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fa fa-child fa-2x text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">2020-01-20</div>
                    박응애 : 감기약 같이 보냅니다
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fa fa-child fa-2x text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">2020-01-19</div>
                    박응애 : 박응애 알림장입니다
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="intranetNotice.jsp">더보기</a>
              </div>
            </li>

            <!-- Nav Item - 품의 알림 -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/blank.html#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-paperclip fa-2x"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">3</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  결재 상태
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="intranetForm.jsp">
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
                </a>
                
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="intranetForm.jsp">더보기</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - 선생님 사진 -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="https://blackrockdigital.github.io/startbootstrap-sb-admin-2/blank.html#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">차은우 선생님</span>
                <img class="img-profile rounded-circle" src="<%=request.getContextPath()%>/resources/intranet/image/woo.png">
              </a>

              <!-- Dropdown - 선생님 인포메이션 -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item">
                  <i>이름 : </i>
                  <i name = "tName">차은우</i>
                </a>
                <a class="dropdown-item">
                  <i>담당반 : </i>
                  <i name = "className">1반</i>
                </a>                
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../../login.jsp" data-toggle="modal" data-target="#logoutModal">
                  <i class="fa fa-sign-out text-gray-400"></i>
                  로그아웃
                </a>
              </div>
            </li>

          </ul>

          </ul>

        </nav>
        <!-- End of Topbar -->
