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

	// 선택한 값을 가져오기
	String hero = request.getParameter("hero");
	// 투표가 된 필드의 값을 1 증가
	String sql = "";
	switch(hero)
	{
	case "1": sql = "update vote set a1=a1+1 where id=1"; break;
	case "2": sql = "update vote set a2=a2+1 where id=1"; break;
	case "3": sql = "update vote set a3=a3+1 where id=1"; break;
	case "4": sql = "update vote set a4=a4+1 where id=1"; break;
	case "5": sql = "update vote set a5=a5+1 where id=1"; break;
	case "6": sql = "update vote set a6=a6+1 where id=1"; break;
	case "7": sql = "update vote set a7=a7+1 where id=1"; break;
	}
	stmt.executeUpdate(sql);
%>