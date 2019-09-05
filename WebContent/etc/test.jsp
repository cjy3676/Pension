<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
/* 	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();
	
	String sql = "create table cjy(aa int)";
	stmt.executeUpdate(sql);
	stmt.close();
	conn.close(); */
	
	if(true)
		out.print("1");
	else
		out.print("0");
%>
