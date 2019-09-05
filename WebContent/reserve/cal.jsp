<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 달력 만드는 방법
1. 몇주인지 확인 
2. 1일이 무슨 요일인지 확인
3. 월의 일수 확인       -->
<%
   // LocalDate.now(); 현재날짜
   // LocalDate.of(2019,9,1); 임의의 날짜
   LocalDate today = LocalDate.of(2019,7,1);
   int day = today.getDayOfWeek().getValue(); // 요일: 월요일(1) ~ 일요일(7)
   if(day==7) { // 요일이 일요일이라면 0으로 변경
	   day = 0;
   }
   boolean lyear = today.isLeapYear(); // 윤년인지 아닌지
   double lmonth = today.lengthOfMonth(); // 월의 일수 
   
   // 몇주인지를 계산
   int week = (int)Math.ceil((lmonth+day)/7);
   // 총 일수의 정수형
   int max_day = (int)lmonth;
%>
   <table width=500 border=1 cellspacing=0 align=center>
   <tr>
   <td> 일 </td>
   <td> 월 </td>
   <td> 화 </td>
   <td> 수 </td>
   <td> 목 </td>
   <td> 금 </td>
   <td> 토 </td>
   </tr>
   
   <% // 1~max_day값을 출력
   int dd = 1;
   String col = "";
   for(int i = 1; i <= week; i++) {
   %>
   <tr height=50 align=center>
   <%
   for(int j=1; j<=7; j++) { // td를 7번 출력
	   if(dd > max_day || (j <= day) && (i == 1)) { 
   %>
   <td> &nbsp; </td>
   <%
   }
	   else {
		   switch(j) { // 날짜에 색을 주기위해서
		   case 1: col="red"; break;
		   case 7: col="blue"; break;
		   default: col="black"; break;
		   }
   %>
   <td><a href=""><span style="color:<%=col%>"><%=dd%></span></a></td>
   <%
   dd = dd + 1;
   }
   } // td의 끝
   %>
   </tr>
   <%
   }
   %>
   </table>
</body>
</html>