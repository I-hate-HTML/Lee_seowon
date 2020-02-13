<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="semi.common.HomeCalendar" %>
<%	
	Calendar calendar = Calendar.getInstance();
	int year = 2018;//calendar.get(Calendar.YEAR);
	int month = 5;//calendar.get(Calendar.MONTH)+1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:link{color:black; text-decoration: none;}
	a:visited{color: black; text-decoration: none;}
	a:hover{color: tomato; text-decoration: underline;}
	a:active{color: red; text-decoration: overline;}
	table{border: 3px solid;}
	tr{height: 50px}
	th{font-size: 35px; height: 50px;}
	td#sun{width: 100px; text-align: center; font-size: 20px; font-weight: bold; color: red;}
	td.etc{width: 100px; text-align: center; font-size: 20px; font-weight: bold;}
	td#sat{width: 100px; text-align: center; font-size: 20px; font-weight: bold; color: blue;}
	td.before{color: lightgray; border-radius: 10px; text-align: right; vertical-align: top; font-size: 14px}
	td.after{color: lightgray; border-radius: 10px; text-align: left; vertical-align: top; font-size: 14px}
</style>
</head>
<body>
<%
	try{
		year = 2020;//Integer.parseInt(request.getParameter("year"));
		month = 2;//Integer.parseInt(request.getParameter("month"));
	}catch(Exception e){
		e.printStackTrace();
	}
	if(month == 0){
		year--;
		month=12;
	}else if(month == 13){
		year++;
		month=1;
	}
%>
<table width="700" align="center" border="0">
	<tr>
		<%-- <th>
			<input type="button" value="이전" onclick="location.href'?year=<%=year%>&month=<%=month-1%>">
		</th> --%>
		<th colspan="7"><%=year %>년 <%=month %>월</th>
		<%-- <th>
			<input type="button" value="다음" onclick="location.href'?year=<%=year%>&month=<%=month+1%>">
		</th> --%>
	</tr>
	<tr>
		<td id="sun">일</td>
		<td class="etc">월</td>
		<td class="etc">화</td>
		<td class="etc">수</td>
		<td class="etc">목</td>
		<td class="etc">금</td>
		<td id="sat">토</td>
	</tr>
	<tr>
	<%
		// 이전달 날짜 입력
		int start = HomeCalendar.weekDay(year, month, 1);
		int count;
		if(month == 1){
			count = HomeCalendar.lastDay(year-1, 12) - start + 1;
		}else{
			count = HomeCalendar.lastDay(year, month-1) - start + 1;
		}
		for(int i=1; i<=start; i++){
			out.println("<td class='before'>"+(month == 1 ? 12 : month-1)+ "/" + count++ + "</td>");
		}
		
		// 날짜 입력
		int week = 0;
		for(int i=1; i<=HomeCalendar.lastDay(year, month); i++){
			week = HomeCalendar.weekDay(year, month, i);
			out.println("<td class='etc'>"+ i +"</td>");
			
			if(week==6 && i!=HomeCalendar.lastDay(year, month)){
				out.println("</tr><tr>");
			}
		}
		
		// 다음달 날짜 입력
		count = 1;
		for(int j=week+1; j<7; j++){
			out.println("<td class='after'>"+(month==12 ? 1 : month+1) + "/" + count++ +"</td>");
		}
	%>
	</tr>
</table>


</body>
</html>