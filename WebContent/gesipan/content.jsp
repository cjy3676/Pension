<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 게시판 내용 부분 -->	
<%@ page import="java.sql.*"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();

	// id 값 읽어오기
	String id = request.getParameter("id");
	// 출력할 하나의 레코드를 읽어오는 쿼리 작성
	String sql ="select * from gesipan where id="+id;
	// ResultSet으로 가져오기
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<%@ include file="../top.jsp"%>
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
	margin-top: 40px;
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
<div id=section>
		<div id=left><!-- 왼쪽 메뉴(공지사항,게시판,갤러리,QnA) -->
		<ul>
		<li> 로고2 </li>
		<li><a href="../gong/gong_list.jsp"> 공지사항 </a></li>
		<li><a href="../gesipan/list.jsp"> 게시판 </a></li>
		<li><a href="../tour/tour_list.jsp">여행후기</a></li>
		<li> QnA </li>
		</ul>
		</div>
		<div id=right>
		<table width=700 align=center>
		<caption><h3>게시판 읽기</h3></caption>
		<tr height=30>
		<td width=70 align="center">작성자</td>
		<td><%=rs.getString("name") %></td>
		<td width=70 align="center">작성일</td>
		<td><%=rs.getString("writeday") %></td>
		<td width=70 align="center">조회수</td>
		<td><%=rs.getString("rnum") %></td>
		</tr>
		<tr height=30>
		<td width=70 align="center">제목</td>
		<td colspan=5><%=rs.getString("title") %></td>
		</tr>
		<tr height=300>
		<td width=70 align="center">내용</td>
		<td colspan=5><%=rs.getString("content").replace("\r\n","<br>") %></td>
		</tr>
		<tr height=30>
		<td width=70 align="center">혈액형</td>
		<% 
		String blo = "";
		switch(rs.getInt("blood"))
		{
		case 0: blo="A형"; break;
		case 1: blo="B형"; break;
		case 2: blo="O형"; break;
		case 3: blo="AB형"; break;
		}
		%>
		<td><%=blo%></td>
		<td width=70 align="center">취미</td>
		<% // split => 문자를 기준으로 자르는 함수
		String[] hob = rs.getString("hobby").split(",");
		String hobby="";
		for(int i=0;i<hob.length;i++)
			switch(hob[i]) {
			case "0": hobby=hobby+"낚시 "; break;
			case "1": hobby=hobby+"독서 "; break;
			case "2": hobby=hobby+"게임 "; break;
			case "3": hobby=hobby+"노래 "; break;
			case "4": hobby=hobby+"영화 "; break;
			case "5": hobby=hobby+"운동 "; break;
			}
		%>
		<td><%=hobby%></td>
		<td width=70 align="center">나이</td>
		<% // parseInt => 문자형을 숫자형으로 바꾸는 함수
		int age = Integer.parseInt(rs.getString("birth"));
		age = 2019 - age + 1;
		%>
		<td><%=age%>세</td>
		</tr>
		<tr height=30>
		<td colspan=6 align=center>
		<a href="update.jsp?id=<%=id%>">수정</a> 
		<a href="javascript:del()">삭제</a> 
		목록
		</td>
		</tr>
		</table>
	    </div>
	  </div>
	  <div id=del_form><!-- 삭제할때 사용자가 비밀번호를 입력하는 폼 -->
	  <form method=post action=delete.jsp>
	  <input type=hidden name=id value=<%=id%>>
	  비밀번호<input type=password name=pwd> <input type=submit value=삭제>
	  </form>
	  </div>
<%@ include file="../bottom.jsp"%>