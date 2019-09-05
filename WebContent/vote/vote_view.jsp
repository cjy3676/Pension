<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();
	
	// 투표 레코드를 읽어오기
	String sql = "select * from vote where id = 1";
	// ResultSet에 가져오기
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	// 전체투표수를 계산
	double total = rs.getInt("a1")+rs.getInt("a2")+rs.getInt("a3")+rs.getInt("a4")+rs.getInt("a5")+rs.getInt("a6")+rs.getInt("a7");
    
	int a1 = (int)((rs.getInt("a1")/total)*100);
	int a2 = (int)((rs.getInt("a2")/total)*100);
	int a3 = (int)((rs.getInt("a3")/total)*100);
	int a4 = (int)((rs.getInt("a4")/total)*100);
	int a5 = (int)((rs.getInt("a5")/total)*100);
	int a6 = (int)((rs.getInt("a6")/total)*100);
	int a7 = (int)((rs.getInt("a7")/total)*100);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#aa, #bb, #cc, #dd, #ee, #ff, #gg {
width: 0px;
height:25px;
background: salmon;
}
#aa {
width:<%=a1*4%>px;
}
#bb {
width:<%=a2*4%>px;
}
#cc {
width:<%=a3*4%>px;
}
#dd {
width:<%=a4*4%>px;
}
#ee {
width:<%=a5*4%>px;
}
#ff {
width:<%=a6*4%>px;
}
#gg {
width:<%=a7*4%>px;
}
</style>
</head>
<body>
<table width=550>
<tr>
<td width=150>아이언맨</td>
<td width=420><div id=aa></div></td>
</tr>
<tr>
<td>스파이더맨</td>
<td><div id=bb></div></td>
</tr>
<tr>
<td>헐크</td>
<td><div id=cc></div></td>
</tr>
<tr>
<td>토르</td>
<td><div id=dd></div></td>
</tr>
<tr>
<td>캡틴 아메리카</td>
<td><div id=ee></div></td>
</tr>
<tr>
<td>닥터 스트레인지</td>
<td><div id=ff></div></td>
</tr>
<tr>
<td>블랙 팬서</td>
<td><div id=gg></div></td>
</tr>
</table>
</body>
</html>