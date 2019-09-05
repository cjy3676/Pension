<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>    
<%@ page import="java.sql.*" %>   
<%@ include file="../top.jsp" %> 
<%
 	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
 	String bb = "root";
 	String cc = "1234";
 	Connection conn = DriverManager.getConnection(aa, bb, cc);
 	Statement stmt = conn.createStatement();
 	Statement stmt1 = conn.createStatement();
 %>   
<style>
  #section {
    width:1200px;
    height:auto;
    margin:auto;
    margin-bottom: 30px;
  }
  .select_head {
  height: 50px;
  margin-top: 20px;
  }
  #last_month {
  font-size: 25px;
  font-weight: bold;
  margin-right: 15px; 
  }
  #next_month {
  font-size: 25px;
  font-weight: bold;
  margin-left: 15px; 
  }
  #sel_y {
  width:70px;
  height: 25px;
  margin-right: 10px;
  }
  #sel_m {
  width:50px;
  height: 25px;
  }
  .days_week td{
  text-align:center;
  width: 155px; 
  height:40px;
  font-size:20px;
  font-weight: bold;
  background: #c6c6c6;
  }
  #sunday {
  color: red;
  }
  #saturday {
  color: blue;
  }
  .days_room td{
  align:center;
  width: 155px; 
  }
</style>
<script>
  function move_cal() { // 다른년도와 다른월의 달력을 보여준다
	 var y = document.all.sel_y.value;
     var m = document.all.sel_m.value;
     // 년도, 월을 가지고 문서를 호출
     location = "reserve.jsp?yy="+y+"&mm="+m;
  }
  function input_move(n,y,m,d) { // 방이름,년,월,일
	  n = encodeURIComponent(n);
      location = "input.jsp?room="+n+"&y="+y+"&m="+m+"&d="+d;
  }
</script>
<div id="section">
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
   
   // 위의 년, 월을 보내기 
   LocalDate today = LocalDate.of(y,m,1);
   
   int day = today.getDayOfWeek().getValue(); // yoil 
   if(day==7) { 
	   day = 0;
   }

   double lmonth = today.lengthOfMonth(); // 월의 총일수 => chong
   
   int week = (int)Math.ceil((lmonth+day)/7); 
   // 현재월의 주의 수 => ju, (chong+yoil)
   int max_day = (int)lmonth; 
%>

<table width=1000 height=500 align=center border=1 cellspacing=0>
<caption>
<div class=select_head>
<%
  if(m!=1) {
%>
  <a id="last_month" href="reserve.jsp?yy=<%=y%>&mm=<%=m-1%>">이전달</a>
<%
  }
  else
  {	  
%>
  <a id="last_month" href="reserve.jsp?yy=<%=y-1%>&mm=<%=12%>">이전달</a>
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
  <option value=<%=i%> <%=sel1%>><%=i%></option>
<% 
  }
%>
</select>
<select onchange=move_cal() id=sel_m>
<%
  String sel2 = "";
  for(int j=1; j<=12; j++) {
	  if(j==m)
		  sel2 = "selected";
	  else 
		  sel2 = ""; 
%>	  
  <option value=<%=j%> <%=sel2%>><%=j%></option>
<%
  }
%>
</select>
<%
  if(m!=12) {
%>
<a id="next_month" href="reserve.jsp?yy=<%=y%>&mm=<%=m+1%>">다음달</a>
<% 
  }
  else {	  
%>
<a id="next_month" href="reserve.jsp?yy=<%=y+1%>&mm=<%=1%>">다음달</a>
<%
  }
%>
</div> 
</caption>
<tr class="days_week">
   <td id="sunday">일</td>
   <td>월</td>
   <td>화</td>
   <td>수</td>
   <td>목</td>
   <td>금</td>
   <td id="saturday">토</td>
</tr>   
<%
  int da = 1;
  for(int i=1; i<=5; i++) {
%>
<tr class="days_room">
<%
  for(int j=0; j<7; j++) {
	  // 오늘 날짜와 달력상의 날짜를 비교 (y:년도  m:월 da:일)
	  if((day > j && i == 1) || max_day < da) {
%>
  <td> &nbsp; </td>
<%
  }
  else {
   String sql, nowday;
   ResultSet rs, rs1;
%>
  <td valign=top align=left>
  <span><%=da%></span>
  <%
  LocalDate now_day = LocalDate.now();
  LocalDate cal_day = LocalDate.of(y,m,da);
  int chk = now_day.compareTo(cal_day);
  if(chk <= 0) { // 현재 날짜부터 이후는 보이게(true)
  //room테이블에 있는 방의 갯수만큼 실행 => room테이블을 rs에 가져오기
  sql = "select * from room order by price asc";
  rs = stmt.executeQuery(sql);
  while(rs.next()) {
  nowday = y+"-"+m+"-"+da; 
  sql = "select * from reserve where in_date <= '"+nowday+"' and out_date > '"+nowday+"' and room='"+rs.getString("name")+"'";
  rs1 = stmt1.executeQuery(sql);
  if(rs1.next()) {
  %>
  <p align=center><%=rs.getString("name")%>(unavailable)</p>
  <%
  }
  else {
  %>
  <p align=center><a href="javascript:input_move('<%=rs.getString("name")%>',<%=y%>,<%=m%>,<%=day%>)"><%=rs.getString("name")%>(available)</a></p> 
  <% 
  }
  }
  }
  %>
  </td>
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
</div>
<%@ include file="../bottom.jsp" %>