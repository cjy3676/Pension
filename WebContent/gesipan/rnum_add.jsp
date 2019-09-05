<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 게시판 조회수 부분 -->	
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
	// 조회수 증가 쿼리 작성
	String sql = "update gesipan set rnum = rnum + 1 where id="+id;
	// 쿼리 실행
	stmt.executeUpdate(sql);
	//content.jsp로 이동
	response.sendRedirect("content.jsp?id="+id);
	
	stmt.close();
	conn.close();
%>