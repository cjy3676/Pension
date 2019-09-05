<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 게시판 리스트 부분 -->	
<%@ page import="java.sql.*"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();

	String sql = "select * from gesipan order by id desc";
	ResultSet rs = stmt.executeQuery(sql);
%>
<%@ include file="../top.jsp"%>
<style>
#section {
	width: 1200px;
	height: 600px;
	margin: auto;
}

#section #left { /* 왼쪽 메뉴 나오는 부분 */
	width: 300px;
	height: 600px;
	background: red;
	float: left;
}

#section #left li {
	width: 280px;
	height: 60px;
	list-style-type: none;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: center;
	align-item: center;
}

#section #right { /* 공지사항 리스트 나오는 부분 */
	width: 900px;
	height: 600px;
	background: #FAFAFA;
	float: left;
}

#section #right #list_name {
	height: 60px;
	text-align: center;
	font-size: 34px;
	margin-left: 35px;
	margin_top: 20px;
}

#section #right #first td {
	height: 40px;
	border-top: 2px solid #bbb;
	border-bottom: 1px solid #bbb;
}

#section #right #second td {
	height: 30px;
	border-bottom: 1px solid #ddd;
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
		    <div id=list_name> 게시판 </div>
		<table cellspacing=0 width=800 align=center>
			<caption style="text-align: right">
				<a href="write.jsp"> 글쓰기 </a>
			</caption>
			<tr id=first align=center>
				<td>번호</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr id=second align=center>
				<td><%=rs.getString("id")%></td>
				<td align=center> <!-- 제목을 클릭하면 조회수를 증가시키기 위해서 rnum_add.jsp 사용 -->
				<a href="rnum_add.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a></td>
				<td>펜션지기</td>
				<td><%=rs.getString("writeday")%></td>
				<td><%=rs.getString("rnum")%></td>
				<%
					if (session.getAttribute("userid") != null)
							if (session.getAttribute("userid").equals("admin")) {
				%>
				<td><a href="delete.jsp?id=<%=rs.getString("id")%>">삭제</a></td>
		    <%
			   }
			%>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	</div>
<%@ include file="../bottom.jsp"%>