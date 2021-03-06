<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>알림장</title>

  
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<!-- 아이콘 레퍼런스 사이트 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

    <!-- 개별페이지 CSS -->
  	<link href="<%=request.getContextPath()%>/resources/homepage/css/cleanblogmin.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/homepage/css/nav.css" rel="stylesheet">

  <style>
        table.board-write2 { width:100%; margin-top:15px; border-top:1px solid #ddd; }
        table.board-write2 th { padding:8px 0; font-size:14px; font-weight:600; color:#333; line-height:30px; text-align:center; vertical-align:top; background-color:#f8f8f8; border-left:1px solid #ddd; border-bottom:1px solid #ddd; }
        table.board-write2 td { padding:8px 0; font-size:14px; color:#333; line-height:30px; text-align:center; border-left:1px solid #ddd; border-bottom:1px solid #ddd; }
        table.board-write2 th.first, table.board-write2 td.first { border-left:none; }
        table.board-write2 td input { width:60%; height:24px; margin:0; padding-left:7px; font-family:"NanumGothic","Nanum Gothic"; font-size:12px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write2 td input.radio { width:auto; height:auto; margin:9px 5px 0 0; padding:0; vertical-align:top; border:none; }
        table.board-write2 td select { height:30px; margin:0; padding-left:7px; font-family:"NanumGothic","Nanum Gothic"; font-size:12px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write2 td .width1 { width:60%; }
        table.board-write2 td .width2 { width:18%; }
        table.board-write2 td .mg1 { margin-left:10px !important; }
        table.board-write2 td a.click { display:inline-block; margin-left:8px; padding:0 15px; font-size:13px; font-weight:600; color:#fff; background-color:#666; }
        table.board-write2 td span { font-weight:600; color:#e00000; }

        table.board-write2 { margin-top:10px; display:block; overflow-x:auto; white-space:nowrap; }
	    table.board-write2 th { min-width:70px; font-size:12px; line-height:21px; padding:8px 0; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td { font-size:12px; line-height:25px; padding:10px 0; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td input { width:40%; height:25px; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td input.radio { margin:7px 4px 0 0; }
	    table.board-write2 td select { height:25px; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box; }
	    table.board-write2 td .mg1 { margin-left:5px !important; }
	    table.board-write2 td a.click { margin-left:5px; padding:0 10px; font-size:12px; }

        .mgtop7 { margin-top:10px !important; }
        .mgtop7 { margin-top:15px !important; }
        
        table.board-write { width:100%; margin-top:40px; border-top:2px solid #333; }
        table.board-write th { width:220px; padding:8px 0 8px 30px; font-size:15px; font-weight:600; color:#333; line-height:30px; text-align:left; vertical-align:top; background-color:#f5f5f5; border-bottom:1px solid #ddd; }
        table.board-write th span { color:#e00000; }
        table.board-write td { padding:8px 0 8px 20px; font-size:15px; color:#555; line-height:30px; border-bottom:1px solid #ddd; }
        table.board-write td em { display:inline-block; margin-left:8px; font-size:13px; color:#333; }
        table.board-write td strong { color:#333; }
        table.board-write td span { margin-left:8px; font-weight:600; color:#ffa800; }
        table.board-write td input { height:24px; margin:0; padding-left:7px; font-family:"NanumGothic","Nanum Gothic"; font-size:14px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write td input.radio { width:auto; height:auto; margin:9px 5px 0 0; padding:0; vertical-align:top; border:none; }
        table.board-write td input.file { width:500px; height:30px; margin:0; padding:0; vertical-align:top; border:none; background:none; }
        table.board-write td select { height:30px; padding-left:5px; font-family:"NanumGothic","Nanum Gothic"; font-size:14px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write td textarea { width:702px; height:200px; padding:5px; font-family:"NanumGothic","Nanum Gothic"; font-size:14px; color:#666; vertical-align:top; border:1px solid #ddd; }
        table.board-write td .mg1 { margin-right:60px !important; }
        table.board-write td .mg2 { margin-left:20px !important; }
        table.board-write td .mg3 { margin-left:20px !important; }
        table.board-write td .mg4 { margin-top:5px !important; }
        table.board-write td .width1 { width:322px; }
        table.board-write td .width2 { width:100px; }
        table.board-write td .width3 { width:56px; }
        table.board-write td .width4 { width:200px; }
        table.board-write td .width5 { width:500px; }
        table.board-write td a.click { display:inline-block; margin-left:8px; padding:0 25px; font-size:13px; font-weight:600; color:#fff; background-color:#666; }
        table.board-write td a.click2 { display:inline-block; padding:0 25px; font-size:13px; font-weight:600; color:#fff; background-color:#ffa800; }
        table.board-write td table.tbl4 { width:60%; }
        
        .table-bordered{
          font-size: 16px;
        }        
      
.tabbtn{width: 100%;table-layout: fixed;border-collapse: collapse;}
.tabbtn a.alimtab3 {background-color: #002c5f; color: white;}
.tabbtn a {display: table-cell;height: 60px;
font-size: 18px;text-align: center;
vertical-align: middle;}
.table-bordered{
          font-size: 16px;
        }



@media screen and (max-width:1023px){.tabbtn a{display:table-cell;width: 1000%;}} 
@media screen and (max-width:758px){.tabbtn a{height: 40px; font-size: 15px; line-height: 40px;}} 
@media screen and (max-width:1023px){.tabbtn a:first-child{border-left: 0;}} 
 
@media screen and (max-width: 1023px){.tabbtn {display: table;}}
@media screen and (min-width: 1023px){.tabbtn a {display: table-cell;width: 300px;}}

        
        #form{
            width: fit-content;
           
        }


    </style>

</head>

<body>

  <!-- Navigation -->
  <%@ include file="common/nav.jsp" %>

  <!-- Main Content -->
  <div class="top_bg">
    <a class="top_p"> 알림장 </a>
     <p>아이들 소식을 전하는 공간</p>
     
   </div>
  
  <br>
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div class="card">
          <div class="tabbtn">
            <a href="alimNote.jsp" class="alimtab1">아이 알림장</a>
            <a href="alim_rehome.jsp" class="alimtab2">귀가 통지서</a>
            <a href="alim_medi.jsp" class="alimtab3">투약 통지서</a>
        </div>
        </div>
        <form action="<%= request.getContextPath() %>/amInsert.al" method="post">
            <table class="table table-bordered">
                    <tr>
                        <td colspan="4" style="background-color: #002c5f; color: white;">기본입력</td>
                    </tr>
                    <!-- <tr>
                        <td style="border-right: none;">대상아이</td>
                        <td colspan="3" style="border-left: none; border-right: none;">
                            <input type="text" name="child" style="width: 70%;">
                        </td>
                    </tr> -->
                    <tr>
                        <td style="border-right: none;">증상</td>
                        <td colspan="3" style="border-left: none; border-right: none;">
                            <input type="text" name="almd_con" id="almd_con" style="width: 70%;" placeholder="예) 감기, 몸살, 술병">
                        </td>
                    </tr>
                     <tr>
                        <td style="border-right: none;">약의 종류</td>
                        <td colspan="3" style="border-left: none; border-right: none;">
                            <input type="text" name="almd_type" id="almd_type" style="width: 70%;" placeholder="예) 물약, 가루약, 마약">
                        </td>
                    </tr>
                     <tr>
                        <td style="border-right: none;">투약 용량</td>
                        <td colspan="3" style="border-left: none; border-right: none;">
                            <input type="text" name="almd_vol" id="almd_vol" style="width: 70%;" placeholder="예) 한 봉, 6ml">
                        </td>
                    </tr>
                     <tr>
                        <td style="border-right: none;">투약 횟수</td>
                        <td colspan="3"style="border-left: none;">
                            <select name="almd_num" id="almd_num" style="width: 70%;">
                                <option value="1회">1회</option>
                                <option value="2회">2회</option>
                                <option value="3회">3회</option>
                            </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="border-right: none;">투약 시간</td>
                        <td colspan="3" style="border-left: none; border-right: none;">
                            <input type="text" name="almd_time" id="almd_time" style="width: 70%;" placeholder="예) 오전 9시, 식후 30분">
                        </td>
                    </tr>
                     <tr> 
                        <td style="border-right: none;">보관 방법</td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="alim_giboon1" name="almd_temp"><label for="alim_giboon1">실온</label></td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="alim_giboon2" name="almd_temp"><label for="alim_giboon2">냉장</label></td>
                    </tr>
                    <tr>
                        <td style="border-right: none;">특이사항</td>
                        <td colspan="3" style="border-left: none; border-right: none;">
                            <input type="text" name="almd_ps" style="width: 70%;" placeholder="예) 보드카와 함께 줘야 좋아합니다, 약을 먹기 싫어해요">
                        </td>
                    </tr>
                     <tr>
                        <td colspan="4" style="border: 0.1rem solid gray; text-align: center; padding:0px;">
                            <input class="btn btn-primary col-lg-12 col-md-12" onclick="return check()" type="submit" value="확인" style="background-color: #002c5f; color: white;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="background-color: #868e96; color: white; border: 0.1rem solid gray;  padding:0px;">
                            <input class="btn btn-primary col-lg-12 col-md-12" type="reset" value="취소" style="background-color: #868e96; color: white;">
                        </td>
                    </tr>
            </table>

        </form>
      </div>
    </div>
  </div>

  <hr>

  <!-- Footer -->
  <%@ include file="common/footer.jsp" %>
  
  <script>
      var date = new Date();
      $(function(){
          $('#alim_date').text(date);
      });
      
      function check() {
    		var al_feel = $('#al_feel');
       		if($('#almd_con').val()=="" ||
       		   $('#almd_type').val()=="" ||	
       		   $('#almd_vol').val()=="" ||	
       		   $('#almd_time').val()==""  ||
       		   $(':radio[name="almd_temp"]:checked').length < 1
       		){
       			alert("기본 입력값을 입력해 주세요!");
       			return false;
       		}
       		return true;
    	}
      
      
  </script>
</body>

</html>
