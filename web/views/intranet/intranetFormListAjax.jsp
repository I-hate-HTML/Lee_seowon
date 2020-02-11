<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi.intranet.form.model.vo.SignList, java.util.ArrayList, semi.intranet.form.model.vo.Form" %>
<%@ page import="semi.intranet.daily.model.vo.PageInfo" %>


<%-- <%

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>  --%>
  <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">품의 관리</h1>

<div class="card shadow mb-4">
  <div class="card-header py-3">
  	
  	<table width="100%" table-layout="fixed;" word-break="break-all;" cellspacing="0">
      <tr>
        <td>
          <h6 class="m-0 font-weight-bold text-primary">품의목록</h6>
    </td>
    <td align="right">
      <input type="button" class = "btn btn-primary btn-sm" onclick="location.href='<%= request.getContextPath()%>/fListOnly.fo'" value="글쓰기">
    </td>
  </tr>
</table>
  </div>
  <div class="card-body">
    <div class="table-responsive"> 
      <table id = "viewTable" class="table table-striped">
        <tr>
          <th width = "10%">품의번호</th>
          <th width = "10%">분류</th>
          <th width = "10%">상태</th>
          <th width = "35%">제목</th>
          <th width = "15%">기안자</th>               
          <th width = "20%">작성일</th>
        </tr>
        	
       </table> 
       
          <nav aria-label="Page navigation example">
              <ul class="pagination pagination-sm justify-content-center" id="pageBtn">
              </ul>
            </nav>
            
        </div>
      </div>
  </div>
  

<script>

var currentPage;
var listCount;
var limitContent;
var limitPage;
var maxPage;
var startPage;
var endPage;

 $(function(){
	
	console.log("기능실행");
	$.ajax({
		url:"/semi/fListAjax.fo",
		type:"post",
		data:{'empNo' : 2015001,
			  'currentPage': currentPage, 
			  'listCount': listCount, 
			  'limitContent':limitContent, 
			  'limitPage':limitPage, 
			  'maxPage':maxPage, 
			  'startPage':startPage,
			  'endPage':endPage	
		},
		success:function(data){
			console.log(data);
			
			// 리스트 목록
			$.each(data, function(index, value){
				
				for(var i in index) {
				
					// 변수에 담기
					var $tr = $('<tr>');
					var $tdFno = $('<td>').css('text-align', 'center').text(data.flist[i].fno);
					var $fno = $('<input>').attr('type','hidden').attr('name','fno').text(data.flist[i].fno);
					var $tdFcategory = $('<td>').css('text-align', 'center');
					var $fcategory = $('<input>').attr({
														'type' : 'hidden',
														'id' : 'listCategory',
														'name' : 'category'
													  }).text(data.flist[i].fcategory);
					var $spanFcategory = $('<span>').attr('id', 'typeChage').text(data.flist[i].category);
					var $tdFstatus = $('<td>').css('text-align', 'center').text(data.flist[i].fstatus);
					var $tdFtitle = $('<td>').css('text-align', 'center').text(data.flist[i].ftitle);
					var $tdFwriter = $('<td>').css('text-align', 'center').text(data.flist[i].fwriter);
					var $fwriter = $('<input>').attr('type','hidden').attr('id','writerId').text(data.flist[i].fwriterId);
					var $tdFdate = $('<td>').css('text-align', 'center').text(data.flist[i].fdate);
				
					// 담기
					$tr.append($tdFno.append($fno));
					$tr.append($tdFcategory.append($spanFcategory));
					$tr.append($tdFstatus);
					$tr.append($tdFtitle);
					$tr.append($tdFwriter.append($fwriter));
					$tr.append($tdFdate);
					
					// table에 td가 추가된 tr 추가
					$('#viewTable').append($tr);
				}	
			});
			
			console.log('currentPage :'+data.pi.currentPage);  
			console.log('listCount :'+data.pi.listCount);    
			console.log('limitContent:'+data.pi.limitContent); 
			console.log('limitPage :'+data.pi.limitPage);    
			console.log('maxPage  :'+data.pi.maxPage);      
			console.log('startPage :'+data.pi.startPage);    
			console.log('endPage  :'+data.pi.endPage);      
			
			
			
			// 페이징처리
			$preLi=$('<li>').attr('class','page-item');
			$preA=$('<a>').attr({
								'class':'page-link',
								'href':'#',
								'aria-label':'Previous'});
			$preSpan=$('<span>').attr('aria-hidden',true).text('«');
			$preSpan2=$('<span>').attr('class','sr-only').text("Previous");
			
			// 현재 페이지가 1페이지면 이전 페이지 버튼 disabled
			if(data.pi.currentPage <= 1) {
				
				$preLi.attr('disabled', true);					
				
				$preA.append($preSpan).append($preSpan2);
				$preLi.append($preA);
				
				$('#pageBtn').append($preLi);
				
			} else {				
				
				$preA.append($preSpan).append($preSpan2);
				$preLi.append($preA);
				
				$('#pageBtn').append($preLi);
				
			}
			
			
			$cuLi=$('<li>').attr('class','page-item');
			$cuA=$('<a>').attr('class', 'page-link');
		
			// 페이지 버튼 만들고 현재 페이지는 버튼 disabled 
			for(var p = data.pi.startPage; p <= data.pi.endPage; p++){
				console.log(p);
				
				if(p == data.pi.currentPage){
					$cuA.text(p);
					$cuLi.attr('disabled', true);
					
					$cuLi.append($cuA);
					$('#pageBtn').append($cuLi);
					
				} else if(p != data.pi.currentPage){
					$cuA.text(p);
					$cuA.attr('href', '#');
					
					$cuLi.append($cuA);
					$('#pageBtn').append($cuLi);
				}	
			}
			
			
			// 일반 버튼 
			
			$neLi=$('<li>').attr('class','page-item');
			$neA=$('<a>').attr({
								'class':'page-link',
								'href':'#',
								'aria-label':'Next'
							  });
			$neSpan=$('<span>').attr('aria-hidden','true').text("»");
			$neSpan2=$('<span>').attr('class','sr-only').text('Next');
			
			if(data.pi.currentPage >= data.pi.maxPage) {
				
				$neLi.attr('disabled', true);
				
				$neA.append($neSpan);
				$neA.append($neSpan2);
				$neLi.append($neA);
				
				$('#pageBtn').append($neLi);
			
			} else {
				$neLi.attr('disabled', false);
				$neA.append($neSpan);
				$neA.append($neSpan2);
				$neLi.append($neA);
				
				$('#pageBtn').append($neLi);			
				
			}
				 
		}, error:function(request,status,error){
			
			console.log("에러입니다.");
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	    
		}

	});
});

 /* $(function(){
	console.log("paging ajax 시작");
	$.ajax({
		url:"/semi/fPasing.fo",
		type:"post",
		data: {
			'currentPage': currentPage, 
			'listCount': listCount, 
			'limitCountent':limitContent, 
			'limitPage':limitPage, 
			'maxPage':maxPage, 
			'startPage':startPage,
			'endPage':endPage
		},
		success:function(data) {
			
			$.each(data, function(index, value){
				
				$preLi=$('<li class="page-item>');
				$preA=$('<a class="page-link" href="#" aria-label="Previous">');
				$preSpan=$('<span aria-hidden="true">').text("«");
				$preSpan2=$('<span class="sr-only">').text("Previous");
				
				// 현재 페이지가 1페이지면 이전 페이지 버튼 disabled
				if(currentPage <= 1) {
					
					$preLi.attr('disabled', true);					
					
					$preA.append($preSpan).append($preSpan2);
					$preLi.append($preA);
					
					$('#pageBtn').append($preLi);
					
				} else {				
					
					$preA.append($preSpan).append($preSpan2);
					$preLi.append($preA);
					
					$('#pageBtn').append($preLi);
					
				}
				
				
				$cuLi=$('<li class="page-item">');
				$cuA=$('<a class="page-link">');
			
				// 페이지 버튼 만들고 현재 페이지는 버튼 disabled 
				for(var p = startPage; p <= endPage; p++){
					
					if(p == currentPage){
						$cuLi.attr('disabled', true);
						$cuA.text(p);
						
						$('#pageBtn').append($cuLi.append($cuA));
					} else {
						$cuA.text(p);
						$cuA.attr('href', '#')
						$('#pageBtn').append($cuLi.append($cuA));
					}	
				}
				
				
				// 일반 버튼 
				
				$neLi=$('<li class="page-item">');
				$neA=$('<a class="page-link" href="#" aria-label="Next">');
				$neSpan=$('<span aria-hidden="true">').text("»");
				$neSpan2=$('<span class="sr-only">').text("Next");
				
				if(currentPage >= maxPage) {
					
					$neLi.attr('disabled', true);				
					$('#pageBtn').append($neLi.append($neA).append($neSpan).append($neSpan2));
				
				} else {
					
					$('#pageBtn').append($neLi.append($neA).append($neSpan).append($neSpan2));				
					
				}
				
			});
		}, error:function(request,status,error){
			console.log("Paging 에러");
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
       }

	});
	
	
}); */


$('#viewTable td').click(function(){
	
	var fno = $(this).parent().find("input").val();
	location.href="<%= request.getContextPath() %>/fRead.fo?fno=" + fno;
});
</script>


 