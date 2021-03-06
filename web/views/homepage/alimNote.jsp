<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

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
  
	<!-- 이것만 위치 맞춰주면됨 -->

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
        
      
.tabbtn{width: 100%;table-layout: fixed;border-collapse: collapse;}
.tabbtn a.alimtab1 {background-color: #002c5f; color: white;}
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
  <%@ include file = "common/nav.jsp" %>


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
        <form action="<%= request.getContextPath() %>/anInsert.al" method="post" id="alimnoteform">
            <table class="table table-bordered">
                    <tr>
                        <td colspan="4"><textarea name="al_content" id="alim_text" cols="30" rows="10" placeholder="가정에서 이렇게 지냄" style="width: 100%; resize: none;"></textarea></td>                    
                    </tr>                    
                    <tr>
                        <td colspan="4" style="background-color: #002c5f; color: white;">기본입력</td>
                    </tr>
                    <tr> 
                        <td style="border-right: none;">기분</td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="alim_giboon1" name="al_feel" value="좋음"><label for="alim_giboon1">좋음</label></td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="alim_giboon2" name="al_feel" value="보통"><label for="alim_giboon2">보통</label></td>
                        <td style="border-left: none; "><input type="radio" id="alim_giboon3" name="al_feel" value="나쁨"><label for="alim_giboon3">나쁨</label></td>
                    </tr>
                    <tr> 
                        <td style="border-right: none;">건강</td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="health1" name="al_health" value="좋음"><label for="health1">좋음</label></td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="health2" name="al_health" value="보통"><label for="health2">보통</label></td>
                        <td style="border-left: none; "><input type="radio" id="health3" name="al_health" value="나쁨"><label for="health3">나쁨</label></td>
                    </tr>
                    <tr> 
                        <td style="border-right: none;">체온체크</td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="ondo1" name="al_temp" value="정상"><label for="ondo1">정상</label></td>
                        <td style="border-left: none; border-right: none;"><input type="radio" id="ondo2" name="al_temp" value="미열"><label for="ondo2">미열</label></td>
                        <td style="border-left: none; "><input type="radio" id="ondo3" name="al_temp" value="고열"><label for="ondo3">고열</label></td>
                    </tr>
                    <tr>
                        <td style="border-right: none;">식사여부</td>
                        <td colspan="3"style="border-left: none;">
                            <select name="al_meal" id="bob" style="width: 70%;" >
                                <option value="선택안함">선택안함</option>
                                <option value="약간">약간</option>
                                <option value="보통">보통</option>
                                <option value="많이">많이</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-right: none;">수면시간</td>
                        <td colspan="3"style="border-left: none;">
                            <select name="al_sleep" id="sleep" style="width: 70%;">
                                <option value="선택안함">선택안함</option>
                                <option value="8시간">8시간 이상</option>
                                <option value="6~8시간">6~8시간</option>
                                <option value="4~6시간">4~6시간</option>
                                <option value="4시간미만">4시간미만</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-right: none;">배변상태</td>
                        <td colspan="3"style="border-left: none;">
                            <select name="al_poop" id="dong" style="width: 70%;">
                                <option value="선택안함">선택안함</option>
                                <option value="좋음">좋음</option>
                                <option value="보통">보통</option>
                                <option value="나쁨">나쁨</option>
                            </select>
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
  <%@ include file="common/footer.jsp"%>


  <script>  
      var date = new Date();
      $(function(){
          $('#alim_date').text(date);
      })
      
    	   
      function check() {
		var al_feel = $('#al_feel');
   		if($(':radio[name="al_feel"]:checked').length < 1 ||
   		   $(':radio[name="al_health"]:checked').length < 1 ||
   		   $(':radio[name="al_temp"]:checked').length < 1 ||
   		   $('#bob').val()=="선택안함" ||
   		   $('#sleep').val()=="선택안함" ||
   		   $('#dong').val()=="선택안함"   		
   		){
   			alert("기본 입력값을 입력해 주세요!");
   			return false;
   		}
   		
   		return true;
	}
       
      $('#al_meal').change(function(){
    	  console.log($(this).val());
      })
      
      
  </script>
</body>

</html>
