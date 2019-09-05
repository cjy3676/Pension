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

	request.setCharacterEncoding("UTF-8");
	String room = request.getParameter("room"); // bang
	String y = request.getParameter("y");
	String m = request.getParameter("m");
	if (m.length() == 1)
		m = "0" + m; // => 1에서 9일 경우 앞에 0을 붙인다
	String d = request.getParameter("d");
	if (d.length() == 1)
		d = "0" + d;
	// DB에서의 날짜형식 => 2019-07-01
	String date = y + "-" + m + "-" + d;

	// 현재 사용자가 선택한 방에 정보를 읽어오기 (숙박금액, 기준인원, 최대인원)
	String sql = "select * from room where name='"+room+"'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<script>
var first = <%=rs.getInt("price")%>; // 숙박요금
var second = 0; // 추가요금
window.onload = function() { // 문서를 읽을때 function() 실행
	// 숙박은 첫번째 option태그이므로 추가해줄 필요X
	// document.cjy.adult.selectedIndex = 1;
	document.cjy.adult.value = <%=rs.getInt("min_in")%>;
	document.getElementById("tot").innerText = "<%=rs.getInt("price")%>";
	document.getElementById("all").innerText = "<%=rs.getInt("price")%>"; // chong
	document.cjy.d_price.value = <%=rs.getInt("price")%>; // suk_price
}
function cal() { // 숙박과 인원을 계산하여 합계급액에 전달
	// 숙박일수 => 숙박일수에 따른 금액
	var d = document.cjy.day.value; // s
	var d_price = d*<%=rs.getInt("price")%>; // s_price
	
	// 총인원 => 총인원에 대한 금액
	var n1 = parseInt(document.cjy.adult.value); // sung
	var n2 = eval(document.cjy.child.value);
	var n_tot = n1 + n2; // inwon
	
	if(n_tot > <%=rs.getInt("max_in")%>) {
		alert("바보");
		document.cjy.adult.selectedIndex = 1;
		document.cjy.child.selectedIndex = 0;
		n_tot = <%=rs.getInt("min_in")%>;

	}
	
		var n_add = n_tot - <%=rs.getInt("min_in")%>; // chuga
		if(n_add > 0)
			var n_price = n_add * 10000; // in_price
		else 
			var n_price = 0;
		
		// tot인 곳에 총 급액을 전달
		first = d_price + n_price;
		document.cjy.d_price.value = first; // type = hidden
		document.getElementById("all").innerText = comma(first + second); // chong
		var tot_price = comma(d_price + n_price);
		document.getElementById("tot").innerText = tot_price; 
}
function comma(price) {
	price = price + "";
	price = price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	return price;
}
function extra_cal() { // chuga_cal
 	if(document.cjy.spa.checked)
	var p1 = parseInt(document.cjy.spa.value);
	else
		var p1 = 0;
	
	if(document.cjy.charo.checked) // 숯불 세트
	var p2 = parseInt(document.cjy.charo.value);
	else
		var p2 = 0;
	
	if(document.cjy.bbq.checked)
	var p3 = parseInt(document.cjy.bbq.value);
	else
		var p3 = 0; 
/* 	for(i=0; i <=2; i++) {
		if(document.cjy.ch[i].checked)
			var p(i+1) = parseInt(document.cjy.ch[i].value);
			else
				var p(i+1) = 0;
	} */	
	second = p1+p2+p3;
	document.cjy.ex_price.value = second; // chu_price(추가요금)
	document.getElementById("all").innerText = comma(first + second);
	document.getElementById("extra").innerText = comma(p1+p2+p3);
}
</script>
<div id="section">
<form name="cjy" method=post action=input_ok.jsp>
	<input type="hidden" name="d_price"> 
	<input type="hidden" name="ex_price"> 
	<input type=hidden name=room value="<%=room%>"> 
	<input type=hidden name=y value="<%=y%>">
	<input type=hidden name=m value="<%=m%>"> 
	<input type=hidden name=d value="<%=d%>">
	
<table width=700 align=center>
	<tr>
	   <td>예약 방</td>
	   <td><%=room%></td>
	</tr>
	<tr>
	   <td>예약자</td>
	   <td><input type=text name=name></td>
	</tr>
	<tr>
	   <td>전화번호</td>
	   <td><input type=text name=phone></td>
	</tr>
	<tr>
	   <td>입실</td>
	   <td><%=date%></td>
	</tr>
	<tr>
	   <td colspan="2">
	<hr>  기준2명 / 최대 <%=rs.getInt("max_in")%>명 <!-- room 테이블에 있는 필드값으로 변경 -->
	<!-- 조건 1 : 1박 기준 가격 => 150,000원
	 조건 2 : 기준인원 2명 => 최대인원 6명 
	 추가 가능 => 4명 (추가 1인당 : 10,000원) 문서를 처음 읽을때
	 - 1박 금액
	 - 기준 인원 2명(성인 2명)--> 
	 <select name="day" onchange="cal()">
		<option value="1">1박</option>
		<option value="2">2박</option>
		<option value="3">3박</option>
		<option value="4">4박</option>
	 </select> 
	 성인<select name="adult" onchange="cal()">
		<option value="1">1명</option>
		<option value="2">2명</option>
		<option value="3">3명</option>
		<option value="4">4명</option>
		<option value="5">5명</option>
		<option value="6">6명</option>
	</select> 
	
	아동 <select name="child" onchange="cal()">
		<option value="0">0명</option>
		<option value="1">1명</option>
		<option value="2">2명</option>
		<option value="3">3명</option>
		<option value="4">4명</option>
		<option value="5">5명</option>
		<option value="6">6명</option>
	 </select>
					
	 <p style="margin-left: 400px">숙박금액 : <span id="tot"></span>원
	 <hr> 
	 <input type="checkbox" name="spa" onclick="extra_cal()" value="25000">수영장 이용 25,000원
	 <p>
	 <input type="checkbox" name="charo" onclick="extra_cal()" value="30000">숯불 세트 30,000원
	 <p>
	 <input type="checkbox" name="bbq" onclick="extra_cal()" value="50000">바베큐 세트 50,000원
	 <p>
	 <p style="margin-left: 400px">추가금액 : <span id="extra">0</span>원
	 <hr>			
	 <p style="margin-left: 400px">총합계금액 : <span id="all"></span>원
	 </td>
   </tr>
   <tr>
	  <td colspan=2 align=center><input type=submit value=예약></td>
   </tr>
</table>
</form>
</div>