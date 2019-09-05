<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 공지사항을 삭제하는 부분 -->	
<%@ page import="java.sql.*"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();
	
	// 삭제하고자 하는 레코드의 id값을 가져오기
	String id = request.getParameter("id"); // get으로 보낸다
	
	// 삭제쿼리 작성
	String sql = "delete from gongji where id="+id;
	
	// 삭제 실행
	stmt.executeUpdate(sql);
	
	// gong_list.jsp로 이동
	response.sendRedirect("gong_list.jsp");
	
	// close()
	stmt.close();
	conn.close();
%>