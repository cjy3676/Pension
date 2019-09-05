<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 게시판 작성 확인 부분 -->		
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();

	// 입력값 가져오기
	request.setCharacterEncoding("UTF-8");
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String writeday = sdf.format(today);
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("content");
	String blood = request.getParameter("blood");
	String birth = request.getParameter("birth");
	String[] hobby = request.getParameterValues("hobby");
	String hob = "";
	for(int i=0;i<hobby.length;i++)
	{
		hob=hob+hobby[i]+",";
	}
	// 쿼리 작성
	String sql = "insert into gesipan(name,title,pwd,content,blood,hobby,birth,writeday)";
	sql = sql + "values('"+name+"','"+title+"','"+pwd+"','"+content+"',"+blood+",'"+hob+"','"+birth+"','"+writeday+"')";
	// 쿼리 실행
	stmt.executeUpdate(sql);
	// list.jsp로 이동
	response.sendRedirect("list.jsp");
	stmt.close();
	conn.close();
%>