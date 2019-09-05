<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 게시판 수정 확인 부분 -->
<%@ page import="java.sql.*"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();
	
	// 수정할 레코드의 값 읽어오기
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	String blood = request.getParameter("blood");
	String birth = request.getParameter("birth");
	String[] hobby = request.getParameterValues("hobby");
	String hob = "";
	for(int i=0;i<hobby.length;i++)
	{
		hob=hob+hobby[i]+",";
	}
	// DB에 있는 비밀번호를 읽어오기 (현재 수정하고자 하는  레코드의 pwd)
	String sql = "select * from gesipan where id="+id;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	// 비밀번호가 맞는지 확인
	if(pwd.equals(rs.getString("pwd"))) {
	// 1. 비밀번호가 맞을 때 > 수정할 쿼리를 작성 > 쿼리 실행 > content.jsp로 이동
	sql="update gesipan set title = '"+title+"', content='"+content+"', blood="+blood+", birth='"+birth+"', hobby='"+hob+"' where id="+id;
	stmt.executeUpdate(sql);
	response.sendRedirect("content.jsp?id="+id);
	}
	else {
	%>
	<script>
	alert("비밀번호가 틀립니다");
	location="update.jsp?id="+<%=id%>;
	</script>
	<% 
	}
	%>	