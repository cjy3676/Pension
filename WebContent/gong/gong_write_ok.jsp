<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 공지사항 작성 확인 부분 -->	
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

	// 입력값 가져오기
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String writeday = sdf.format(today);
	// 공지사항 입력쿼리 작성
	String sql = "insert into gongji(title,content,writeday,rnum)";
	sql = sql + "value('"+title+"','"+content+"','"+writeday+"',0)";
	// 입력쿼리 실행
	stmt.executeUpdate(sql);
	// 쿼리 실행 후 gong_list.jsp로 이동
	response.sendRedirect("gong_list.jsp");
	
	stmt.close();
	conn.close();
%>