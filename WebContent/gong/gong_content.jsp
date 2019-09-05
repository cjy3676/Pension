<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 공지사항 내용 부분 -->	
<%@ page import="java.sql.*"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();

	// gong_content.jsp => 1개의 레코드만 가져와야 전부 보여준다
	// 가져올 레코드의 기본키인 id값을 가져오기
	String id = request.getParameter("id");
	// 퀴리 작성
	String sql = "select * from gongji where id=" + id;
	// ResultSet에 해당 레코드 가져오기
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<%@ include file="../top.jsp"%>
<script>
var xml = new XMLHttpRequest();
function del(id) {
	xml.open("get","dat_delete.jsp?id="+id);
	xml.send();
}
xml.onreadystatechange = function() {
	if(xml.readyState == 4) {
		if(xml.responseText.trim() == "ok")
			location.reload();
	}
}
function dat_update(n,c,d) {
	// 댓글 입력폼을 수정폼으로 변경
	// 이름, 내용, gong_dat의 id값을 value에 전달
	document.input.name.value = n;
	document.input.content.value = c;
	document.input.g_id.value = d;
	document.input.action = "dat_update_ok.jsp";
	document.input.sub.value = "수정";
}
</script>
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

#section #right table{
	border: 1px solid black;
	margin-top: 30px;
}

#section #right td, tr{
	border: 1px solid black;
	margin: auto; 
}

/* #section #right #list_name {
	height: 60px;
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
	border-bottom: 1px solid black;
} */

#left a {
	color: #000000;
	text-decoration: none;
}
</style>
<div id=section>
	<div id=left>
		<!-- 왼쪽 메뉴(공지사항,게시판,갤러리,QnA) -->
		<ul>
			<li>로고2</li>
			<li><a href="../gong/gong_list.jsp"> 공지사항 </a></li>
			<li><a href="../gesipan/list.jsp"> 게시판 </a></li>
			<li><a href="../tour/tour_list.jsp">여행후기</a></li>
			<li>QnA</li>
		</ul>
	</div>
	
	<div id="right">
		<table width="500" height="300" align="center">
		<caption><h3>공지사항 읽기</h3></caption>
			<tr>
			    <td align="center" height="30"> 제목 </td>
				<td height="30" colspan="6"><%=rs.getString("title")%></td>
			</tr>
			<tr align="center">
				<td height="30">작성자</td>
				<td colspan="2" height="30"><b>관리자</b></td> 
				<td colspan="1" height="30"><%=rs.getString("writeday")%></td> 
				<td height="30">조회수</td> 
				<td height="30"><%=rs.getString("rnum")%></td>
			</tr>
			<tr height="200">
			    <td align="center">내용</td>
				<td colspan="5"><%=rs.getString("content").replace("\r\n","<br>")%></td>
			</tr>
			<tr align="center">
			<td colspan="6" height="30"><a href="gong_list.jsp">목록가기</a></td>
			</tr>
		<tr>
		<td colspan="6" height="30" align="center">
		수정 : 이름 클릭 || 삭제 : 날짜 클릭
		</td>
		</tr>
		<%
		// 댓글 테이블에서 불러오기
		sql = "select * from gong_dat where g_id="+id+" order by id desc";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) { // 댓글 레코드가 존재하는 만큼 출력
		%>
		<tr align="center" width="500" height="40"><!-- 댓글 출력폼 -->
		   <td colspan="2" width="100">
		   <a href="javascript:dat_update()"><%=rs.getString("name")%></a>
		   </td>
		   <td colspan="2"><%=rs.getString("content")%></td>
		   <td colspan="2" width="100">
		   <a href="javascript:del(<%=id%>)"><%=rs.getString("writeday")%></a>
		   </td>
		</tr>
		<%
		}
		%>
		 <tr><!-- 댓글 입력폼 -->
		 <td colspan="6" align="center" height="50">
		 <form name="input" method="post" action="dat_input_ok.jsp">
		 <input type="hidden" name=g_id value=<%=id%>>
		 <input type="text" name="name" placeholder="이름" size="6">
		 <textarea cols="40" rows="2" name="content" placeholder="내용입력"></textarea>
		 <input name="sub" type="submit" value="댓글">
		 </form>
		 </td>
		 </tr>
		</table>
	</div>
</div>
<%@ include file="../bottom.jsp"%>