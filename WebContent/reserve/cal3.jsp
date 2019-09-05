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
<%
   int y,m;
   if(request.getParameter("yy")==null) {
	   LocalDate xday = LocalDate.now();
	   y = xday.getYear();
	   m = xday.getMonthValue();
   }
   else { // request한 값이 없을 때 실행
	   // 문자열의 y,m을 숫자열로 바꾸는 방법
	   y = Integer.parseInt(request.getParameter("yy"));
	   m = Integer.parseInt(request.getParameter("mm")); 
   }
   
   if(m==0) { // 0월이 들어올때
	   y = y - 1;
	   m = 12;
   }
   
   if(m==13) { // 13월이 들어올때
	   y = y + 1;
	   m = 1;
   }
   
   // 위의 년, 월을 보내기 
   LocalDate today = LocalDate.of(y,m,1);
   
   int day = today.getDayOfWeek().getValue(); 
   if(day==7) { 
	   day = 0;
   }

   double lmonth = today.lengthOfMonth(); 
   

   int week = (int)Math.ceil((lmonth+day)/7);
  
   int max_day = (int)lmonth;
%>
<script>
  function move_cal() { // 다른년도와 다른월의 달력을 보여준다
	 var y = document.all.sel_y.value;
     var m = document.all.sel_m.value;
     // 년도, 월을 가지고 문서를 호출
     location = "cal3.jsp?yy="+y+"&mm="+m;
  }
</script>
<table width=400 border=1 cellspacing=0>
<caption>
<%
  if(m!=1) {
%>
  <a href="cal3.jsp?yy=<%=y%>&mm=<%=m-1%>">이전달</a>
<%
  }
  else
  {	  
%>
  <a href="cal3.jsp?yy=<%=y-1%>&mm=<%=12%>">이전달</a>
<%
  }
%>  
<select onchange=move_cal() id=sel_y>
<%
  String sel1 = "";
  for(int i=y+3; i>=y-3; i--) {
	  if(i==y)
		  sel1 = "selected";
	  else 
		  sel1 = ""; 
%>
  <option value=<%=i%><%=sel1%>><%=i%></option>
<% 
  }
%>
</select>
<select onchange=move_cal() id=sel_m>
<%
  String sel2 = "";
  for(int i=1; i<=12; i++) {
	  if(i==m)
		  sel2 = "selected";
	  else 
		  sel2 = ""; 
%>	  
  <option value=<%=i%><%=sel2%>><%=i%></option>
<%
  }
%>
</select>
<%
  if(m!=12) {
%>
<a href="cal3.jsp?yy=<%=y%>&mm=<%=m+1%>">다음달</a>
<% 
  }
  else
  {	  
%>
<a href="cal3.jsp?yy=<%=y+1%>&mm=<%=1%>">다음달</a>
<%
  }
%>
</caption> 
<%
  int da = 1;
  for(int i=1; i<=5; i++) {
%>
<tr align=center>
<%
  for(int j=0; j<7; j++) {
	  if((day > j && i == 1) || max_day < da) {
%>
  <td> &nbsp; </td>
<%
  }
  else	  
  {
%>
  <td> <%=da%> </td>
<%
  da = da + 1;
  }
  } 
%>
  </tr>
<%
  }
%>
</table>
</body>
</html>