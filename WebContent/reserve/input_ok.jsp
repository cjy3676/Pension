<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 예약 입력 저장 부분 -->	
<%@ page import="java.sql.*"%>
<%@page import="java.util.Date" %> 
<%@page import="java.text.SimpleDateFormat"%> 
<%@page import="java.time.LocalDate" %>
<%
	// DB 연결및 쿼리를 사용할
	String aa = "jdbc:mysql://localhost:3307/pension?useSSL=false";
	String bb = "root";
	String cc = "1234";
	Connection conn = DriverManager.getConnection(aa, bb, cc);
	Statement stmt = conn.createStatement();

	// 값읽어오기
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String room = request.getParameter("room");
	int y = Integer.parseInt(request.getParameter("y"));
	int m = Integer.parseInt(request.getParameter("m"));
	int d = Integer.parseInt(request.getParameter("d"));
	int night = Integer.parseInt(request.getParameter("night"));
	int adult = Integer.parseInt(request.getParameter("adult"));
	int child = Integer.parseInt(request.getParameter("child"));
	int n_tot = adult + child;
	String spa = request.getParameter("spa");
	String charo = request.getParameter("charo");
	String bbq = request.getParameter("bbq");
	String d_price = request.getParameter("d_price");
	String ex_price = request.getParameter("ex_price");
	
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String writeday = sdf.format(today);
	
	// 퇴실일 계산
	LocalDate in_date = LocalDate.of(y,m,d);
	LocalDate out_date = in_date.plusDays(night);
	
	// 쿼리문 작성
	String sql = "insert into reserve(name,phone,room,in_date,out_date,writeday";
	sql = sql + ",n_tot,spa,charo,bbq,d_price,ex_price) ";
	sql = sql + " values('"+name+"','"+phone+"','"+room+"','"+in_date;
	sql = sql + "','"+out_date+"','"+writeday+"',"+n_tot+",";
    sql = sql + spa+ "," +charo+","+bbq+","+d_price+","+ex_price+")";
	
	// 쿼리문 실행
	stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();
	response.sendRedirect("reserve.jsp");
%>
