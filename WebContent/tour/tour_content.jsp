<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>    
<%
    String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();
	
	String id = request.getParameter("id");
	
	// 쿼리작성 => 하나의 레코드만 읽어오는 쿼리
	String sql = "select * from tour where id="+id;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<%@ include file="../top.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function del() {
	document.all.del_form.style.visibility="visible";
}
</script>
<style>
#section {
	width: auto;
	height: 600px;
	margin: auto;
    display: flex;
	justify-content: center;
}

#section #left { /* 왼쪽 메뉴 나오는 부분 */
	width: 300px;
	height: 600px;
	background: red;
	float: left;
}

#section #left li {
	width: 250px;
	height: 39px;
	list-style-type: none;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: center;
	padding-top: 22px;
}

#section #left ul {
	padding-left: 27px;
}

#section #right { /* 공지사항 리스트 나오는 부분 */
	width: 900px;
	height: 600px;
	background: #FAFAFA;
	float: left;
}

#section #right table{
	border: 1px solid black;
	margin-top: 30px;
}

#section #right td, tr{
	border: 1px solid black;
	margin: auto; 
}

#section a {
	color: #000000;
	text-decoration: none;
}

#del_form {
position:absolute;
left: 600px;
top: 600px;
width:200px;
height:50px;
background:#eee;
visibility: hidden;
}
</style>
</head>
<body>
	<div id=section>
		<!-- 왼쪽 메뉴(공지사항,게시판,갤러리,QnA) -->
		<div id=left>
			<ul>
				<li>로고2</li>
				<li><a href="../gong/gong_list.jsp"> 공지사항 </a></li>
				<li><a href="../gesipan/list.jsp"> 게시판 </a></li>
				<li><a href="../tour/tour_list.jsp">여행후기</a></li>
				<li>QnA</li>
			</ul>
		</div>

		<!-- 여행후기 내용 부분 -->
		<div id="right">
			<table width="600" align="center">
			<caption><h3>여행후기 읽기</h3></caption>
				<tr height="30">
				  <td width="70" align="center">작성자</td>
				  <td><%=rs.getString("name")%></td>
				  <td width="70" align="center">작성일</td>
				  <td><%=rs.getString("writeday")%></td>
				  <td width="70" align="center">조회수</td>
				  <td><%=rs.getString("rnum")%></td>
				</tr>
				<tr height="30">
				  <td width="70" align="center">제목</td>
				  <td colspan="5"><%=rs.getString("title")%></td>
				</tr>
				<tr height="300">
				  <td width="70" align="center">내용</td>
				  <td colspan="5"><img src="../img/<%=rs.getString("fname")%>"><br>
				  <%=rs.getString("content").replace("\r\n","<br>")%>
				  </td>
				</tr>
				<tr height="30">
				  <td colspan="6" align="center">
				    <a href="tour_update.jsp?id=<%=id%>">수정</a>
				    <a href="tour_list.jsp?id=<%=id%>">목록</a>
				    <a href="tour_delete.jsp?id=<%=id%>">삭제</a>
				  </td>
				</tr>
			</table>
		</div>
	</div>
<%-- 	<div id=del_form>
		<!-- 삭제할때 사용자가 비밀번호를 입력하는 폼 -->
		<form method=post action=tour_delete.jsp>
			<input type=hidden name=id value=<%=id%>> 비밀번호<input
				type=password name=pwd> <input type=submit value=삭제>
		</form>
	</div> --%>
</body>
</html>
<%@ include file="../bottom.jsp"%>