<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();

	request.setCharacterEncoding("UTF-8");
	String g_id = request.getParameter("g_id");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String writeday = sdf.format(today);

	String sql = "insert into gong_dat(name,content,writeday,g_id) ";
	sql = sql + " values(?,?,?,?)";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, content);
	pstmt.setString(3, writeday);
	pstmt.setString(4, g_id);
	pstmt.executeUpdate();

	pstmt.close();
	conn.close();

	// gong_content.jsp로 이동
	response.sendRedirect("gong_content.jsp?id="+g_id);
%>